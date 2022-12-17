local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    { noremap = true, silent = true}
  )
end

-- DAP
key_mapper('', '<leader>bb', ':lua require("dapui").toggle()<CR>')
key_mapper('', '<leader>bp', ':DapToggleBreakpoint<CR>')
key_mapper('', '<leader>bn', ':DapContinue<CR>')

-- HARPOON
key_mapper ('', 'mm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
key_mapper ('', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>')
key_mapper ('', '<leader>n', ':lua require("harpoon.ui").nav_next()<CR>')
key_mapper ('', '<leader>p', ':lua require("harpoon.ui").nav_prev()<CR>')
key_mapper ('', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>')
key_mapper ('', '<leader>2',  ':lua require("harpoon.ui").nav_file(2)<CR>')
key_mapper ('', '<leader>3',  ':lua require("harpoon.ui").nav_file(3)<CR>')
key_mapper ('', '<leader>4',  ':lua require("harpoon.ui").nav_file(4)<CR>')
key_mapper ('', '<leader>5',  ':lua require("harpoon.ui").nav_file(5)<CR>')
key_mapper ('', '<leader>6',  ':lua require("harpoon.ui").nav_file(6)<CR>')
key_mapper ('', '<leader>7',  ':lua require("harpoon.ui").nav_file(7)<CR>')
key_mapper ('', '<leader>8',  ':lua require("harpoon.ui").nav_file(8)<CR>')
key_mapper ('', '<leader>9',  ':lua require("harpoon.ui").nav_file(9)<CR>')
key_mapper ('', '<leader>0',  ':lua require("harpoon.ui").nav_file(0)<CR>')

-- Quality of life utils
key_mapper('', '<leader>bd', ':bd<CR>')
key_mapper('n', '<leader>bx', ':%bd<bar>e#<bar>bd#<CR>')
key_mapper('', '<leader>q', ':wq<CR>')
key_mapper('', '<leader>w', ':w<CR>')
key_mapper('', '<leader>e', ':e<CR>')
key_mapper('', '<leader>r', ':LspRestart<CR>')

-- Disable arrowkeys
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')

-- Window management
key_mapper('n', '<leader>sv', ':vsplit<CR>')
key_mapper('n', '<leader>sh', ':split<CR>')
key_mapper('n', '<up>',    ':resize +2<CR>')
key_mapper('n', '<down>',  ':resize -2<CR>')
key_mapper('n', '<left>',  ':vertical resize -2<CR>')
key_mapper('n', '<right>', ':vertical resize +2<CR>')
key_mapper('n', '<leader>rr', '<C-w>r')
key_mapper('n', '<leader>=', '<C-w>=')
key_mapper('n', '<leader>l', ':wincmd l<CR>')
key_mapper('n', '<leader>k', ':wincmd k<CR>')
key_mapper('n', '<leader>j', ':wincmd j<CR>')
key_mapper('n', '<leader>h', ':wincmd h<CR>')

-- LSP
key_mapper('n', '<leader>dn', ':Lspsaga diagnostic_jump_next<CR>')
key_mapper('n', '<leader>dp', ':Lspsaga diagnostic_jump_prev<CR>')
key_mapper('n', '<leader>ds', ':Lspsaga show_line_diagnostics<CR>')
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper("n", "gh", ":Lspsaga lsp_finder<CR>")
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':Lspsaga hover_doc<CR>')
key_mapper('n', 'L', ':Lspsaga peek_definition<CR>')
key_mapper('n', '<space>rn', '<cmd>:Lspsaga rename<CR>')
key_mapper('n', '<space>ca', '<cmd>:CodeActionMenu<CR>')

-- Telescope
key_mapper('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('n', '<leader>fb', ':Telescope file_browser path=%:p:h<CR>')
key_mapper('n', '<leader>gs', ':lua require"telescope.builtin".git_status()<CR>')

-- Plugins
key_mapper('n', '<leader>tt', ':NvimTreeToggle<CR>')
key_mapper('n', '<leader>ff', ':NvimTreeFindFile<CR>')
key_mapper('n', '<leader>tr', ':NvimTreeRefresh<CR>')
key_mapper('n', '<leader>fd', ':TroubleToggle<CR>')
key_mapper('n', '<leader>td', ':TodoTelescope<CR>')

key_mapper('n', '<leader>z', ':Z<CR>')

key_mapper('', '<leader><leader>', ':HopWord<CR>')

-- Gitsigns
key_mapper('', '<leader>gb', ':Gitsigns blame_line<CR>')
key_mapper('', '<leader>gg', ':Gitsigns toggle_signs<CR>')
key_mapper('', '<leader>gp', ':Gitsigns preview_hunk<CR>')
key_mapper('', '<leader>gi', ':Gitsigns next_hunk<CR>')
key_mapper('', '<leader>go', ':Gitsigns prev_hunk<CR>')
key_mapper('', '<leader>gu', ':Gitsigns reset_hunk<CR>')
key_mapper('', '<leader>ga', ':Gitsigns stage_hunk<CR>')

key_mapper('', "vp", 'viwp')
key_mapper('', '<ESC>', ':noh<CR>')
key_mapper('','Y','y$')

-- moving text
key_mapper('','<C-k>',':m .-2<CR>==')
key_mapper('','<C-j>',':m .+1<CR>==')
key_mapper('v','<C-j>',":m '>+1<CR>gv=gv")
key_mapper('v','<C-k>',":m '<-2<CR>gv=gv")

-- tests
-- TODO: write separate commands based on the current filetype
key_mapper('', '<leader>tf', ':TestFile<CR>')
key_mapper('', '<leader>tn', ':TestNearest<CR>')
key_mapper('', '<leader>tl', ':TestLast<CR>')
