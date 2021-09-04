
local remap = vim.api.nvim_set_keymap

require("compe").setup {
  enabled = true,
  debug = false,
  min_length = 2,
  preselect = "disable",
  source_timeout = 200,
  incomplete_delay = 400,
  throttle_time = 200,
  allow_prefix_unmatch = true,
  documentation = {
    border = "solid",
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  },

  source = {
    path = true,
      enable = true,
    buffer = {
      priority = 1, -- last priority
    },
    luasnip = true,
    nvim_lsp = {
      enable = true,
      priority = 10001, -- takes precedence over file completion
    },
  },
}

remap(
  "i",
  "<Tab>",
  'pumvisible() ? "<C-n>" : "<Tab>"',
  { silent = true, noremap = true, expr = true }
)

remap(
  "i",
  "<S-Tab>",
  'pumvisible() ? "<C-p>" : "<S-Tab>"',
  { silent = true, noremap = true, expr = true }

)
remap(
  "i",
  "<C-j>",
  "compe#confirm()",
  { silent = true, expr = true }
)

-- remap(
--   "i",
--   "<C-l>",
--   "compe#complete()",
--   { noremap = true, expr = true, silent = true }
-- )

-- return require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 1;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   resolve_timeout = 800;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = {
--     border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
--     winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
--     max_width = 120,
--     min_width = 60,
--     max_height = math.floor(vim.o.lines * 0.3),
--     min_height = 1,
--   };

--   source = {
--     path = true;
--     buffer = true;
--     calc = true;
--     nvim_lsp = true;
--     nvim_lua = true;
--     vsnip = true;
--     ultisnips = true;
--     luasnip = true;
--   };
-- }
