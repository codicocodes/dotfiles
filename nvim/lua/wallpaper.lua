local bg_directory = "/Users/codico/wallpapers"

local function get_all_files(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

local get_random = function(images_table)
---@diagnostic disable-next-line: undefined-field
    local table_length = table.getn(images_table)
    math.randomseed(os.time())
    local selected = math.random(1, table_length)
    local img = images_table[selected]
    local suffix = ".png"
    local isPng = img:sub(-string.len(suffix)) == suffix
    if not isPng then
      print('its not a png...')
      -- return get_random(images_table)
    end
    return img
end

local function set_background(image_path)
  local kittyCmd = "kitty @ set-background-image " .. image_path
  vim.fn.system(kittyCmd)
  local configUpdate = 'echo "background_image ' ..image_path ..'" > ' .."$HOME/code/dotfiles/kitty/background_image.conf"
  vim.fn.system(configUpdate)
end

local M = {}

M.set_random_background = function()
  print('Setting background (* ^ ω ^)..')
  local random_image = get_random(get_all_files(bg_directory))
  local image_path = "$HOME/wallpapers/" .. random_image
  set_background(image_path)
end

M.set_background = function(path)
  set_background(path)
end

return M

