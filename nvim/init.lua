require("core.options")
require("core.keymaps")
require("core.lazy")
local kind_icons = require("utils.icons")

require("lazy").setup({
	{
		"vim-test/vim-test",
		config = function()
			function SetupVimtest(file_type)
				if file_type == "python" then
					vim.keymap.set("n", "<leader>tf", ":TestFile --keepdb<CR>")
					vim.keymap.set("n", "<leader>tn", ":TestNearest --keepdb<CR>")
					vim.keymap.set("n", "<leader>tl", ":TestLast --keepdb<CR>")
				else
					vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
					vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>")
					vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
				end
			end

			vim.api.nvim_create_autocmd("BufEnter", {
				command = "silent! lua SetupVimtest(vim.bo.filetype)",
			})
		end,
	},
	"creativenull/dotfyle-metadata.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-sleuth",
	"tpope/vim-abolish",
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "tsserver" },
				},
			},
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				opts = {},
			},
			{
				"folke/neodev.nvim",
				opts = {},
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-emoji",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"roobert/tailwindcss-colorizer-cmp.nvim",
		},

		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({})),
					["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({})),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered("rounded"),
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, item)
						require("tailwindcss-colorizer-cmp").formatter(entry, item)
						item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
						item.menu = ({
							buffer = "buf",
							nvim_lsp = "lsp",
							path = "path",
							nvim_lua = "api",
							luasnip = "snip",
						})[entry.source.name]
						return item
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "neorg" },
					{ name = "emoji" },
				}),
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signcolumn = false,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>gp",
					require("gitsigns").prev_hunk,
					{ buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
				)
				vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Next Hunk" })
				vim.keymap.set(
					"n",
					"<leader>gv",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "Preview Hunk" }
				)
				vim.keymap.set("n", "<leader>gg", require("gitsigns").toggle_signs, { desc = "Toggle Gitsigns" })
				vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, { desc = "Git Blame" })
				vim.keymap.set("n", "<leader>gu", require("gitsigns").reset_hunk, { desc = "Reset Hunk" })
				vim.keymap.set("n", "<leader>ga", require("gitsigns").stage_hunk, { desc = "Stage Hunk" })
			end,
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		opts = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
				components = {
					name = function(config, node, state)
						local components = require('neo-tree.sources.common.components')
						local name = components.name(config, node, state)
						if node:get_depth() == 1 then
							name.text = vim.fn.pathshorten(name.text, 2)
						end
						return name
					end,
				},
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			{
				"<leader>E",
				function()
					require("neo-tree.command").execute({ toggle = true, reveal = true })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
		},
	},

	-- colorscheme
	{
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			-- vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				transparent = true,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = { transparent = true },
		config = function()
			require("rose-pine").setup({
				variant = "main",
				disable_background = true,
				disable_float_background = true,
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},

	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = "rose-pine",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		event = "VeryLazy",
		version = "v2.20.8",
		opts = {
			char = "┊",
			show_trailing_blankline_indent = true,
			show_current_context = true,
			show_current_context_start = false,
		},
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["qq"] = require("telescope.actions").close,
							["<esc><esc>"] = require("telescope.actions").close,
						},
						n = {
							["<esc>"] = false,
							["qq"] = require("telescope.actions").close,
							["<esc><esc>"] = require("telescope.actions").close,
						},
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
				},
			})

			require("telescope").load_extension("file_browser")

			vim.keymap.set("n", "<C-p>", ':lua require"telescope.builtin".find_files()<CR>')
			vim.keymap.set("n", "<leader>fs", ':lua require"telescope.builtin".live_grep()<CR>')
			vim.keymap.set("n", "<leader>fh", ':lua require"telescope.builtin".help_tags()<CR>')
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h<CR>")
			vim.keymap.set("n", "<leader>gs", ':lua require"telescope.builtin".git_status()<CR>')
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "javascript", "typescript", "rust", "go" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				autotag = {
					enable = true,
					filetypes = { "html", "xml", "svelte", "react", "vue" },
				},
				context_commentstring = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]"] = "@function.outer",
						},
						goto_next_end = {
							[")"] = "@function.outer",
						},
						goto_previous_start = {
							["["] = "@function.outer",
						},
						goto_previous_end = {
							["("] = "@class.outer",
						},
					},
				},
			})
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local ui = require("harpoon.ui")
			local mark = require("harpoon.mark")

			local navigate = function(id)
				return function()
					ui.nav_file(id)
				end
			end

			vim.keymap.set("n", "mm", ui.toggle_quick_menu, { desc = "Open Harpoon" })
			vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd file to Harpoon" })
			vim.keymap.set("n", "<leader>1", navigate(1), { desc = "Harpoon Buffer (1)" })
			vim.keymap.set("n", "<leader>2", navigate(2), { desc = "Harpoon Buffer (2)" })
			vim.keymap.set("n", "<leader>3", navigate(3), { desc = "Harpoon Buffer (3)" })
			vim.keymap.set("n", "<leader>4", navigate(4), { desc = "Harpoon Buffer (4)" })
			vim.keymap.set("n", "<leader>5", navigate(5), { desc = "Harpoon Buffer (5)" })
		end,
	},
	{
		"echasnovski/mini.starter",
		dependencies = { "MaximilianLloyd/ascii.nvim" },
		version = "*",
		config = function()
			local plugin_count = #require("lazy").plugins()
			local starter = require("mini.starter")
			starter.setup({
				content_hooks = {
					starter.gen_hook.adding_bullet(""),
					starter.gen_hook.aligning("center", "center"),
				},
				evaluate_single = true,
				footer = table.concat({
					"🚀 " .. plugin_count .. " plugins installed",
					"📅 " .. os.date(),
					"\n ",
					table.concat(require("ascii").art.animals.cats.cookie, "\n"),
				}, "\n"),
				header = table.concat(require("ascii").art.text.neovim.ogre, "\n"),
				query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
				items = {
					{
						action = "Telescope find_files",
						name = "F: Files",
						section = "Welcome",
					},
					{
						action = "lua require('harpoon.ui').toggle_quick_menu()",
						name = "M: Menu",
						section = "Welcome",
					},
					{
						action = "Lazy update",
						name = "U: Update",
						section = "Plugins",
					},
					{
						action = "tab G",
						name = "G: Git",
						section = "Welcome",
					},
					{ action = "Neorg workspace home", name = "H: Home", section = "Notes" },
					{ action = "Neorg workspace work", name = "W: Work", section = "Notes" },
					{
						action = "qall!",
						name = "Q: Quit",
						section = "Welcome",
					},
				},
			})

			vim.cmd("command! Dashboard :lua require('mini.starter').open()")

			vim.cmd([[
				augroup MiniStarterJK
					au!
					au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
					au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
					au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
					au User MiniStarterOpened nmap <buffer> <leader>fb <Cmd>Telescope file_browser<CR>
				augroup END
			]])
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				width = 0.50,
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<space>s",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<C-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
			{
				"<leader><leader>",
				desc = "Hop to Word",
				function()
					local Flash = require("flash")
					local function format(opts)
						return {
							{ opts.match.label1, "FlashMatch" },
							{ opts.match.label2, "FlashLabel" },
						}
					end

					Flash.jump({
						search = { mode = "search" },
						label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
						pattern = [[\<]],
						action = function(match, state)
							state:hide()
							Flash.jump({
								search = { max_length = 0 },
								highlight = { matches = false },
								label = { format = format },
								matcher = function(win)
									-- limit matches to the current label
									return vim.tbl_filter(function(m)
										return m.label == match.label and m.win == win
									end, state.results)
								end,
								labeler = function(matches)
									for _, m in ipairs(matches) do
										---@diagnostic disable-next-line: undefined-field
										m.label = m.label2 -- use the second label
									end
								end,
							})
						end,
						labeler = function(matches, state)
							local labels = state:labels()
							for m, match in ipairs(matches) do
								match.label1 = labels[math.floor((m - 1) / #labels) + 1]
								match.label2 = labels[(m - 1) % #labels + 1]
								match.label = match.label1
							end
						end,
					})
				end,
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function()
			local wk = require("which-key")
			wk.register({
				rn = { name = "Rename" },
				g = {
					name = "Git",
				},
				c = {
					name = "Code",
				},
				d = {
					name = "Diagnostics",
				},
				b = {
					name = "Buffer",
				},
				t = {
					name = "Test",
				},
				prefix = "<leader>",
			})
		end,
	},
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x", -- version is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				filetypes = {
					-- disable for all filetypes (enable when using)
					["*"] = false,
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-CR>",
					},
				},
			})
		end,
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {
						config = {
							icons = {
								todo = {
									done = {
										icon = "",
									},
									pending = {
										icon = "",
									},
								},
							},
						},
					},
					["core.completion"] = { config = { engine = "nvim-cmp" } },
					["core.presenter"] = { config = { zen_mode = "zen-mode" } },
					["core.itero"] = {},
					["core.ui.calendar"] = {},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								work = "~/notes/work",
								home = "~/notes/home",
							},
							default_workspace = "home",
						},
					},
				},
			})
		end,
	},
})

