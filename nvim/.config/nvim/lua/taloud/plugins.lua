-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color Scheme
  { import = "taloud.plugins.gruvbox" },

  -- add change and delete text
  { "tpope/vim-surround" },
  --
  -- Indent autodetection with editorconfig support
  { "tpope/vim-sleuth" },

  -- Allow plugins to enable repeating of commands
  { "tpope/vim-repeat" },

  -- Enable * searching with visually selected text
  { "nelstrom/vim-visual-star-search" },

  -- Text objects for HTML attributes
  { "whatyouhide/vim-textobj-xmlattr", dependencies = 'kana/vim-textobj-user' },

  -- Display indentation lines
  { import = "taloud.plugins.indent-blankline" },

  -- Automatically set the working derectory to the project root
  { import = "taloud.plugins.vim-rooter" },


  -- Split arrays and methods onto multiple lines, or join them back up
  { import = "taloud.plugins.treesj" },

  -- Automatically fix indentation when pasting code
  { import = "taloud.plugins.vim-pasta" },

  -- Telescope BTW !!!!!
  { import = "taloud.plugins.telescope" },
  --
  -- Guilty I like tree view :/
  { import = "taloud.plugins.neo-tree" },

  -- Status line
  { import = "taloud.plugins.lualine" },

  -- Dashboard
  { import = "taloud.plugins.dashboard-nvim" },

  -- Git integration
  { import = "taloud.plugins.gitsigns" },

  -- Git commands
  { 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },

  -- Treeshitter improve syntax hightlight
   { import = "taloud.plugins.treesitter" },

  -- Language Server Protocol
  { import = "taloud.plugins.lspconfig" },

  -- Completion
  { import = "taloud.plugins.cmp" },

  -- PHP Refactoring Protocol
  { import = "taloud.plugins.phpactor" },

  -- Project Configuration
  { import = "taloud.plugins.projectionist" },

  -- Testing helper
  { import = "taloud.plugins.vim-test" },

  -- Comment block with keymaps
  { import = "taloud.plugins.comment" },

  -- Hightlight occurences of the word under the cursor
  { import = "taloud.plugins.illuminate" },

  -- I"m a fisherman !!!
  { import = "taloud.plugins.harpoon" },

  -- SmoothScroll
  { "karb94/neoscroll.nvim", config = true },

}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = { "gruvbox" },
  },
})
