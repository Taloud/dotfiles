return {
  "lewis6991/impatient.nvim",

  -- NeoVim ToolBox
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  {
  'airblade/vim-rooter',
  setup = function()
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
},

  -- Colorschemes
  "sainnhe/gruvbox-material",
  "gruvbox-community/gruvbox",

  -- Pretty notification
  "rcarriga/nvim-notify",

  -- Status bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true }
  },

  -- AutoConfig
  "editorconfig/editorconfig-vim",

  -- Git
  "tpope/vim-fugitive",
  "ThePrimeagen/git-worktree.nvim",
  "lewis6991/gitsigns.nvim",

  -- Fuzzy Finder
  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },

  -- I"m a fisherman !!!
  "ThePrimeagen/harpoon",

  -- Guilty I like tree view :/
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    commit = 'f3b7372',
    config = function() require"nvim-tree".setup {} end
  },

  -- PHP Tools but for now only use intelephense
  -- use { "phpactor/phpactor", build = "composer install --no-dev -o", ft = "php" }

  -- Code Helper
  "tpope/vim-projectionist",
  "airblade/vim-rooter",
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  "farmergreg/vim-lastplace", -- save last position in file when quit
  "tpope/vim-sleuth", -- Indent autodetection with editorconfig support


  -- SmoothScroll
  "psliwka/vim-smoothie",

  -- Telescope BTW !!!!
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",

   -- Treeshitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/playground",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "lumiliet/vim-twig",
  "m-demare/hlargs.nvim",   -- add colorschemes for variable in functions
  "nvim-treesitter/nvim-treesitter-context",
  "lukas-reineke/indent-blankline.nvim",  -- Blank space indicator

  -- Snippet manager
  "L3MON4D3/LuaSnip",  --snippet engine

  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "saadparwaiz1/cmp_luasnip",
  "tamago324/cmp-zsh",

  -- LSP
  "neovim/nvim-lspconfig",  -- enable LSP
  "onsails/lspkind-nvim",
  -- "williamboman/nvim-lsp-installer",  -- simple to use language server installer
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",  -- for formatters and linters
  "tjdevries/nlua.nvim", -- for LUA lsp
  "antoinemadec/FixCursorHold.nvim", -- fix cursor hold
  "nanotee/sqls.nvim", -- SQL lsp
  {
      "prettier/vim-prettier",
      ft = { "html", "javascript", "typescript", "typescriptreact" },
      build = "yarn install",
  },

  -- Refoctoring
  "ThePrimeagen/refactoring.nvim",

  -- Building Tools / Test Tools
  { "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } },
  "vim-test/vim-test",

  -- Database management
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",

  -- TODO: Debug adapter protocol
    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "theHamsta/nvim-dap-virtual-text",
    -- "nvim-telescope/telescope-dap.nvim",
}
