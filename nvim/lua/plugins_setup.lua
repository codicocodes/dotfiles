

local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- add you plugins here like
  use 'jiangmiao/auto-pairs'
  use 'airblade/vim-gitgutter'
  use 'APZelos/blamer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  -- these are optional themes but I hear good things about gloombuddy ;)
  use 'mhartington/oceanic-next'
  use 'tjdevries/colorbuddy.nvim'
  use 'codicocodes/gloombuddy'
  use 'arcticicestudio/nord-vim'
  use 'cocopon/iceberg.vim'
  use 'sainnhe/sonokai'
  use 'sainnhe/edge'

  -- sneaking some formatting in here too
  use {'prettier/vim-prettier', run = 'yarn install' }
  
  -- lsp stuff
  
-- old stuff language server
  
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall' 
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'
  -- use 'preservim/nerdtree'
  use 'itchyny/lightline.vim'
  use 'itchyny/vim-gitbranch'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'akinsho/nvim-bufferline.lua',
        requires = {'kyazdani42/nvim-web-devicons', 'sainnhe/edge'},
        config = require'bufferline_setup',
  }
  use 'tpope/vim-commentary'
  use 'unblevable/quick-scope'
  end
)

