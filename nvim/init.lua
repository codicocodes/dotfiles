require'autocmd'
require'settings'
require'packer-setup'
require'plugins.init'
require'keybindings'
require'colorscheme'
require'lsp'
require'sumneko'
require'plugins.treesitter'
require'plugins.telescope'
require'plugins.cmp'
require'fidget'.setup{}
require'mind'.setup{}
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 }
require'plugins.dap'
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.formatting.gofmt
    },
})
