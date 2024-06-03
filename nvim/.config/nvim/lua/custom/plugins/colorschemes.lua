return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        keywords = { italic = true },
        -- comments = { reverse = true, bold = false },
        functions = { italic = true },
        variables = { italic = true, bold = false },
      },
    }
    vim.cmd [[colorscheme tokyonight]]
  end,
}
