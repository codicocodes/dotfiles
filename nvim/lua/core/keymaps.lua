vim.keymap.set("n", "vp", "viwp", { desc = "Paste over the current word" })
vim.keymap.set("n", "<ESC>", ":noh<CR>:cclose<CR>", { silent = true })
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { silent = true, desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bx", ":%bd<bar>e#<bar>bd#<CR>", { silent = true, desc = "[B]uffer E[x]it (all other)" })
vim.keymap.set("n", "<leader>q", ":wqa!<CR>", { silent = true, desc = "Save and [Q]uit Neovim" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, desc = "[W]rite" })
vim.keymap.set("n", "<leader>r", ":LspRestart<CR>", { silent = true, desc = "[R]estart LSP" })
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "<leader>-", ":split<CR>", { silent = true, desc = "Horizontal Split" })
vim.keymap.set("n", "<up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<down>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<right>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { silent = true, desc = "Window Navigate [Right]" })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { silent = true, desc = "Window Navigate [Up]" })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { silent = true, desc = "Window Navigate [Down]" })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { silent = true, desc = "Window Navigate [Left]" })
vim.keymap.set("n", "J", "mzJ`z") -- keeps cursor on start of line when using J
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keeps cursor in middle when using CTRL-d
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keeps cursor in middle when using CTRL-u
vim.keymap.set("n", "<leader>p", [[viw"_dP]], { desc = "Paste (in word) without overriding register" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overriding register" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overriding register" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line to system Clipboard" })
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "[B]uffer [F]ormat" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File E[x]ecutable" })
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "[Search] and Replace word under cursor" }
)
