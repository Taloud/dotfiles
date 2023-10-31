return {
  'glepnir/dashboard-nvim',
  opts = {
    theme = 'doom',
    config = {
      header = {
        '',
        '',
        '',
        ' ______     ______________',
        '|######|   |#############W',
        '|######|   |############W ',
        '|######|   |###########   ',
        '|######|   |###### ¯¯¯    ',
        '|#####################|   ',
        '|#####################|   ',
        '|######|   |######|       ',
        '|######|   |######|       ',
        '|######|   |######|       ',
        '|######|   |######|       ',
        ' ¯¯¯¯¯¯     ¯¯¯¯¯¯        ',
        '',
        '',
      },
      center = {
        { icon = '  ', desc = 'New file', action = 'enew' },
        { icon = '  ', desc = 'Find file               ', key = 'Control + p', action = 'Telescope find_files' },
        { icon = '  ', desc = 'Find Word               ', key = 'Space + ps', action = 'Telescope live_grep' },
      },
      footer = { '' }
    },
    hide = {
      statusline = false,
      tabline = false,
      winbar = false,
    }
  },
  init = function()
    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
    vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#f8f8f2' })
    vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#bd93f9' })
    vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#6272a4' })
    vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
  end,
}
