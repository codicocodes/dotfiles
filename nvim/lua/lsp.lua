local function setup_signs()
  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

setup_signs()

local function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        update_in_insert = false,
        virtual_text = true,
        underline = false,
        signs = true,
        prefix = '', -- Could be '●', '▎', 'x'
        spacing = 4,
      }
    })
  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  --   vim.lsp.diagnostic.on_publish_diagnostics, {
  --     virtual_text = {
  --       prefix = '', -- ' ', -- Could be '●', '▎', 'x'
  --       -- spacing = 4,
  --     },
  --     -- underline = false,
  --     -- virtual_text = true,
  --     -- severity_sort = true,
  --     -- signs = true,
  --     -- update_in_insert = false,
  --   }
  --   )
end
setup_diagnostics()

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

 lspconfig.eslint.setup{
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
    -- handlers = {
      -- ["eslint/confirmESLintExecution"] = <function 1>,
      -- ["eslint/noLibrary"] = <function 2>,
      -- ["eslint/openDoc"] = <function 3>,
      -- ["eslint/probeFailed"] = <function 4>
    -- },
    on_new_config = function(config, new_root_dir)
          -- The "workspaceFolder" is a VSCode concept. It limits how far the
          -- server will traverse the file system when locating the ESLint config
          -- file (e.g., .eslintrc).
          config.settings.workspaceFolder = {
            uri = new_root_dir,
            name = vim.fn.fnamemodify(new_root_dir, ':t'),
          }
        end,
    -- root_dir = function(startpath)
    --     local matcher = {}
    --     return M.search_ancestors(startpath, matcher)
    --   end,
    settings = {
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine"
        },
        showDocumentation = {
          enable = true
        }
      },
      codeActionOnSave = {
        enable = true,
        mode = "all"
      },
      format = false,
      nodePath = "",
      onIgnoredFiles = "off",
      packageManager = "npm",
      quiet = false,
      rulesCustomizations = {},
      run = "onType",
      useESLintClass = false,
      validate = "on",
      workingDirectory = {
        mode = "auto"
      }
    }
 }

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
