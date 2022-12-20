local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local x = require("core.utils").extract_highlight_colours
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
	cyan = kanagawa.cyan,
	green = kanagawa.green,
	orange = kanagawa.orange,
	purple = kanagawa.purple,
	red = kanagawa.red,
	yellow = kanagawa.yellow,
	pink = kanagawa.pink,
	blue = kanagawa.blue,
	baby_pink = kanagawa.baby_pink,
  teal = kanagawa.teal,

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

--dashboard
fg("DashBoardHeader", palette.teal)

-- cmp
highlight_group("Pmenu", { guibg = palette.black2, guifg = palette.fg })
highlight_group("PmenuSbar", { guibg = palette.black2, guifg = palette.fg })
highlight_group("PmenuThumb", { guibg = palette.light, guifg = palette.fg })
highlight_group("PmenuSel", { guibg = palette.light, guifg = "NONE" })
highlight_group("CmpItemMenu", { guibg = "NONE", guifg = palette.even_lighter })
highlight_group("CmpItemAbbr", { guibg = "NONE", guifg = palette.fg })
highlight_group("CmpItemAbbrMatch", { guibg = "NONE", guifg = palette.blue })
highlight_group("CmpItemAbbrMatchFuzzy", { guibg = "NONE", guifg = palette.light_red })
highlight_group("CmpItemKindDefault", { guibg = "NONE", guifg = palette.fg })
highlight_group("CmpItemKindKeyword", { guibg = "NONE", guifg = palette.fg })
highlight_group("CmpItemKindField", { guibg = "NONE", guifg = palette.red })
highlight_group("CmpItemKindProperty", { guibg = "NONE", guifg = palette.red })
highlight_group("CmpItemKindEvent", { guibg = "NONE", guifg = palette.red })
highlight_group("CmpItemKindText", { guibg = "NONE", guifg = palette.green })
highlight_group("CmpItemKindEnum", { guibg = "NONE", guifg = palette.green })
highlight_group("CmpItemKindKeyword", { guibg = "NONE", guifg = palette.green })
highlight_group("CmpItemKindConstant", { guibg = "NONE", guifg = palette.orange })
highlight_group("CmpItemKindConstructor", { guibg = "NONE", guifg = palette.orange })
highlight_group("CmpItemKindReference", { guibg = "NONE", guifg = palette.orange })
highlight_group("CmpItemKindFunction", { guibg = "NONE", guifg = palette.purple })
highlight_group("CmpItemKindStruct", { guibg = "NONE", guifg = palette.purple })
highlight_group("CmpItemKindClass", { guibg = "NONE", guifg = palette.purple })
highlight_group("CmpItemKindModule", { guibg = "NONE", guifg = palette.purple })
highlight_group("CmpItemKindOperator", { guibg = "NONE", guifg = palette.purple })
highlight_group("CmpItemKindVariable", { guibg = "NONE", guifg = palette.blue })
highlight_group("CmpItemKindFile", { guibg = "NONE", guifg = palette.grey })
highlight_group("CmpItemKindUnit", { guibg = "NONE", guifg = palette.orange })
highlight_group("CmpItemKindSnippet", { guibg = "NONE", guifg = palette.orange })
highlight_group("CmpItemKindFolder", { guibg = "NONE", guifg = palette.orange })
highlight_group("CmpItemKindMethod", { guibg = "NONE", guifg = palette.light_cyan })
highlight_group("CmpItemKindValue", { guibg = "NONE", guifg = palette.light_cyan })
highlight_group("CmpItemKindEnumMember", { guibg = "NONE", guifg = palette.light_cyan })
highlight_group("CmpItemKindInterface", { guibg = "NONE", guifg = palette.teal })
highlight_group("CmpItemKindColor", { guibg = "NONE", guifg = palette.teal })
highlight_group("CmpItemKindTypeParameter", { guibg = "NONE", guifg = palette.teal })

-- fidget
fg("FidgetTitle", palette.light_grey)

-- statusline
bg("StatusLine", palette.bg)
fg("StatusLineNC", palette.bg)

-- indent
fg("IndentBlanklineContextChar", palette.light_grey)

-- treesitter-context
fg_bg("TreesitterContext", palette.pink, palette.bg)
fg_bg("TreesitterContextLineNumber", palette.yellow, palette.bg)

-- linenr
fg("LineNr", nord.light_grey)
fg("CursorLineNr", palette.green)

-- leap
fg_bg("LeapLabelPrimary", palette.bg, palette.light_cyan)
fg_bg("LeapLabelSecondary", palette.bg, palette.green)

-- lsp
fg("DiagnosticError", palette.red)
fg("DiagnosticWarn", palette.yellow)
fg("DiagnosticHint", palette.teal)
fg("DiagnosticInfo", palette.purple)
