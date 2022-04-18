local packer = require'packer'

packer.init({})

packer.startup(function()
  local use = use
  -- java
  use "mfussenegger/nvim-jdtls"
  use "mfussenegger/nvim-dap"
  use "leoluz/nvim-dap-go"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "mfussenegger/nvim-dap-python"
  use "nvim-telescope/telescope-dap.nvim"
  use "vim-test/vim-test"

  -- Lua
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require"todo-comments".setup{}
  end
}
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
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
  }

  -- Lua
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup{}
    end
  }

  -- GENERAL
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use "nvim-telescope/telescope-file-browser.nvim"
  use 'jremmen/vim-ripgrep'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'honza/vim-snippets'
  use({
      "SirVer/ultisnips",
      requires = "honza/vim-snippets",
      config = function()
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
    })

  use 'kabouzeid/nvim-lspinstall'
  use 'tami5/lspsaga.nvim'
  use {
    'ThePrimeagen/refactoring.nvim',
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }

  -- THEMES
  use 'sainnhe/edge'
  use 'codicocodes/tokyonight.nvim' -- my version of tokyonight is modified for better transparency support
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
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup() end
  }
end
)

require 'lspsaga'.init_lsp_saga()
