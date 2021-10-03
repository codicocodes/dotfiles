local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

local colors = {
  bg = '#ec5f67',
  yellow = '#e0af68',
  cyan = '#2ac3de',
  darkblue = '#081633',
  green = '#9ece6a',
  orange = '#ff9e64',
  purple = '#9d7cd8',
  magenta = '#bb9af7',
  blue = '#0db9d7',
  red = '#f7768e',
  pink = '#c981c5',
  violet=''
}

-- local buffer_not_empty = function()
--   if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
--     return true
--   end
--   return false
-- end

gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {n = ' am very normal :) ',i = ' inserting shit ',c= 'i command thee ',v= ' soo visual ',V= ' such visual line ', [''] = 'its a block '}
      return alias[vim.fn.mode()]
    end,
    highlight = {colors.purple},
  },
}

gls.left[4] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color},
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.blue, nil}
  }
}

gls.left[6] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    highlight = {colors.violet},
  }
}

gls.left[7] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.yellow},
    separator = ' ',
  }
}

gls.left[8]= {
  DiagnosticError = {
    separator = ' ',
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red}
  }
}

gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
  }
}

gls.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green},
  }
}

gls.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange},
  }
}

gls.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red},
  }
}

gls.right[4] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = {colors.fg},
  },
}

gls.right[5] = {
  PerCent = {
    provider = 'LinePercent',
    highlight = {colors.fg},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' deez nuts ',
    highlight = {colors.pink}
  }
}

gls.short_line_right[2] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg}
  }
}

gls.short_line_left[3] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.blue}
  }
}
