local hi = vim.highlight

local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local extract_highlight_colours = require("core.utils").extract_highlight_colours
local highlight_group = require("core.utils").highlight_group

local dracula = {
	base00 = "#282936",
	base01 = "#3a3c4e",
	base02 = "#4d4f68",
	base03 = "#626483",
	base04 = "#62d6e8",
	base05 = "#e9e9f4",
	base06 = "#f1f2f8",
	base07 = "#f7f7fb",
	base08 = "#ea51b2",
	base09 = "#b45bcf",
	base0A = "#00f769",
	base0B = "#ebff87",
	base0C = "#a1efe4",
	base0D = "#62d6e8",
	base0E = "#b45bcf",
	base0F = "#00f769",
}

-- Define the colour palette
local palette = {
	cyan = extract_highlight_colours("DraculaCyan").guifg,
	green = extract_highlight_colours("DraculaGreen").guifg,
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
	even_lighter = "#4d4f68",
	lightest = "#626483",
	medium_light = "#e9e9f4",
	dark_light = "#3a3c4e",
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
	Insert = palette.cyan,
	Command = palette.cyan,
	Visual = palette.orange,
	VisualLine = palette.orange,
	VisualBlock = palette.orange,
	Replace = palette.red,
	Snippet = palette.pink,
}
for mode, colour in pairs(mode_to_colour) do
	highlight_group("Galaxyline" .. mode .. "Mode", { guifg = palette.bg, guibg = colour })
	highlight_group("Galaxyline" .. mode .. "ModeText", { guifg = colour, guibg = palette.lightest })
	highlight_group("Galaxyline" .. mode .. "ModeSeparator", { guifg = colour, guibg = palette.lightest })
end
highlight_group("GalaxylineSeparator", { guifg = palette.lighter, guibg = palette.even_lighter })
highlight_group("GalaxylineSeparator2", { guifg = palette.even_lighter, guibg = palette.lightest })
highlight_group("GalaxylineSeparator3", { guifg = palette.dark_light, guibg = palette.bg })
highlight_group("GalaxylineSeparator4", { guifg = palette.even_lighter, guibg = palette.even_lighter })
highlight_group("GalaxylineSeparator5", { guifg = palette.dark_light, guibg = palette.even_lighter })
highlight_group("GalaxylineSeparator6", { guifg = palette.lightest, guibg = palette.lightest })
highlight_group("GalaxylineSeparator7", { guifg = palette.lightest, guibg = palette.even_lighter })
highlight_group("GalaxylineSeparator8", { guifg = palette.even_lighter, guibg = palette.dark_light })
highlight_group("GalaxylineSeparator9", { guifg = palette.dark_light, guibg = palette.bg })

-- left
highlight_group("GalaxylineDir", { guifg = palette.fg, guibg = palette.even_lighter })
highlight_group("GalaxylineIcon", { guifg = palette.lightest, guibg = palette.bg })
highlight_group("GalaxylineBranch", { guifg = palette.lightest, guibg = palette.bg })
highlight_group("GalaxylineDiffAdd", { guifg = palette.lightest, guibg = palette.bg })
highlight_group("GalaxylineDiffModified", { guifg = palette.lightest, guibg = palette.bg })
highlight_group("GalaxylineDiffRemove", { guifg = palette.lightest, guibg = palette.bg })
highlight_group("GalaxylineFilename", { guifg = palette.fg, guibg = palette.dark_light })

-- right
highlight_group("GalaxylineHint", { guifg = palette.cyan, guibg = palette.even_lighter })
highlight_group("GalaxylineWarn", { guifg = palette.orange, guibg = palette.even_lighter })
highlight_group("GalaxylineError", { guifg = palette.red, guibg = palette.even_lighter })
highlight_group("GalaxylineLsp", { guifg = palette.fg, guibg = palette.dark_light })

-- statusline
bg("StatusLine", palette.bg)

-- cursorline
bg("ModesInsert", palette.cyan)
bg("ModesCopy", palette.orange)
bg("ModesVisual", palette.orange)
bg("ModesDelete", palette.red)

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
