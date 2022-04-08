local hi = vim.highlight

local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local highlight_group = require("core.utils").highlight_group

local nord = {
	white = "#abb2bf",
	darker_black = "#2a303c",
	black = "#2E3440", --  nvim bg
	black2 = "#343a46",
	one_bg = "#373d49",
	one_bg2 = "#464c58",
	one_bg3 = "#494f5b",
	grey = "#4b515d",
	grey_fg = "#565c68",
	grey_fg2 = "#606672",
	light_grey = "#646a76",
	red = "#BF616A",
	baby_pink = "#de878f",
	pink = "#d57780",
	line = "#3a404c", -- for lines like vertsplit
	green = "#A3BE8C",
	vibrant_green = "#afca98",
	blue = "#7797b7",
	nord_blue = "#81A1C1",
	yellow = "#EBCB8B",
	sun = "#e1c181",
	purple = "#aab1be",
	dark_purple = "#B48EAD",
	teal = "#6484a4",
	orange = "#e39a83",
	cyan = "#9aafe6",
	statusline_bg = "#333945",
	lightbg = "#3f4551",
	lightbg2 = "#393f4b",
	pmenu_bg = "#A3BE8C",
	folder_bg = "#7797b7",
}

local kanagawa = {
	white = "#DCD7BA",
	darker_black = "#191922",
	black = "#1F1F28", --  nvim bg
	black2 = "#25252e",
	one_bg = "#272730",
	one_bg2 = "#2f2f38",
	one_bg3 = "#363646",
	grey = "#43434c",
	grey_fg = "#4c4c55",
	grey_fg2 = "#53535c",
	light_grey = "#5c5c65",
	red = "#E46876",
	baby_pink = "#D27E99",
	pink = "#c8748f",
	line = "#272730", -- for lines like vertsplit
	green = "#98BB6C",
	vibrant_green = "#a3c677",
	nord_blue = "#7E9CD8",
	blue = "#7FB4CA",
	yellow = "#FF9E3B",
	sun = "#FFA066",
	purple = "#a48ec7",
	dark_purple = "#957FB8",
	teal = "#7AA89F",
	orange = "#fa9b61",
	cyan = "#A3D4D5",
	statusline_bg = "#24242d",
	lightbg = "#33333c",
	lightbg2 = "#2b2b34",
	pmenu_bg = "#a48ec7",
	folder_bg = "#7E9CD8",
}

-- Define the colour palette
local palette = {
	-- cyan = extract_highlight_colours("DraculaCyan").guifg,
	-- green = extract_highlight_colours("DraculaGreen").guifg,
	-- orange = extract_highlight_colours("DraculaOrange").guifg,
	-- purple = extract_highlight_colours("DraculaPurple").guifg,
	-- red = extract_highlight_colours("DraculaRed").guifg,
	-- pink = extract_highlight_colours("DraculaPink").guifg,
	--
	-- bg = extract_highlight_colours("Normal").guibg,
	-- fg = extract_highlight_colours("Normal").guifg,
	--
	-- black2 = extract_highlight_colours("DraculaBgDark").guibg,
	-- darker_black = extract_highlight_colours("DraculaBgDarker").guibg,
	-- light = extract_highlight_colours("DraculaBgLight").guibg,
	-- lighter = extract_highlight_colours("DraculaBgLighter").guibg,
	cyan = kanagawa.cyan,
	green = kanagawa.green,
	orange = kanagawa.orange,
	purple = kanagawa.purple,
	red = kanagawa.red,
	pink = kanagawa.pink,
	blue = kanagawa.blue,
	baby_pink = kanagawa.baby_pink,

	bg = kanagawa.black,
	fg = kanagawa.white,

	black2 = kanagawa.black2,
	darker_black = kanagawa.darker_black,
	light = kanagawa.lightbg,
	lighter = kanagawa.lightbg2,
	one_bg = kanagawa.one_bg,
	one_bg2 = kanagawa.one_bg2,
	one_bg3 = kanagawa.one_bg3,
	light_grey = kanagawa.light_grey,
	lightbg = kanagawa.lightbg,
	lightbg2 = kanagawa.lightbg2,
	grey = kanagawa.grey,

	light_red = nord.red,
	light_cyan = nord.cyan,
	light_green = nord.green,
	light_orange = nord.orange,
}

-- git
hi.link("DiffDelete", "DraculaRed", true)

--dashboard
fg("DashBoardHeader", palette.cyan)

