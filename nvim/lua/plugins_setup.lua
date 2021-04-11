
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
packer.startup(function()
  local use = use
  use 'airblade/vim-gitgutter'
  use 'itchyny/vim-gitbranch'
  use 'jiangmiao/auto-pairs'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'sainnhe/edge'
  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'tpope/vim-surround'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall' 
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'
  use 'itchyny/lightline.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'akinsho/nvim-bufferline.lua',
        requires = {'kyazdani42/nvim-web-devicons', 'sainnhe/edge'},
        config = require'bufferline_setup',
  }
  use 'tpope/vim-commentary'
  use 'unblevable/quick-scope'
  use 'sirver/UltiSnips'
  use 'phaazon/hop.nvim'
  end
)

