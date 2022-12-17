local packer = require"packer"

packer.init({})

local troublSetup = function()
  require"trouble".setup{
    signs = {
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = ""
    },
  }
end

packer.startup(function()
  ---@diagnostic disable-next-line: undefined-global
  local use = use

  -- Debugger setup
  use "mfussenegger/nvim-dap"
  use "leoluz/nvim-dap-go"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "mfussenegger/nvim-dap-python"
  use "nvim-telescope/telescope-dap.nvim"

  use "vim-test/vim-test"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "sheerun/vim-polyglot"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "jremmen/vim-ripgrep"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "j-hui/fidget.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "glepnir/lspsaga.nvim"
  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = troublSetup
  }

  -- Autocomplete
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      {
        -- Snippets
        "L3MON4D3/LuaSnip",
        requires = {
          "saadparwaiz1/cmp_luasnip",
          "rafamadriz/friendly-snippets",
        },
      },
    },
  }

  use "ThePrimeagen/harpoon"

  -- THEMES
  use "sainnhe/edge"
  use "codicocodes/tokyonight.nvim" -- my version of tokyonight is modified for better transparency support
  use "arcticicestudio/nord-vim"

  -- GIT
  use "TimUntersberger/neogit"
  use "tpope/vim-fugitive"
  use {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim"
  }

  -- EDITING
  use "jiangmiao/auto-pairs"
  use { "prettier/vim-prettier", run = "yarn install" }
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "phaazon/hop.nvim"
  use "tpope/vim-abolish"

  -- EDITOR
  use "kyazdani42/nvim-web-devicons"
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use "folke/zen-mode.nvim"

  -- LIFESTYLE
  use "phaazon/mind.nvim"
end
)

require("gitsigns").setup{
  signcolumn = false
}

require"zen-mode".setup{}
require"todo-comments".setup{}
require"nvim-tree".setup()
local saga = require("lspsaga")
saga.init_lsp_saga({})
