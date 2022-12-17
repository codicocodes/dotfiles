return function()
  require'bufferline'.setup{
    options = {
      view = "multiwindow",
      numbers = "ordinal",
      number = "superscript",
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 25, -- prefix used when a buffer is deduplicated
      tab_size = 20,
      diagnostics ="nvim_lsp",
      -- indicator_icon = '▎',
      -- buffer_close_icon = '',
      -- modified_icon = '●',
      -- close_icon = '',
      -- left_trunc_marker = '',
      -- right_trunc_marker = '',
      close_icon = '',
      buffer_close_icon = '',
      show_buffer_close_icons = true,
      show_close_icon = true,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and "" or ""
        return " " .. icon .. count
      end,
      separator_style = "thin",
    }
  }
end
