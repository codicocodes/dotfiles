local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local name = "sumneko_lua"

local function get_system_name()
  if vim.fn.has("mac") == 1 then
    return "macOS"
  elseif vim.fn.has("unix") == 1 then
    return "Linux"
  elseif vim.fn.has('win32') == 1 then
    return "Windows"
  else
    print("Unsupported system for sumneko")
  end
end

configs[name] = {
  default_config = {
    filetypes = {'lua', 'javascript', 'javascriptreact','typescript','typescriptreact'};
    log_level = vim.lsp.protocol.MessageType.Warning;
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or util.path.dirname(fname)
    end;
  };
}

local system_name = get_system_name()
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/Users/codico/code/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
require('lspconfig').sumneko_lua.setup {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" };
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
