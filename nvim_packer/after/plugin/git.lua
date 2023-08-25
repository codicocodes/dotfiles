
require('gitsigns').setup {
  signcolumn = false,
}
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>')
vim.keymap.set('n', '<leader>gg', ':Gitsigns toggle_signs<CR>')
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>gi', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '<leader>go', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>ga', ':Gitsigns stage_hunk<CR>')
