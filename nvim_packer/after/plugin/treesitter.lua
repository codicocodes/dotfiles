require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'lua', 'javascript', 'typescript', 'rust', 'go' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
    filetypes = { 'html', 'xml' },
  },
  context_commentstring = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']'] = '@function.outer',
      },
      goto_next_end = {
        [')'] = '@function.outer',
      },
      goto_previous_start = {
        ['['] = '@function.outer',
      },
      goto_previous_end = {
        ['('] = '@class.outer',
      },
    },
  },
}
