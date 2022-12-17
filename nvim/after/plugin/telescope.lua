require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["qq"] =require'telescope.actions'.close,
        ["<esc><esc>"] = require'telescope.actions'.close,
      },
      n = {
        ["<esc>"] = false,
        ["qq"] = require'telescope.actions'.close,
        ["<esc><esc>"] = require'telescope.actions'.close,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
  },
}
require("telescope").load_extension "file_browser"
vim.keymap.set('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
vim.keymap.set('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
vim.keymap.set('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser path=%:p:h<CR>')
vim.keymap.set('n', '<leader>gs', ':lua require"telescope.builtin".git_status()<CR>')
