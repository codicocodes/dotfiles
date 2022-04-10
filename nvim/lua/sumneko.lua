local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local name = "sumneko_lua"

configs[name] = {
  default_config = {
    filetypes = {'lua', 'javascript', 'javascriptreact','typescript','typescriptreact'};
    log_level = vim.lsp.protocol.MessageType.Warning;
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or util.path.dirname(fname)
    end;
  };
}

require('lspconfig').sumneko_lua.setup {
  cmd = { "lua-language-server" };
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
