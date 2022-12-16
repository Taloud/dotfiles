-- local imap = require("taloud.keymap").imap
local nmap = require("taloud.keymap").nmap

local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local lspconfig_util = require "lspconfig.util"

local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
  nvim_status = nil
end

-- local handlers = require "taloud.lsp.handlers"

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local augroup_format = vim.api.nvim_create_augroup("my_lsp_format", { clear = true })
local autocmd_format = function(async, filter)
  vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    callback = function()
      vim.lsp.buf.format { async = async, filter = filter }
    end,
  })
end

local filetype_attach = setmetatable({
  go = function()
    autocmd_format(false)
  end,

  scss = function()
    autocmd_format(false)
  end,

  css = function()
    autocmd_format(false)
  end,

  typescript = function()
    autocmd_format(false, function(client)
      return client.name ~= "tsserver"
    end)
  end,
}, {
  __index = function()
    return function() end
  end,
})

local buf_nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  nmap(opts)
end

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  if nvim_status then
    nvim_status.on_attach(client)
  end

  buf_nnoremap { "<leader>rn", vim.lsp.buf.rename }
  buf_nnoremap { "gk", vim.diagnostic.open_float }
  buf_nnoremap { "K", vim.lsp.buf.hover, { desc = "lsp:hover" } }
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]]

  -- buf_nnoremap { "<space>gI", handlers.implementation }

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
    -- Attach any filetype specific options to the client
  filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
if nvim_status then
  updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
end
updated_capabilities = require("cmp_nvim_lsp").default_capabilities(updated_capabilities)

-- TODO: check if this is the problem.
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

-- vim.lsp.buf_request(0, "textDocument/codeLens", { textDocument = vim.lsp.util.make_text_document_params() })

local servers = {

  -- Also uses `shellcheck` and `explainshell`
  bashls = true,

  eslint = true,
  gdscript = true,
  -- graphql = true,
  html = true,
  pyright = true,
  vimls = true,
  yamlls = true,
  intelephense = true,
  dockerls = true,
  graphql = true,
  sqls = true,
  jsonls = true,
  cmake = (1 == vim.fn.executable "cmake-language-server"),
  dartls = pcall(require, "flutter-tools"),

  cssls = true,
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },

    on_attach = function(client)
      custom_attach(client)
    end,
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, config)

  lspconfig[server].setup(config)
end

  -- Load lua configuration from nlua.
-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
--   on_init = custom_init,
--   on_attach = custom_attach,
--   capabilities = updated_capabilities,
--
--   -- Include globals you want to tell the LSP are real :)
--   globals = {
--     -- Colorbuddy
--     "Color", "c", "Group", "g", "s",
--   }
-- })
--
for server, config in pairs(servers) do
  setup_server(server, config)
end

local use_null = true
if use_null then
  require("null-ls").setup {
    sources = {
      -- require("null-ls").builtins.formatting.stylua,
      -- require("null-ls").builtins.diagnostics.eslint,
      -- require("null-ls").builtins.completion.spell,
      -- require("null-ls").builtins.diagnostics.selene,
      require("null-ls").builtins.formatting.prettierd.with({ -- Use prettier for css and scss formating
        extra_args = {"--single-quote"},
        filetypes = {"css","scss"}
      }),
      -- require("null-ls").builtins.formatting.phpcsfixer, -- use phpCsFixer for php file format instead of Intelephense
      require("null-ls").builtins.formatting.eslint,
    },
  }
end

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
