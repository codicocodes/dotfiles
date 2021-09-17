require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-o>"] = require'telescope.actions'.select_default,
        ["qq"] =require'telescope.actions'.close,
        ["<esc><esc>"] = require'telescope.actions'.close,
      },
      n = {
        ["<C-o>"] = require'telescope.actions'.select_default,
        ["o"] = require'telescope.actions'.select_default,
        ["<esc>"] = false,
        ["qq"] = require'telescope.actions'.close,
        ["<esc><esc>"] = require'telescope.actions'.close,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = false,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
}

local function select_background(prompt_bufnr, map)
  local function set_the_background(close)
    local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)

    require'wallpaper'.set_background(content.cwd .. "/" .. content.value)
    if close then
      require("telescope.actions").close(prompt_bufnr)
    end
  end

  map("i", "<CR>", function()
    set_the_background(true)
  end)

  map("", "<CR>", function()
    set_the_background(true)
  end)
end

local M = {}

local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )
    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

M.refactors = function()
    require("telescope.pickers").new({}, {
        prompt_title = "refactors",
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors(),
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end
    }):find()
end

M.wallpaper_selector = function()
  require("telescope.builtin").find_files({
      prompt_title = "Wallpapers",
      cwd = "~/wallpapers",
      attach_mappings = function(prompt_bufnr, map)
        -- map("", "<C-n>", require('telescope').actions.move_selection_next(prompt_bufnr))
        -- map("", "<C-p>", require('telescope').actions.move_selection_previous(prompt_bufnr))
        -- map("i", "<C-n>", require('telescope').actions.move_selection_next(prompt_bufnr))
        -- map("i", "<C-p>", require('telescope').actions.move_selection_previous(prompt_bufnr))
        -- map("i", "j", require('telescope').actions.move_selection_next(prompt_bufnr))
        -- map("i", "k", require('telescope').actions.move_selection_previous(prompt_bufnr))
        select_background(prompt_bufnr, map)
        return true
      end,
    })
end

return M

