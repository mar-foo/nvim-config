local present1, gl = pcall(require, 'galaxyline')
if not present1 then
    print("galaxyline not found")
    return
end

local gls = gl.section

local gruvbox_dark_colors = {
	bg = "#282828",
	fg = "#fbf1c7",
	line_bg = "#282828",
	fg_green = "#b8bb26",
	yellow = "#fabd2f",
	cyan = "#8ec07c",
	darkblue = "#458588",
	green = "#b8bb26",
	orange = "#fe8019",
	purple = "#d3869b",
	magenta = "#9d0006",
	grey = "#665c54",
	blue = "#076678",
	red = "#fb4934"
}

local gruvbox_light_colors = {
	bg = "#d5c4a1",
	fg = "#282828",
	line_bg = "#d5c4a1",
	fg_green = "#79740e",
	yellow = "#b57614",
	cyan = "#427b58",
	darkblue = "#458588",
	green = "#79740e",
	orange = "#af3a03",
	purple = "#8f3f71",
	magenta = "#fb4934",
	grey = "#665c54",
	blue = "#076678",
	red = "#9d0006"
}

local colors

if Read_file(os.getenv('HOME') .. '/.cache/themechange/current') == 'dark\n' then
	colors = gruvbox_dark_colors
else
	colors = gruvbox_light_colors
end


local function lsp_status(status)
    local shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        local err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end

local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end

local function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function get_current_func()
  local has_func, func_name = pcall(vim.fn.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

local function get_function_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_current_func()
    end
  return ''
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

CocStatus = get_diagnostic_info
CocFunc = get_function_info
TrailingWhiteSpace = trailing_whitespace

local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

-- insert_left insert item at the left panel
local function insert_left(element)
  table.insert(gls.left, element)
end

-- insert_blank_line_at_left insert blank line with
-- line_bg color.
local function insert_blank_line_at_left()
insert_left {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.line_bg,colors.line_bg}
  }
}
end

-- insert_right insert given item into galaxyline.right
local function insert_right(element)
  table.insert(gls.right, element)
end

-- insert_blank_line_at_left insert blank line with
-- line_bg color.
local function insert_blank_line_at_right()
insert_right {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.line_bg,colors.line_bg}
  }
}
end

-----------------------------------------------------
----------------- start insert ----------------------
-----------------------------------------------------

--{ mode panel start
insert_left{
  Start = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,}
  }
}

insert_blank_line_at_left()

insert_left{
  ViMode = {
    icon = function()
        local icons = {
            n      = ' ',
            i      = ' ',
            c      = 'ﲵ ',
            V      = ' ',
            [''] = ' ',
            v      = ' ',
            C      = 'ﲵ ',
            R      = '﯒ ',
            t      = ' ',
        }
        return icons[vim.fn.mode()]
      end,
    provider = function()
      -- auto change color according the vim mode
      local alias = {
          n      = 'N',
          i      = 'I',
          c      = 'C',
          V      = 'VL',
          [''] = 'V',
          v      = 'V',
          C      = 'C',
          ['r?'] = ':CONFIRM',
          rm     = '--MORE',
          R      = 'R',
          Rv     = 'R&V',
          s      = 'S',
          S      = 'S',
          ['r']  = 'HIT-ENTER',
          [''] = 'SELECT',
          t      = 'T',
          ['!']  = 'SH',
      }
      local mode_color = {
        n = colors.yellow,      i = colors.green,   v=colors.blue,
        [''] = colors.blue,   V=colors.blue,      c = colors.magenta,
        no = colors.red,        s = colors.orange,  S=colors.orange,
        [''] = colors.orange, ic = colors.yellow, R = colors.purple,
        Rv = colors.purple,     cv = colors.red,    ce=colors.red,
        r = colors.cyan,        rm = colors.cyan,   ['r?'] = colors.cyan,
        ['!'] = colors.red,     t = colors.red
      }

      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return alias[vim_mode]
    end,
    highlight = {colors.line_bg, colors.line_bg},
  },
}

