local packer = require'packer'

local util = require'packer.util'

    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
packer.init({
  })

packer.startup(function()
  local use = use

  -- GENERAL
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'
  use 'arcticicestudio/nord-vim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- use 'nvim-lua/completion-nvim'
  use 'hrsh7th/nvim-compe'
  use 'anott03/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use {
    'creativenull/diagnosticls-nvim',
    requires = { 'neovim/nvim-lspconfig' }
  }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }

  -- THEMES
  use 'sainnhe/edge'
  -- use 'folke/tokyonight.nvim'
  use 'codicocodes/tokyonight.nvim'

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
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

end
)

require 'lspsaga'.init_lsp_saga()
