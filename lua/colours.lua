local highlight = vim.highlight
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd

local fg = require('utils').fg
local bg = require('utils').bg
local fg_bg = require('utils').fg_bg

--- @class HighlightColours
--- @field guifg string|nil
--- @field guibg string|nil

--- Extracts the guifg and guibg colours from a highlight group.
--- @param name string
--- @return HighlightColours
local function extract_highlight_colours(name)
  local highlight_string = api.nvim_exec('highlight ' .. name, true)
  return {
    guifg = highlight_string:match 'guifg=(#[%d%a]+)',
    guibg = highlight_string:match 'guibg=(#[%d%a]+)',
  }
end

---@class HighlightArgs
---@field guifg string|nil
---@field guibg string|nil
---@field gui string[]|nil

--- Creates a highlight group.
---@param group string
---@param args HighlightArgs
local function highlight_group(group, args)
  local highlight_cmd = 'highlight ' .. group
  if args.guifg then
    highlight_cmd = highlight_cmd .. ' guifg=' .. args.guifg
  end
  if args.guibg then
    highlight_cmd = highlight_cmd .. ' guibg=' .. args.guibg
  end
  if args.gui then
    highlight_cmd = highlight_cmd .. ' gui=' .. table.concat(args.gui, ',')
  end
  cmd(highlight_cmd)
end

-- git
highlight.link('DiffDelete', 'DraculaRed', true)

local palette = {
  cyan = extract_highlight_colours('DraculaCyan').guifg,
  green = extract_highlight_colours('DraculaCyan').guifg,
  orange = extract_highlight_colours('DraculaOrange').guifg,
  purple = extract_highlight_colours('DraculaPurple').guifg,
  red = extract_highlight_colours('DraculaRed').guifg,
  pink = extract_highlight_colours('DraculaPink').guifg,

  bg = extract_highlight_colours('Normal').guibg,
  fg = extract_highlight_colours('Normal').guifg,

  black2 = extract_highlight_colours('DraculaBgDark').guibg,
  darker_black = extract_highlight_colours('DraculaBgDarker').guibg,
  light = extract_highlight_colours('DraculaBgLighter').guibg
}

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
  highlight_group('Galaxyline' .. mode .. 'Mode', { guifg = palette.bg, guibg = colour })
  highlight_group('Galaxyline' .. mode .. 'ModeSeparator', { guifg = colour, guibg = palette.bg })
end

-- telescope
fg_bg('TelescopeBorder', palette.black2, palette.black2)
fg_bg('TelescopePromptBorder', palette.light, palette.light)

fg_bg('TelescopePromptNormal', palette.fg, palette.light)
fg_bg('TelescopePromptPrefix', palette.red, palette.light)

bg('TelescopeNormal', palette.black2)

fg_bg('TelescopePreviewTitle', palette.black2, palette.green)
fg_bg('TelescopePromptTitle', palette.black2, palette.red)
fg_bg('TelescopeResultsTitle', palette.black2, palette.black2)

bg('TelescopeSelection', palette.light)

