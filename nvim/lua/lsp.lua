local function setup_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = false,
      signs = true,
      update_in_insert = true,
    }
  )

  -- Show diagnostic text on hover
  vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
end

local lspconfig = require'lspconfig'
local completion = require'completion'
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  setup_diagnostics()
  completion.on_attach(client)
end
local default_config = {
  on_attach = custom_on_attach,
}

lspconfig.tsserver.setup(default_config)
lspconfig.svelte.setup(default_config)

vim.g.completion_matching_strategy_list = {'substring', 'exact', 'fuzzy', 'all'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  {complete_items = {'lsp', 'snippet'}},
  {mode = '<c-p>'},
  {mode = '<c-n>'},
}

vim.g.completion_enable_snippet = 'UltiSnips'

