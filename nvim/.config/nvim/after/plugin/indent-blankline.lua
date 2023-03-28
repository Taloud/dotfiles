local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent.setup({
  filetype_exclude = {
    'help',
    'terminal',
    'dashboard',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
  },
  buftype_exclude = {
    'terminal',
    'NvimTree',
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  char = '┊',
  char_blankline = "",
  show_current_context = true,
})
