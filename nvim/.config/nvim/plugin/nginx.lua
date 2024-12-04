vim.filetype.add {
  pattern = {
    [".*%.conf"] = "nginx",
    [".*%.conf.template"] = "nginx",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nginx",
  callback = function()
    require("nvim-treesitter.parsers").get_parser_configs().nginx = {
      install_info = {
        url = "https://github.com/nvim-treesitter/tree-sitter-nginx",
        files = { "src/parser.c" },
      },
    }
    vim.treesitter.language.register("nginx", "nginx")
  end,
})
