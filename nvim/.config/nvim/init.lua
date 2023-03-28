--                       ______     ______________
--                      |######|   |#############W
--                      |######|   |############W
--                      |######|   |###########'
--                      |######|   |###### ¯¯¯
--                      |#####################|
--                      |#####################|
--                      |######|   |######|
--                      |######|   |######|
--                      |######|   |######|
--                      |######|   |######|
--                       ¯¯¯¯¯¯     ¯¯¯¯¯¯
--
--
-------------------------------------------------------------------

pcall(require, "impatient")

-- Leader key
vim.g.mapleader = " "

vim.g.snippets = "luasnip"

--  See `./lua/tj/globals/*.lua` for more information.
require "taloud.globals"

-- Turn off builtin plugins I do not use.
require "taloud.disable_builtin"

-- load my plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})

-- Neovim builtin LSP configuration
require "taloud.lsp"

-- Telescope BTW
require "taloud.telescope.setup"
require "taloud.telescope.mappings"

--  Load git-worktree.
require "taloud.git-worktree"
