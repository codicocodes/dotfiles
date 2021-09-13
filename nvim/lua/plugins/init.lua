local packer = require'packer'

local util = require'packer.util'

package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')

packer.init({})

packer.startup(function()
  local use = use

  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "mfussenegger/nvim-dap-python"
  use "nvim-telescope/telescope-dap.nvim"

  -- Lua
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
      }
    end
  }

  -- GENERAL
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'SirVer/ultisnips'


  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use {
    'creativenull/diagnosticls-configs-nvim',
    requires = { 'neovim/nvim-lspconfig' }
  }
  use {
    'ThePrimeagen/refactoring.nvim',
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }

  -- THEMES
  use 'sainnhe/edge'
  -- use 'folke/tokyonight.nvim'
  use 'codicocodes/tokyonight.nvim'
  use 'arcticicestudio/nord-vim'

  -- GIT
  use 'tpope/vim-fugitive'
  use 'itchyny/vim-gitbranch'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },

    config = function()
      require'plugins.gitsigns'
    end
  }

  -- EDITING
  use 'jiangmiao/auto-pairs'
  use { 'prettier/vim-prettier', run = 'yarn install' }
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'phaazon/hop.nvim'
  use 'tpope/vim-abolish'

  -- EDITOR
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'plugins.galaxyline' end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require'plugins.bufferline',
  }
 end
)

require 'lspsaga'.init_lsp_saga()
