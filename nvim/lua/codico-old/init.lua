require'codico-old.autocmd'
require'codico-old.settings'
require'codico-old.packer-setup'
require'codico-old.plugins.init'
require'codico-old.keybindings'
require'codico-old.colorscheme'
require'codico-old.lsp'
require'codico-old.sumneko'
require'codico-old.plugins.treesitter'
require'codico-old.plugins.telescope'
require'codico-old.plugins.cmp'
require'fidget'.setup{}
require'mind'.setup{}
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 }
require'codico-old.plugins.dap'
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.formatting.gofmt
    },
})
