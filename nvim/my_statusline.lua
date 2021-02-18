local gl = require 'galaxyline'
local gls = gl.section

local fileinfo = require 'galaxyline.provider_fileinfo'
local u = require'utils'.u
local devicons = require 'nvim-web-devicons'
local cl = require 'cfg.colors'

gl.short_line_list = {'NvimTree', 'vista', 'dbui'}

local mode_map = {
  ['n'] = {'NORMAL', cl.normal},
  ['i'] = {'INSERT', cl.insert},
  ['R'] = {'REPLACE', cl.replace},
  ['v'] = {'VISUAL', cl.visual},
  ['V'] = {'V-LINE', cl.visual},
  ['c'] = {'COMMAND', cl.command},
  ['s'] = {'SELECT', cl.visual},
  ['S'] = {'S-LINE', cl.visual},
  ['t'] = {'TERMINAL', cl.terminal},
  [''] = {'V-BLOCK', cl.visual},
  [''] = {'S-BLOCK', cl.visual},
  ['Rv'] = {'VIRTUAL'},
  ['rm'] = {'--MORE'},
}

local sep = {
  right_filled = u 'e0b2',
  left_filld = u 'e0b0',
  right = u 'e0b3',
  left = u 'e0b1',
}

local icons = {
  locker = u 'f023',
  unsaved = u 'f693',
  dos = u 'e70f',
  unix = u 'f17c',
  mac = u 'f179',
}

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or cl.none end

local function highlight(group, fg, bg, gui)
  local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
  if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
  vim.cmd(cmd)
end

local function buffer_not_empty()
  if vim.fn.empty(vim.fn.expand '%:t') ~= 1 then return true end
  return false
end

local function diagnostic_exists()
  return vim.tbl_isempty(vim.lsp.buf_get_clients(0))
end

local function wide_enough()
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > 80 then return true end
  return false
end

gls.left = {
  {
    ViMode = {
      provider = function()
        local modehl = mode_hl()
        highlight('GalaxyViMode', cl.bg, modehl)
        highlight('GalaxyViModeInv', modehl, cl.bg)
        return string.format('  %s ', mode_label())
      end,
      separator = sep.left_filled,
      separator_highlight = 'GalaxyViModeInv',
    },
  }, {
    FileIcon = {
      provider = function()
        local fname, ext = vim.fn.expand('%:t'), vim.fn.expand('%:e')
        local icon, iconhl = devicons.get_icon(fname, ext)
        if icon == nil then return '' end
        local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), 'fg')
        highlight('GalaxyFileIcon', fg, cl.bg)
        return ' ' .. icon .. ' '
      end,
      condition = buffer_not_empty,
    },
    FileName = {
      provider = function()
        if not buffer_not_empty() then return '' end
        local fname
        if wide_enough() then
          fname = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
        else
          fname = vim.fn.expand '%:t'
        end
        if #fname == 0 then return '' end
        if vim.bo.readonly then fname = fname .. ' ' .. icons.locker end
        if vim.bo.modified then fname = fname .. ' ' .. icons.unsaved end
        return ' ' .. fname .. ' '
      end,
      highlight = {cl.fg, cl.bg},
      separator = sep.left,
      separator_highlight = 'GalaxyViModeInv',
    },
  },
}

gls.right = {
  {
    LspStatus = {
      provider = function()
        local connected = not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
        if connected then
          return ' ' .. u 'f817' .. ' '
        else
          return ''
        end
      end,
      highlight = {cl.lsp_active, cl.bg},
      separator = sep.right,
      separator_highlight = 'GalaxyViModeInv',
    },
  }, {
    DiagnosticWarn = {
      provider = function()
        local n = vim.lsp.diagnostic.get_count(0, 'Warning')
        if n == 0 then return '' end
        return string.format(' %s %d ', u 'f071', n)
      end,
      highlight = {'yellow', cl.bg},
    },
    DiagnosticError = {
      provider = function()
        local n = vim.lsp.diagnostic.get_count(0, 'Error')
        if n == 0 then return '' end
        return string.format(' %s %d ', u 'e009', n)
      end,
      highlight = {'red', cl.bg},
    },
  }, {
    FileType = {
      provider = function()
        if not buffer_not_empty() then return '' end
        local icon = icons[vim.bo.fileformat] or ''
        return string.format(' %s %s ', icon, vim.bo.filetype)
      end,
      highlight = {cl.fg, cl.bg},
      separator = sep.right,
      separator_highlight = 'GalaxyViModeInv',
    },
  }, {
    PositionInfo = {
      provider = {
        function()
          return string.format(' %s:%s ', vim.fn.line('.'), vim.fn.col('.'))
        end,
      },
      highlight = 'GalaxyViMode',
      condition = buffer_not_empty,
      separator = sep.right_filled,
      separator_highlight = 'GalaxyViModeInv',
    },
  }, {
    PercentInfo = {
      provider = fileinfo.current_line_percent,
      highlight = 'GalaxyViMode',
      condition = buffer_not_empty,
      separator = sep.right,
      separator_highlight = 'GalaxyViMode',
    },
  },
}

for k, v in pairs(gls.left) do gls.short_line_left[k] = v end
table.remove(gls.short_line_left, 1)

for k, v in pairs(gls.right) do gls.short_line_right[k] = v end
table.remove(gls.short_line_right)
table.remove(gls.short_line_right)
e
