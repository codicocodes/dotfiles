require 'codico.settings'
require 'codico.packer'
require 'codico.keymaps'

require'fidget'.setup {}
require'mind'.setup {}
require'Comment'.setup {}

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function ()
    vim.defer_fn(function() vim.cmd('echo \"\"') end, 1000)
  end
})
