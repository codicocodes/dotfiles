require'autocmd'
require'settings'
require'packer-setup'
require'plugins.init'
require'keybindings'
require'colorscheme'
require'plugins.nvimtree'
require'lsp'
require'sumneko'
require'plugins.treesitter'
require'plugins.telescope'
require'plugins.cmp'
require'fidget'.setup{}
require'mind'.setup{}
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

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.formatting.gofmt
    },
})


-- Debugger
require'plugins.dap'
require'dapui'.setup()
require'dap-python'.setup('~/.venv/debugpy/bin/python')
require'dap-go'.setup()
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Success", linehl = "", numhl = "" })
