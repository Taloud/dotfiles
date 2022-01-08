local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Packer Tools
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "lewis6991/impatient.nvim"

  -- NeoVim ToolBox
  use "nvim-lua/plenary.nvim"
  use 'nvim-lua/popup.nvim'

  -- Colorschemes
  use "sainnhe/gruvbox-material"
  use "gruvbox-community/gruvbox"

  -- Status bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- AutoConfig
  use "editorconfig/editorconfig-vim"

  -- Git
  use "tpope/vim-fugitive"
  use "ThePrimeagen/git-worktree.nvim"

  -- Fuzzy Finder
  use { "junegunn/fzf", run = "./install --all" }
  use { "junegunn/fzf.vim" }

  -- I"m a fisherman !!!
  use "ThePrimeagen/harpoon"

  -- Guilty I like tree view :/
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function() require"nvim-tree".setup {} end
  }

  -- PHP Tools
  use { "phpactor/phpactor", run = "composer install --no-dev -o", ft = "php" }

  -- Code Helper
  use 'tpope/vim-projectionist'
  use 'airblade/vim-rooter'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  -- SmoothScroll
  use 'psliwka/vim-smoothie'

  -- Telescope BTW !!!!
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

   -- Treeshitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Snippet manager
  use "L3MON4D3/LuaSnip" --snippet engine

  -- Completion
  -- Sources
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"
  use "saadparwaiz1/cmp_luasnip"
  use "tamago324/cmp-zsh"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "onsails/lspkind-nvim"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use 'folke/lsp-colors.nvim' -- Make gruvbox working on highlight

  -- Building Tools / Test Tools
  use { "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } }
  use "vim-test/vim-test"



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
