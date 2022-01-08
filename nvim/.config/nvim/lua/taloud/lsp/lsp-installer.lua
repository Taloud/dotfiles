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
  phpactor = {},
  sumneko_lua = {},
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

         if server.name == "jsonls" then
           local jsonls_opts = require("taloud.lsp.settings.jsonls")
           opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
         end

         if server.name == "sumneko_lua" then
           local sumneko_opts = require("taloud.lsp.settings.sumneko_lua")
           opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
         end

          requested_server:setup(opts)
      end)
      if not requested_server:is_installed() then
          -- Queue the server to be installed
          requested_server:install()
      end
  end
end
