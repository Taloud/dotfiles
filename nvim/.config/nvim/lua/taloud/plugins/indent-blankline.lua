return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    whitespace = {
      remove_blankline_trail = false,
    },
    scope = {
      char = '┊',
      show_start = false,
    },

    exclude = {
      filetypes = {
        'dashboard',
      },
    },
  }
}
