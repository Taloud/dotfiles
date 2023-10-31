require "taloud.disable_builtin";
require "taloud.set";
require "taloud.remap";
require "taloud.autocmds";
require "taloud.plugins";

-- Sessionizer
vim.keymap.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', { silent = true, noremap = true })
