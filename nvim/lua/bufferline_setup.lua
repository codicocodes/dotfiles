return function()
  require'bufferline'.setup{
    options = {
      view = "multiwindow",
      numbers = "ordinal",
      number_style = "superscript",
      mappings = true,
      buffer_close_icon= '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is deduplicated
      tab_size = 18,
      diagnostics ="nvim_lsp",
      diagnostics_indicator = function(count, level)
        return "("..count..")"
      end,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
      end,
      separator_style = "slant",
      enforce_regular_tabs = true,
    }
  }
end
