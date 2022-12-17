function SetColors(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
  local transparent = "none"
	vim.api.nvim_set_hl(0, "Normal", { bg = transparent })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = transparent })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = transparent })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = transparent })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = transparent })
  vim.cmd(("highlight ZenBg guibg=%s guifg=none"):format(transparent, transparent))
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = transparent })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = transparent })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = transparent })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = transparent })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = transparent })
end

require("tokyonight").setup({
  transparent = true,
})

SetColors()
