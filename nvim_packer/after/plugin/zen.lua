require('zen-mode').setup({
  window = {
    width = 0.80,
  },
  plugins = {
    kitty = {
      enabled = true,
      font = "+4",
    },
  },
  on_open = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.signcolumn = 'no'
    SetColors()
  end,

  on_close = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = 'yes'
    SetColors()
  end,
})

vim.keymap.set('n', '<leader>z', ':Z<CR>')
