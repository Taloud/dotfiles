local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "✗ " },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "'" },
  }


  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    signs = false, -- see below for sign override
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local nmap = require("taloud.keymap").nmap

local buf_nnoremap = function(opts)
  opts.buffer = 0
  nmap(opts)
end

local function lsp_keymaps(bufnr)

  -- All remaps are in telescope !
  buf_nnoremap { "<leader>rn", vim.lsp.buf.rename }
  buf_nnoremap { "gk", vim.diagnostic.open_float }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent= true})

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]]
end


local disable_format_servers = {['tsserver'] = true, ['phpcsfixer'] = true, ['cssls'] = true}

M.on_attach = function(client, bufnr)
  -- Disable formatter for listed servers
  if disable_format_servers[client.name] then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

-----------------------------------------------------------------------------//
-- Highlight on hover
-----------------------------------------------------------------------------//
local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = vim.lsp.buf.document_highlight,
  group = group,
})
vim.api.nvim_create_autocmd("CursorMoved", {
  callback = vim.lsp.buf.clear_references,
  group = group,
})

-----------------------------------------------------------------------------//
-- Signs
-----------------------------------------------------------------------------//

---Override diagnostics signs helper to only show the single most relevant sign
---@see: http://reddit.com/r/neovim/comments/mvhfw7/can_built_in_lsp_diagnostics_be_limited_to_show_a
---@param diagnostics table[]
---@return table[]
local function filter_diagnostics(diagnostics)
  if not diagnostics then
    return {}
  end
  -- Work out max severity diagnostic per line
  local max_severity_per_line = {}
  for _, d in pairs(diagnostics) do
    local lnum = d.lnum
    if max_severity_per_line[lnum] then
      local current_d = max_severity_per_line[lnum]
      if d.severity < current_d.severity then
        max_severity_per_line[lnum] = d
      end
    else
      max_severity_per_line[lnum] = d
    end
  end

  -- map to list
  local filtered_diagnostics = {}
  for _, v in pairs(max_severity_per_line) do
    table.insert(filtered_diagnostics, v)
  end
  return filtered_diagnostics
end

--- This overwrites the diagnostic show/set_signs function to replace it with a custom function
--- that restricts nvim's diagnostic signs to only the single most severe one per line
local ns = vim.api.nvim_create_namespace 'severe-diagnostics'
local show = vim.diagnostic.show
local function display_signs(bufnr)
  -- Get all diagnostics from the current buffer
  local diagnostics = vim.diagnostic.get(bufnr)
  local filtered = filter_diagnostics(diagnostics)
  show(ns, bufnr, filtered, {
    virtual_text = false,
    underline = false,
    signs = true,
  })
end

function vim.diagnostic.show(namespace, bufnr, ...)
  show(namespace, bufnr, ...)
  display_signs(bufnr)
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