insert_blank_line_at_left()

insert_left{
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg, },
  }
}

--mode panel end}

-- {information panel start
insert_left{
  Start = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,}
  }
}

insert_left{
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.providers.fileinfo').get_file_icon_color,colors.line_bg},
  },
}

insert_left{
  FileName = {
    provider = function()
      return vim.fn.expand("%:F")
    end,
    condition = function() return buffer_not_empty and has_file_type() end,
    highlight = {colors.fg,colors.line_bg}
  }
}

insert_blank_line_at_left()

insert_left {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.providers.vcs').check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
  }
}

insert_left {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.providers.vcs').check_git_workspace,
    highlight = {'#8FBCBB',colors.line_bg,'bold'},
  }
}

insert_blank_line_at_left()

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

insert_left {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.green,colors.line_bg},
  }
}

insert_left {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.orange,colors.line_bg},
  }
}

insert_left {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.red,colors.line_bg},
  }
}

insert_left {
    TrailingWhiteSpace = {
     provider = TrailingWhiteSpace,
     icon = '  ',
     highlight = {colors.yellow,colors.line_bg},
    }
}

insert_left {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.line_bg}
  }
}

insert_left {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.line_bg},
  }
}

insert_left {
    DiagnosticHint = {
     provider = 'DiagnosticHint',
     condition = function() return checkwidth() end,
     highlight = {colors.white,colors.line_bg},
     icon = '  ',
    }
}

insert_left{
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg, },
  }
}
-- left information panel end}

insert_right{
  Start = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,}
  }
}

insert_blank_line_at_right()

insert_right{
  FileFormat = {
    provider = 'FileFormat',
        condition = checkwidth,
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

insert_blank_line_at_right()

insert_right{
  LineInfo = {
    provider = 'LineColumn',
    separator = '',
    separator_highlight = {colors.green, colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
        condition = checkwidth,
  },
}

insert_right{
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.cyan, colors.line_bg,'bold'},
        condition = checkwidth,
  }
}

insert_right{
  Encode = {
    provider = 'FileEncode',
    separator = '',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.cyan, colors.line_bg,'bold'},
        condition = checkwidth,
  }
}

insert_blank_line_at_right()

insert_right{
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg, },
  }
}

gl.short_line_list = {
    'LuaTree', 'vista', 'dbui', 'startify', 'term', 'nerdtree', 'fugitive',
    'fugitiveblame', 'plug', 'NvimTree', 'DiffviewFiles'
}

require ('galaxyline').section.short_line_left = {
  {
    ShortLineLeftBufferType = {
      highlight = {colors.cyan, colors.line_bg},
      provider = function ()
        local BufferTypeMap = {
          ['Mundo'] = 'Mundo History',
          ['MundoDiff'] = 'Mundo Diff',
          ['NvimTree'] = ' Tree',
          ['fugitive'] = ' Fugitive',
          ['fugitiveblame'] = ' Fugitive Blame',
          ['help'] = ' Help',
          ['minimap'] = 'Minimap',
          ['qf'] = ' Quick Fix',
          ['tabman'] = 'Tab Manager',
          ['tagbar'] = 'Tagbar',
          ['toggleterm'] = 'Terminal',
          ['FTerm'] = 'Terminal',
          ['NeogitStatus'] = ' Neogit Status',
          ['NeogitPopup'] = ' Neogit Popup',
          ['NeogitCommitMessage'] = ' Neogit Commit',
          ['DiffviewFiles'] = ' Diff View'
        }
        local name = BufferTypeMap[vim.bo.filetype] or ' Editor'
        return string.format('  %s', name)
      end,
      separator = ' ',
      separator_highlight = {colors.line_bg, colors.dark}
    }
  },
  {
    ShortLineLeftWindowNumber = {
      highlight = {colors.cyan, colors.dark},
      provider = function()
        return ' ' .. vim.api.nvim_win_get_number(vim.api.nvim_get_current_win())
      end,
      separator = '',
      separator_highlight = {colors.dark, "#0c0e17"}
    }
  }
}
