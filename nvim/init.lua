vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]

require'settings'
require'packer-setup'
require'plugins'
require'keybindings'
require'colorscheme'
require 'plugins.lspsaga'
require'plugins.lightline'
require'plugins.nvimtree'
require'lsp'
require'sumneko'
require'plugins.treesitter'
require'plugins.telescope'