--- LSP configuration

local function on_attach(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostics" })
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostics" })
	vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gw", vim.lsp.buf.document_symbol, opts)
	vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

local servers = {
	ocamllsp = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},
	html = { filetypes = { "html", "twig", "hbs" } },
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})

vim.diagnostic.config({
	virtual_text = { prefix = "" },
	update_in_insert = false,
	signs = true,
	underline = false,
	severity_sort = true,
})

-- set current line nr color
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f6c177" })
vim.cmd.set("cursorline")
vim.cmd.set("cursorlineopt=number")
vim.cmd.set("colorcolumn=100")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- EFM Language Server Configurations

-- Register linters and formatters per language
local eslint = require("efmls-configs.linters.eslint")
local prettier = require("efmls-configs.formatters.prettier")
local stylua = require("efmls-configs.formatters.stylua")
local black = require("efmls-configs.formatters.black")
local gofmt = require("efmls-configs.formatters.gofmt")
local languages = {
	golang = { gofmt },
	typescript = { eslint, prettier },
	lua = { stylua },
	python = { black },
}

local efmls_config = {
	filetypes = vim.tbl_keys(languages),
	settings = {
		rootMarkers = { ".git/" },
		languages = languages,
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
}

require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
	on_attach = on_attach,
	capabilities = capabilities,
}))

vim.cmd("command! MakeFileExecutable :!chmod +x %<CR>")
