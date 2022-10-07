local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent.setup({
    char = '┊',
    char_blankline = "",
    show_current_context = true,
  })
