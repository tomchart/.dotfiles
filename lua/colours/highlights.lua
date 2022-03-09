local hi = vim.highlight

local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local extract_highlight_colours = require("core.utils").extract_highlight_colours
local highlight_group = require("core.utils").highlight_group

vim.cmd("colorscheme dracula")

-- Define the colour palette
local palette = {
	cyan = extract_highlight_colours("DraculaCyan").guifg,
	green = extract_highlight_colours("DraculaCyan").guifg,
	orange = extract_highlight_colours("DraculaOrange").guifg,
	purple = extract_highlight_colours("DraculaPurple").guifg,
	red = extract_highlight_colours("DraculaRed").guifg,
	pink = extract_highlight_colours("DraculaPink").guifg,

	bg = extract_highlight_colours("Normal").guibg,
	fg = extract_highlight_colours("Normal").guifg,

	black2 = extract_highlight_colours("DraculaBgDark").guibg,
	darker_black = extract_highlight_colours("DraculaBgDarker").guibg,
	light = extract_highlight_colours("DraculaBgLight").guibg,
	lighter = extract_highlight_colours("DraculaBgLighter").guibg,
}

-- git
hi.link("DiffDelete", "DraculaRed", true)

-- gitsigns
hi.link("GitSignsCurrentLineBlame", "DraculaComment")

--dashboard
fg("DashBoardHeader", palette.cyan)

-- galaxyline
local mode_to_colour = {
	Normal = palette.purple,
	Insert = palette.green,
	Command = palette.cyan,
	Visual = palette.orange,
	VisualLine = palette.orange,
	VisualBlock = palette.orange,
	Replace = palette.red,
}
for mode, colour in pairs(mode_to_colour) do
	highlight_group("Galaxyline" .. mode .. "Mode", { guifg = palette.bg, guibg = colour })
	highlight_group("Galaxyline" .. mode .. "ModeSeparator", { guifg = colour, guibg = palette.bg })
end

-- statusline
bg("StatusLine", palette.bg)

-- cursorline
bg("ModesInsert", palette.cyan)
bg("ModesCopy", palette.orange)
bg("ModesVisual", palette.orange)

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
fg("FidgetTitle", palette.purple)
