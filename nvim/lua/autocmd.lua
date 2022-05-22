local function autocmd()
  -- vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.svelte,*.yml,*yaml :Prettier]]
  vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]
  -- vim.cmd[[au BufWritePre *.go *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]
  -- vim.cmd([[autocmd BufWritePre *.go lua GoImports(1000)]])
  -- vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]]) -- removes whitespace on save

  function GoImports(timeoutms)
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
end

-- transparent
vim.cmd([[au VimEnter * hi Normal guibg=#000000 guifg=None]])
vim.cmd([[au VimEnter * hi NormalNC guibg=None guifg=None]])

vim.cmd([[au VimEnter * highlight Pmenu none]]) -- sets autocomplete suggestions to to transparent
vim.cmd([[au VimEnter * hi StatusLine guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi StatusLineNC guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi LineNr guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi Folded guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi NonText guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi SpecialKey guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi VertSplit guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi SignColumn guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi EndOfBuffer guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi TelescopeNormal guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi TelescopeBorder guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi NvimTreeNormal guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi NvimTreeNormalNC guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi NvimTreeVertSplit guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi NvimTreeStatusLine guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi NvimTreeStatusLineNC guibg=none ctermbg=none guifg=none]])
vim.cmd([[au VimEnter * hi ZenBg guibg=none ctermbg=none guifg=none]])



pcall(autocmd)
