local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-explorer"}

local doom_one_colors = {
  bg = "#21242b",
  fg = "#bbc2cf",
  line_bg = "#21242b",
  fg_green = "#98be65",
  yellow = "#ecbe7b",
  cyan = "#46d9ff",
  darkblue = "#2257a0",
  green = "#98be65",
  orange = "#da8548",
  purple = "#a9a1e1",
  magenta = "#c678dd",
  grey = "#3f444a",
  blue = "#51afef",
  red = "#ff6c6b"
}

local one_dark_colors = {
  bg = "#2e3440",
  fg = "#81a1c1",
  line_bg = "#2e3440",
  fg_green = "#6d96a5",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#608B4E",
  orange = "#FF8800",
  purple = "#5d4d7a",
  magenta = "#d16d9e",
  grey = "#c0c0c0",
  blue = "#569CD6",
  red = "#D16969"
}

local nord_colors = {
  -- bg = "NONE",
  bg = "#2E3440",
  fg = "#81A1C1",
  line_bg = "NONE",
  lbg = "#3B4252",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#5E81AC",
  red = "#BF616A"
}

local current_theme = doom_one_colors

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {current_theme.blue, current_theme.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = current_theme.magenta,
        i = current_theme.green,
        v = current_theme.blue,
        [""] = current_theme.blue,
        V = current_theme.blue,
        c = current_theme.red,
        no = current_theme.magenta,
        s = current_theme.orange,
        S = current_theme.orange,
        [""] = current_theme.orange,
        ic = current_theme.yellow,
        R = current_theme.purple,
        Rv = current_theme.purple,
        cv = current_theme.red,
        ce = current_theme.red,
        r = current_theme.cyan,
        rm = current_theme.cyan,
        ["r?"] = current_theme.cyan,
        ["!"] = current_theme.red,
        t = current_theme.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      -- return "     "
	return "   " .. fn.mode() .. " "
    end,
    highlight = {current_theme.red, current_theme.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.providers.fileinfo").get_file_icon_color, current_theme.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {current_theme.purple, current_theme.bg},
    highlight = {current_theme.purple, current_theme.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.providers.vcs").check_git_workspace,
    highlight = {current_theme.orange, current_theme.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.providers.vcs").check_git_workspace,
    separator = " ",
    separator_highlight = {current_theme.purple, current_theme.bg},
    highlight = {current_theme.orange, current_theme.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {current_theme.green, current_theme.line_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {current_theme.yellow, current_theme.line_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {current_theme.red, current_theme.line_bg}
  }
}

section.right[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " ",
    separator_highlight = {current_theme.blue, current_theme.line_bg},
    highlight = {current_theme.gray, current_theme.line_bg}
  }
}
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {current_theme.blue, current_theme.line_bg},
--     highlight = {current_theme.fg, current_theme.line_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {current_theme.red, current_theme.line_bg},
    separator_highlight = {current_theme.bg, current_theme.bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = " ",
    highlight = {current_theme.yellow, current_theme.line_bg},
    separator_highlight = {current_theme.bg, current_theme.bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {current_theme.green, current_theme.line_bg},
    separator_highlight = {current_theme.bg, current_theme.bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = " ",
    highlight = {current_theme.blue, current_theme.line_bg},
    separator_highlight = {current_theme.bg, current_theme.bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = "FileIcon",
    separator = " ",
    separator_highlight = {"NONE", current_theme.lbg},
    highlight = {current_theme.blue, current_theme.lbg, "bold"}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function()
      local fileinfo = require("galaxyline.providers.fileinfo")
      local fname = fileinfo.get_current_file_name()
      for _, v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ""
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {current_theme.white, current_theme.lbg, "bold"}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {current_theme.fg, current_theme.lbg}
  }
}
