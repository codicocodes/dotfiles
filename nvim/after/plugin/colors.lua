require('tokyonight').setup({
  transparent = true,
  style = "storm",
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { italic = true },
    variables = { italic = false },
  }
})

local highlight_group_names = {
  'Pmenu', 'Normal', 'NormalFloat', 'StatusLine', 'StatusLineNC', 'SignColumn', 'TelescopeNormal', 'TelescopeBorder',
  'TelescopePromptBorder',  'TelescopeResultsBorder',  'TelescopePreviewBorder',
  'NvimTreeNormal', 'NvimTreeNormalNC', 'NvimTreeVertSplit', 'NvimTreeStatusLine', 'NvimTreeNormalNC',
  'NvimTreeCursorLine', 'NvimTreeWinSeparator', 'LspFloatWinNormal'
}

local function update_colors(color)
  for _, name in pairs(highlight_group_names) do
    vim.api.nvim_set_hl(0, name, { bg = color })
  end
  -- vim.api.nvim_set_hl(0, 'LineNr', { fg='gray' })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#9d7cd8' })
  vim.cmd.set('cursorline')
  vim.cmd.set('cursorlineopt=number')
end

function SetColors(color)
  color = color or 'tokyonight'
  vim.cmd.colorscheme(color)
  local transparent = 'none'
  update_colors(transparent)
end

function Present()
  local dark_background = '#16161e'
  update_colors(dark_background)
end

vim.api.nvim_command('command! Present lua Present()')
vim.api.nvim_command('command! Colors lua SetColors()')

SetColors()
