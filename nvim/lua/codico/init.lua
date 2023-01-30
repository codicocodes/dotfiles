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
    local function cleanup_cmd_line () vim.cmd('echo \"\"') end
    vim.defer_fn(cleanup_cmd_line, 1000)
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern={"qf"},
  callback = function ()
    vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>")
  end
})