-- galaxyline
local mode_to_colour = {
	Normal = palette.purple,
	Insert = palette.cyan,
	Command = palette.red,
	Visual = palette.orange,
	VisualLine = palette.orange,
	VisualBlock = palette.orange,
	Replace = palette.red,
	Snippet = palette.pink,
}
for mode, colour in pairs(mode_to_colour) do
	highlight_group("Galaxyline" .. mode .. "Mode", { guifg = palette.bg, guibg = colour })
	highlight_group("Galaxyline" .. mode .. "ModeText", { guifg = colour, guibg = palette.one_bg3 })
	highlight_group("Galaxyline" .. mode .. "ModeSeparator", { guifg = colour, guibg = palette.grey })
end

-- clean these highlights up soon - p sure i don't need half of them
highlight_group("GalaxylineSeparator", { guifg = palette.lighter, guibg = palette.even_lighter })

-- left
-- even_lighter, lighter, bg_dark
highlight_group("GalaxylineSeparator6", { guifg = palette.one_bg3, guibg = palette.one_bg3 })
highlight_group("GalaxylineSeparator10", { guifg = palette.grey, guibg = palette.one_bg3 })
highlight_group("GalaxylineSeparator2", { guifg = palette.one_bg2, guibg = palette.one_bg3 })
highlight_group("GalaxylineDir", { guifg = palette.fg, guibg = palette.one_bg2 })
highlight_group("GalaxylineSeparator5", { guifg = palette.one_bg, guibg = palette.one_bg2 })
highlight_group("GalaxylineFilename", { guifg = palette.fg, guibg = palette.one_bg })
highlight_group("GalaxylineSeparator3", { guifg = palette.one_bg, guibg = palette.bg })
highlight_group("GalaxylineIcon", { guifg = palette.light_grey, guibg = palette.bg })
highlight_group("GalaxylineBranch", { guifg = palette.light_grey, guibg = palette.bg })
highlight_group("GalaxylineDiffAdd", { guifg = palette.light_grey, guibg = palette.bg })
highlight_group("GalaxylineDiffModified", { guifg = palette.light_grey, guibg = palette.bg })
highlight_group("GalaxylineDiffRemove", { guifg = palette.light_red, guibg = palette.bg })

-- mid
highlight_group("GalaxylineMid", { guifg = palette.bg, guibg = palette.bg })

-- right
-- bg_dark, lighter, even_lighter
highlight_group("GalaxylineHint", { guifg = palette.light_cyan, guibg = palette.bg })
highlight_group("GalaxylineWarn", { guifg = palette.light_orange, guibg = palette.bg })
highlight_group("GalaxylineError", { guifg = palette.light_red, guibg = palette.bg })
highlight_group("GalaxylineLsp", { guifg = palette.light_grey, guibg = palette.bg })
highlight_group("GalaxylineSeparator11", { guifg = palette.one_bg2, guibg = palette.one_bg2 })
highlight_group("GalaxylineSeparator12", { guifg = palette.one_bg2, guibg = palette.bg })
highlight_group("GalaxylineLineInfo", { guifg = palette.fg, guibg = palette.one_bg2 })
highlight_group("GalaxylineSeparator14", { guifg = palette.grey, guibg = palette.one_bg2 })
highlight_group("GalaxylineLineInfoSep", { guifg = palette.light_red, guibg = palette.grey })
highlight_group("GalaxylineLineInfoIcon", { guifg = palette.bg, guibg = palette.light_red })
highlight_group("GalaxylinePercent", { guifg = palette.fg, guibg = palette.one_bg3 })
-- Sep10 is used here but already defined above
highlight_group("GalaxylinePercentIcon", { guifg = palette.bg, guibg = palette.light_green })
highlight_group("GalaxylinePercentSep", { guifg = palette.light_green, guibg = palette.grey })

-- -- cursorline
-- bg("ModesInsert", palette.cyan)
-- bg("ModesCopy", palette.orange)
-- bg("ModesVisual", palette.orange)
-- bg("ModesDelete", palette.red)

-- telescope
fg_bg("TelescopeBorder", palette.black2, palette.black2)
fg_bg("TelescopePromptBorder", palette.light, palette.light)

fg_bg("TelescopePromptNormal", palette.fg, palette.light)
fg_bg("TelescopePromptPrefix", palette.red, palette.light)
fg("TelescopePromptCounter", palette.fg)

bg("TelescopeNormal", palette.black2)

fg_bg("TelescopePreviewTitle", palette.black2, palette.green)
fg_bg("TelescopePromptTitle", palette.black2, palette.red)
fg_bg("TelescopeResultsTitle", palette.black2, palette.black2)

bg("TelescopeSelection", palette.light)

-- fidget
fg("FidgetTitle", palette.light_grey)

-- statusline
bg("StatusLine", palette.bg)
bg("StatusLineNC", palette.bg)

-- indent
fg("IndentBlanklineContextChar", palette.light_grey)
