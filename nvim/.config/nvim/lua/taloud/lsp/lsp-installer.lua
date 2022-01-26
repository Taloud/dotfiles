local status_ok, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not status_ok then
  return
end

-- Auto install used server
local lspServers = {
  ansiblels = {},
  cssls = {},
  diagnosticls = {},
  dockerls = {},
  eslint = {},
  html = {},
  intelephense = {},
  jsonls = {},
  -- phpactor = {} only use intelephense for now,
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'},
        }
      }
    }
  },
  tsserver = {},
  vimls = {},
  yamlls = {},
}

for lspServer, opts in pairs(lspServers) do
  local server_available, requested_server = lsp_installer_servers.get_server(lspServer)
  if server_available then
      requested_server:on_ready(function (server)
       local opts = {
                  on_attach = require("taloud.lsp.handlers").on_attach,
                  capabilities = require("taloud.lsp.handlers").capabilities,
       }

          -- table.insert(opts, {
          --   on_attach = require("taloud.lsp.handlers").on_attach,
          --   capabilities = require("taloud.lsp.handlers").capabilities,
          -- })

          requested_server:setup(opts)
      end)
      if not requested_server:is_installed() then
          -- Queue the server to be installed
          requested_server:install()
      end
  end
end
