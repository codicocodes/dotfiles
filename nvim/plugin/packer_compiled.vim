" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/codico/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/codico/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/codico/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/codico/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/codico/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["blamer.nvim"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18my_statusline\frequire\0" },
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  gloombuddy = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/gloombuddy"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/Users/codico/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  }
}

-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18my_statusline\frequire\0", "config", "galaxyline.nvim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
