vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Sexplorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Vim movement for windows
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>')

-- Allow gf to open non-existent files
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Disable annoying command line thing
vim.keymap.set('n', 'q:', ':q<CR>')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- Make Y behave like the other capitals
vim.keymap.set('n', 'Y', 'y$')

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste replace visual selection without copying it
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete visual selection without copying it
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- No one use this TBH
vim.keymap.set("n", "Q", "<nop>")

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep the search and movement centered in the screen
vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Format code
-- vim.keymap.set("n", "<leader>by", vim.lsp.buf.format)
-- vim.keymap.set('n', '<leader>by', ':Format<CR>')

-- Undo breakpoints
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')

-- Replace word under cursor with regexp
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Quick fix list up and down
vim.keymap.set('n', '<C-j>', ':cnext<CR>zz')
vim.keymap.set('n', '<C-K>', ':cprev<CR>zz')

-- map <esc> to C-c
vim.keymap.set('i', '<C-c>', '<esc>')

-- git TODO: change place
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gh", ":diffget //3<CR>")
vim.keymap.set("n", "<leader>gu", ":diffget //2<CR>")

vim.cmd([[com! W w]])

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
