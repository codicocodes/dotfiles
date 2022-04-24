require'autocmd'
require'settings'
require'packer-setup'
require'plugins'
require'keybindings'
require'colorscheme'
require'plugins.nvimtree'
require'lsp'
require'sumneko'
require'plugins.treesitter'
require'plugins.telescope'
require'plugins.cmp'
require'plugins.dap'
require'dapui'.setup()
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 }

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
