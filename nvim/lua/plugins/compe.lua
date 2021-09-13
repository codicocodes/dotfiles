
local remap = vim.api.nvim_set_keymap

require("compe").setup{
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
  "compe#confirm()",
  "<C-j>",
  { silent = true, expr = true }
)

-- remap(
--   "i",
--   "compe#confirm()",
--   "<C-y>",
--   { silent = true, expr = true }
-- )
