-- Disable autoformat for files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })

vim.cmd "autocmd FileType * setlocal winblend=0" -- Ajustez le niveau de transparence selon votre préférence
local augroup = vim.api.nvim_create_augroup
TaloudGroup = augroup("Taloud", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

autocmd({ "BufWritePre" }, {
  group = TaloudGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
