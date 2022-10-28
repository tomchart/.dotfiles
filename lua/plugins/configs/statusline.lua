local present, feline = pcall(require, "feline")
if not present then
	return
end
local present2, vi_mode_utils = pcall(require, "feline.providers.vi_mode")
if not present2 then
  return
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
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  CONFIRM = 'red',
  VISUAL = 'orange',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'skyblue',
  ['V-REPLACE'] = 'skyblue',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'red',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

-- define all components in large table c
-- then build left, right, and middle tables like 
  -- left = { c.file, c.vi_mode, c.foo, etc. }
-- define setup component table like 
-- components = { active = { left, middle, right }, inactive = { left, middle, right } }
-- then pass this components table to feline.setup like components = components
--
-- the issue i was having before was from not having defined the table fully before appending to it
-- for a reason i dont yet understand this simply does not work
--
-- what i have below is now working, thankfully
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
      local dir_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.:h")
      return "  " .. dir_name .. " "
    end,
    hl = function()
      local val = {}
      val.fg = kanagawa.light_grey
      val.bg = kanagawa.statusline_bg
      return val
    end,
    right_sep = 'block'
  },
  file_info = {
    provider = 'file_info',
    hl = {
      fg = kanagawa.white,
      bg = kanagawa.statusline_bg
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
}

local left = { c.vi_mode_icon, c.vi_mode_text, c.file_info, c.git_diff_added, c.git_diff_removed, c.git_diff_changed, c.folder, c.bg }

local components = {
  active = { left },
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- table.insert(components.active[1], {
--   provider = 'vi_mode',
--   hl = {
--     fg = kanagawa.skyblue,
--   },
--   right_sep = ' ',
-- })

local M = {}

M.setup = function()
  feline.setup({
    theme = kanagawa,
    components = components,
  })
end

return M
