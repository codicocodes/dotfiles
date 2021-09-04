vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]
vim.cmd[[au BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)]]

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local method = "textDocument/codeAction"
  local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
  if resp and resp[1] then
    local result = resp[1].result
    if result and result[1] then
      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end

  vim.lsp.buf.formatting()
end

vim.cmd([[autocmd BufWritePre *.go lua goimports(1000)]])
vim.cmd([[set completeopt=menuone,noinsert,noselect]])
-- this should remove le whitespace?
-- `:w`: autocmd BufWritePre * %s/\s\+$//e

