local o=vim.o
local bo=vim.bo
local wo=vim.wo
o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = true
vim.g.mapleader=' '
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
require'plugins_setup'

vim.g.edge_style = 'neon'
vim.g.colors_name='edge'

vim.g.lightline = {
  colorscheme= 'edge',
  active= {
    left= { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } ,
  },
  component_function = {
    gitbranch = 'gitbranch#name'
  },
}

vim.g.blamer_relative_time = 1
vim.g.blamer_delay = 200
vim.g.blamer_enabled = 1

vim.g.nvim_tree_width = 35
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_hide_dotfiles = 0

local function setup_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = true,
    }
  )
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

-- prettier
vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]
-- sumneko lua stuff??? experiment
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
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/Users/codico/code/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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

require("telescope_setup")
require("keybindings_setup")
require("treesitter_setup")
