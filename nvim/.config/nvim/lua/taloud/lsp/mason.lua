local mason_ok, mason = pcall(require, "mason")
local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not (mason_status_ok or mason_ok) then
  vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
  return
end

-- Extension to bridge mason.nvim with the lspconfig plugin
mason.setup()
mason_lspconfig.setup({
  -- A list of servers to automatically install if they're not already installed.
  ensure_installed = { "ansiblels", "cssls", "dockerls", "eslint", "graphql", "html", "intelephense",
  "jsonls", "sumneko_lua","tsserver", "vimls", "yamlls","phpactor","eslint_d", "prettierd", "php-cs-fixer" },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
  return
end

local opts = {
  on_attach = require("taloud.lsp.handlers").on_attach,
  capabilities = require("taloud.lsp.handlers").capabilities,
}

mason_lspconfig.setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- Default handler (optional)
    lspconfig[server_name].setup {
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
    }
  end,

  -- Next, you can provide targeted overrides for specific servers.
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,

      settings = {
        Lua = {
          -- Tells Lua that a global variable named vim exists to not have warnings when configuring neovim
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
})
