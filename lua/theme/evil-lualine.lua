-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require 'lualine'

  -- Color scheme
local colors
if vim.api.nvim_get_option('background') == 'dark' then
-- Gruvbox
colors = {
  bg           = '#1d2021',
  fg           = '#a89984',
  yellow       = '#fabd2f',
  cyan         = '#83a598',
  green        = '#b8bb26',
  black        = '#282828',
  white        = '#ebdbb2',
  red          = '#fb4934',
  orange       = '#fe8019',
  violet       = '#d3869b',
  blue         = '#83a598',
  gray         = '#a89984',
}
else
-- Light Theme
colors = {
  bg           = '#fbf1c7',
  fg           = '#3c3836',
  yellow       = '#d79921',
  cyan         = '#458588',
  green        = '#98971a',
  black        = '#282828',
  white        = '#f9f5d7',
  red          = '#cc241d',
  orange       = '#d65d0e',
  violet       = '#b16286',
  blue         = '#076678',
  gray         = '#928374',
}
end


local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {c = {fg = colors.fg, bg = colors.bg}},
      inactive = {c = {fg = colors.bg, bg = colors.fg}}
    }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function ()
    return vim.fn.mode()
  end,
  -- mode component
  color = {fg = colors.black, bg = colors.orange, gui = 'bold'},
  upper = true
}

ins_left {
  -- filesize component
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then return '' end
      local sufixes = {'b', 'k', 'm', 'g'}
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format('%.1f%s', size, sufixes[i])
    end
    local file = vim.fn.expand('%:p')
    if string.len(file) == 0 then return '' end
    return format_file_size(file)
  end,
  condition = conditions.buffer_not_empty
}

ins_left {
  'filename',
  condition = conditions.buffer_not_empty,
  color = {fg = colors.red, gui = 'bold'}
}

ins_left {'location'}

ins_left {'progress', color = {fg = colors.fg, gui = 'bold'}}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = '??? ', warn = '??? ', info = '??? '},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan
}

ins_left {
  'branch',
  icon = '???',
  condition = conditions.check_git_workspace,
  color = {fg = colors.orange, gui = 'bold'}
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {function() return '%=' end}

--[[ ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '??? LSP:',
  color = {fg = colors.fg, gui = 'bold'}
}
 ]]
-- Add components to right sections

--[[ ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = {added = '??? ', modified = '??? ', removed = '??? '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width
}
 ]]
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  upper = true, -- I'm not sure why it's upper case either ;)
  condition = conditions.hide_in_width,
  color = {fg = colors.yellow, gui = 'bold'}
}

ins_right {
  'fileformat',
  upper = true,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = {fg = colors.green, gui = 'bold'}
}

-- Now don't forget to initialize lualine
lualine.setup(config)
