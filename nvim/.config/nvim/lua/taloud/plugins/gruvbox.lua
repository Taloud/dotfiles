return {
  'sainnhe/gruvbox-material',
  dependencies = {
    'gruvbox-community/gruvbox',
  },
  lazy = false,
  priority = 1000,
  config = function (plugin, opts)
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_italic=1
    vim.g.gruvbox_material_diagnostic_text_highlight = 1
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_current_word = 'grey background'
    vim.cmd([[colorscheme gruvbox-material]])
  end,
}
