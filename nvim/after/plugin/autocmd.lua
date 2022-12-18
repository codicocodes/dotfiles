vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
})

function SetupVimtest(file_name)
  if file_name == 'python' then
    vim.keymap.set('n', '<leader>tf', ':TestFile --keepdb<CR>')
    vim.keymap.set('n', '<leader>tn', ':TestNearest --keepdb<CR>')
    vim.keymap.set('n', '<leader>tl', ':TestLast --keepdb<CR>')
    return
  end
  vim.keymap.set('n', '<leader>tf', ':TestFile<CR>')
  vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>')
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>')
end

vim.api.nvim_create_autocmd("BufEnter", {
  command = "silent! lua SetupVimtest(vim.bo.filetype)",
})
