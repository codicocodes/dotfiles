local packer = require'packer'

local util = require'packer.util'

packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
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

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall'

  -- THEMES
  use 'sainnhe/edge'

  -- GIT
  use 'tpope/vim-fugitive'
  use 'itchyny/vim-gitbranch'

  -- EDITING
  use 'jiangmiao/auto-pairs'
  use { 'prettier/vim-prettier', run = 'yarn install' }
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'unblevable/quick-scope'
  use 'sirver/UltiSnips'
  use 'phaazon/hop.nvim'

  -- EDITOR
  use 'itchyny/lightline.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'akinsho/nvim-bufferline.lua',
    requires = { 'kyazdani42/nvim-web-devicons', 'sainnhe/edge' },
    config = require'plugins.bufferline',
  }

end
)

