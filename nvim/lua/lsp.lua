local function setup_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  )
end

local lspconfig = require'lspconfig'
-- local completion = require'completion'
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  setup_diagnostics()
  -- completion.on_attach(client)
end

local default_config = {
  on_attach = custom_on_attach,
}

lspconfig.pyright.setup(default_config)
lspconfig.tsserver.setup(default_config)
lspconfig.svelte.setup(default_config)
lspconfig.cmake.setup(default_config)
lspconfig.java_language_server.setup(default_config)

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

vim.g.completion_matching_strategy_list = {'substring', 'exact', 'fuzzy', 'all'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  {complete_items = {'lsp', 'snippet'}},
  {mode = '<c-p>'},
  {mode = '<c-n>'},
}
