return {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        cssls = {},
        cssmodules_ls = {} ,
        -- eslint = {},
        html = {},
        intelephense = {},
        jsonls = {},
        -- phpactor = {},
        tailwindcss = {},
        tsserver = {},
        volar = {}
      },
    },
  }
