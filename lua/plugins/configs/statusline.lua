local present, feline = pcall(require, "feline")
if not present then
	return
end

local kanagawa = {
	bg = "#1F1F28", --  nvim bg
	black = "#1F1F28", --  nvim bg
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

-- define all components in large table c
-- then build left, right, and middle tables like 
  -- left = { c.file, c.vi_mode, c.foo, etc. }
-- define setup component table like 
-- components = { active = { left, middle, right }, inactive = { left, middle, right } }
-- then pass this components table to feline.setup like components = components

local components = {
  active = {},
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], {
  provider = 'vi_mode',
  hl = {
    fg = kanagawa.skyblue,
  },
  right_sep = ' ',
})

local M = {}

M.setup = function()
  feline.setup({
    theme = kanagawa,
    components = components,
  })
end

return M
