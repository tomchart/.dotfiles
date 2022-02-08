local M = {}

local cmd = vim.cmd
local api = vim.api

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

-- Define the colour palette
M.palette = {
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
  light = extract_highlight_colours('DraculaBgLight').guibg,
  lighter = extract_highlight_colours('DraculaBgLighter').guibg
}


-- Highlights functions

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

---@class HighlightArgs
---@field guifg string|nil
---@field guibg string|nil
---@field gui string[]|nil

--- Creates a highlight group.
---@param group string
---@param args HighlightArgs
M.highlight_group = function(group, args)
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

return M
