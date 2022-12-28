local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'html',
  'cssls',
  'tsserver',
  'eslint',
  'rust_analyzer',
  'gopls',
  'pyright',
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        -- Register `vim` global with LSP
        globals = { "vim" },
      },
      workspace = {
        -- Make LSP aware of Neovim's runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})
local navic = require("nvim-navic")

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local cmp = require("cmp")

lsp.setup_nvim_cmp({
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, item)
      item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
      item.menu = ({
        buffer = "[buf]",
        nvim_lsp = '[lsp]',
        path = "[path]",
        nvim_lua = "[api]",
        luasnip = "[snip]",
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
    { name = "emoji" }
  }),
})


lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
    vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set('n', '<leader>dn', ':Lspsaga diagnostic_jump_next<CR>', opts)
  vim.keymap.set('n', '<leader>dp', ':Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.keymap.set('n', '<leader>ds', ':Lspsaga show_line_diagnostics<CR>', opts)
  vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', opts)
  vim.keymap.set('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set("n", "gh", ":Lspsaga lsp_finder<CR>")
  vim.keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'L', ':Lspsaga peek_definition<CR>', opts)
  vim.keymap.set('n', '<space>rn', '<cmd>:Lspsaga rename<CR>', opts)
  vim.keymap.set('n', '<space>ca', '<cmd>:CodeActionMenu<CR>', opts)
end
)

lsp.setup()

vim.diagnostic.config({
  virtual_text = { prefix = "" },
  update_in_insert = false,
  signs = true,
  underline = false,
  severity_sort = true,
})
