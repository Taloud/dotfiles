local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "taloud.lsp.lsp-installer"
require("taloud.lsp.handlers").setup()
require "taloud.lsp.null-ls"
