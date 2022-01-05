local highlight = vim.highlight
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd

--- this is all stolen from marcus
--- until i play around with this and figure out how it works

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

local palette = {
  cyan = extract_highlight_colours('DraculaCyan').guifg,
  green = extract_highlight_colours('DraculaCyan').guifg,
  orange = extract_highlight_colours('DraculaOrange').guifg,
  purple = extract_highlight_colours('DraculaPurple').guifg,
  red = extract_highlight_colours('DraculaRed').guifg,
  pink = extract_highlight_colours('DraculaPink').guifg,

  bg = extract_highlight_colours('Normal').guibg,
  fg = extract_highlight_colours('Normal').guifg,
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
