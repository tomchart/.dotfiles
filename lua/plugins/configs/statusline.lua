local present, feline = pcall(require, "feline")
if not present then
	return
end
local present2, vi_mode_utils = pcall(require, "feline.providers.vi_mode")
if not present2 then
  return
end

local icons = {
    linux = ' ',
    macos = ' ',
    windows = ' ',

    errs = ' ',
    warns = ' ',
    infos = ' ',
    hints = ' ',

    lsp = ' ',
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = icons.linux
    elseif os == 'MAC' then
        icon = icons.macos
    else
        icon = icons.windows
    end
    return icon .. os
end

local function dir_info()
  local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.:h")
  if dir == '.' then
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
  else
    return dir
  end
end

local kanagawa = {
	bg = "#1F1F28", --  nvim bg
	darker_black = "#191922",
	black = "#1F1F28", --  nvim bg
	black2 = "#25252e",
	one_bg = "#272730",
	one_bg2 = "#2f2f38",
	one_bg3 = "#363646",
	grey = "#43434c",
	grey_fg = "#4c4c55",
	grey_fg2 = "#53535c",
	yellow = "#FF9E3B",
	cyan = "#A3D4D5",
	skyblue = "#957FB8",
	green = "#98BB6C",
	orange = "#fa9b61",
	violet = "#c8748f",
	magenta = "#a48ec7",
	white = "#DCD7BA",
	fg = "#DCD7BA",
	oceanblue = "#957FB8",
	red = "#E46876",
	light_grey = "#5c5c65",
	line = "#272730", -- for lines like vertsplit
	vibrant_green = "#a3c677",
	sun = "#FFA066",
	teal = "#7AA89F",
	statusline_bg = "#24242d",
	lightbg = "#33333c",
	lightbg2 = "#2b2b34",
	pmenu_bg = "#a48ec7",
	folder_bg = "#7E9CD8",
	baby_pink = "#D27E99",
	pink = "#c8748f",
	purple = "#a48ec7",
	dark_purple = "#957FB8",
}

local gruvbox = {
  bg = '#282828',
  black = '#282828',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#a89984',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
}

local catppuccin = {
  bg = '#1e1e2e',
  black = '#1e1e2e',
  yellow = '#f9e2af',
  cyan = '#94e2d5',
  oceanblue = '#89b4fa',
  green = '#a6e3a1',
  orange = '#fab387',
  violet = '#cba6f7',
  magenta = '#eba0ac',
  white = '#f5e0dc',
  fg = '#f5e0dc',
  skyblue = '#74c7ec',
  red = '#f38ba8',
}

local tokyonightstorm = {
  bg = "#24283b",
  black = "#24283b",
  yellow = "#e0af68",
  cyan = "#7dcfff",
  oceanblue = "#7aa2f7",
  green = "#9ece6a",
  orange = "#e0af68",
  violet = "#bb9af7",
  magenta = "#bb9af7",
  white = "#c0caf5",
  fg = "#c0caf5",
  skyblue = "#7dcfff",
  red = "#f7768e",
}

local vi_mode_colors = {
  NORMAL = kanagawa.green,
  OP = kanagawa.green,
  INSERT = kanagawa.red,
  CONFIRM = kanagawa.red,
  VISUAL = kanagawa.orange,
  LINES = kanagawa.skyblue,
  BLOCK = kanagawa.skyblue,
  REPLACE = kanagawa.skyblue,
  ['V-REPLACE'] = kanagawa.skyblue,
  ENTER = kanagawa.cyan,
  MORE = kanagawa.cyan,
  SELECT = kanagawa.orange,
  COMMAND = kanagawa.red,
  SHELL = kanagawa.green,
  TERM = kanagawa.green,
  NONE = kanagawa.yellow
}

local c = {
  vi_mode_icon = {
    -- provider = ' ',
    provider = ' ',
    hl = function()
      local val = {}
      val.bg = kanagawa.statusline_bg
      val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      return val
    end,
    left_sep = 'block',
    right_sep = 'block'
  },
  vi_mode_text = {
    provider = function ()
      return ' ' .. vi_mode_utils.get_vim_mode() .. ' '
    end,
    hl = function()
      local val = {}
      val.bg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      val.fg = kanagawa.statusline_bg
      return val
    end,
    left_sep = {
      str = 'left_filled',
      hl = function()
        local val = {}
        val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
        val.bg = kanagawa.statusline_bg
        return val
      end,
    },
    right_sep = {
      str = 'right_filled',
      hl = function()
        local val = {}
        val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
        val.bg = kanagawa.statusline_bg
        return val
      end,
    },
  },
  folder = {
    provider = function()
      local dir_name = dir_info()
      return "  " .. dir_name
    end,
    hl = function()
      local val = {}
      val.fg = kanagawa.teal
      val.bg = kanagawa.statusline_bg
      return val
    end,
    right_sep = 'block'
  },
  filename = {
    provider = 'file_info',
    opts = {
      type = 'relative'
    },
    hl = {
      fg = kanagawa.teal,
      bg = kanagawa.statusline_bg,
      style = 'bold'
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  git_diff_added = {
    provider = 'git_diff_added',
    hl = {
      fg = kanagawa.green,
      bg = kanagawa.statusline_bg
    },
    right_sep = 'block',
  },
  git_diff_removed = {
    provider = 'git_diff_removed',
    hl = {
      fg = kanagawa.red,
      bg = kanagawa.statusline_bg
    },
    right_sep = 'block',
  },
  git_diff_changed = {
    provider = 'git_diff_changed',
    hl = {
      fg = kanagawa.yellow,
      bg = kanagawa.statusline_bg
    },
    right_sep = 'block',
  },
  bg = {
    hl = {
      bg = kanagawa.statusline_bg
    }
  },
  git_branch = {
    provider = 'git_branch',
    hl = {
      fg = kanagawa.orange,
      bg = kanagawa.statusline_bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  line_percentage = {
    provider = 'line_percentage',
    hl = function()
      local val = {}
      val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      val.bg = kanagawa.statusline_bg
      return val
    end,
    left_sep = 'block',
    right_sep = 'block'
  },
  scroller = {
    provider = 'scroll_bar',
    hl = function()
      local val = {}
      val.fg = vi_mode_colors[vi_mode_utils.get_vim_mode()]
      val.bg = kanagawa.statusline_bg
      return val
    end,
    left_sep = 'block',
    right_sep = 'block'
  },
  encoding = {
    provider = 'file_encoding',
    hl = {
      fg = kanagawa.light_grey,
      bg = kanagawa.statusline_bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  format = {
    provider = file_osinfo,
    hl = {
      fg = kanagawa.light_grey,
      bg = kanagawa.statusline_bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  lsp_name = {
    provider = 'lsp_client_names',
    hl = {
      fg = kanagawa.purple,
      bg = kanagawa.statusline_bg
    },
    left_sep = 'block',
    right_sep = 'block'
  },
  diag_err = {
    provider = 'diagnostic_errors',
    hl = {
      fg = kanagawa.red,
      bg = kanagawa.statusline_bg
    }
  },
  diag_warn = {
    provider = 'diagnostic_warnings',
    hl = {
      fg = kanagawa.yellow,
      bg = kanagawa.statusline_bg
    }
  },
  diag_hint = {
    provider = 'diagnostic_hints',
    hl = {
      fg = kanagawa.cyan,
      bg = kanagawa.statusline_bg
    }
  },
  diag_info = {
    provider = 'diagnostic_info',
    hl = {
      fg = kanagawa.purple,
      bg = kanagawa.statusline_bg
    }
  },
  position = {
    provider = 'position',
    hl = {
      fg = kanagawa.light_grey,
      bg = kanagawa.statusline_bg
    },
    left_sep = 'block',
    right_sep = 'block',
  }
}

local left = { c.vi_mode_icon, c.vi_mode_text, c.filename, c.git_branch, c.git_diff_added, c.git_diff_removed, c.git_diff_changed, c.bg }
local right = { c.diag_info, c.diag_hint, c.diag_warn, c.diag_err, c.lsp_name, c.folder, c.format, c.encoding, c.position, c.line_percentage, c.scroller }

local components = {
  active = { left, right },
  inactive = {}
}

table.insert(components.inactive, {})
table.insert(components.inactive, {})

local M = {}

M.setup = function()
  feline.setup({
    theme = kanagawa,
    components = components,
  })
end

return M
