 return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
            'bash', 'comment', 'css', 'diff', 'dockerfile', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit',
            'gitignore', 'html', 'http', 'ini', 'javascript', 'json', 'jsonc', 'lua', 'make', 'markdown', 'php',
            'phpdoc', 'regex', 'sql', 'typescript', 'vim', 'yaml', "tsx", "twig", "typescript"
         },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
          autopairs = {
            enable = false,
          },
          context_commentstring = {
            enable = true,
          },
          rainbow = {
            enable = true,
          },
        })
    end,
  },
}
