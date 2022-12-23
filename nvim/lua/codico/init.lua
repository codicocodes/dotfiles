require 'codico.settings'
require 'codico.packer'
require 'codico.keymaps'

require'fidget'.setup {}
require'mind'.setup {}
require'Comment'.setup {}
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
})
