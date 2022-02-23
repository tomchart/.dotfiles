local hi = vim.highlight

local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local highlight_group = require("core.utils").highlight_group
local palette = require("core.utils").palette

-- git
hi.link("DiffDelete", "DraculaRed", true)

-- gitsigns
hi.link("GitSignsCurrentLineBlame", "DraculaComment")

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
