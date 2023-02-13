-- would be good to fork gruvbox
-- so that i can fix the italics
-- and re-enable them
-- bit fucked atm

local function gruv()
  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    italic_operator = false,
    italic_string = false,
    italic_virtual = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  })
  vim.cmd("colorscheme gruvbox")
end

local function nordic()
  -- vim.cmd.colorscheme 'nordic'
  local n = require("nordic")
  n.setup({
    cursorline = {
      bold = false,
      theme = "dark,"
    },
  })
  n.load()
  local c = require("nordic.colors")
  vim.api.nvim_set_hl(0, "MasonNormal", {fg = c.white, bg = c.black})
  vim.api.nvim_set_hl(0, "FloatBorder", {fg = c.black})
  vim.api.nvim_set_hl(0, "Pmenu", {fg = c.white, bg = c.black})
  vim.api.nvim_set_hl(0, "PmenuSel", {fg = c.white, bg = c.gray1})
  vim.api.nvim_set_hl(0, "PmenuSbar", {bg = c.gray1})
  vim.api.nvim_set_hl(0, "NormalFloat", {fg = c.white, bg = c.black})
end

local M = {}

M.setup = function()
  -- vim.o.background = "dark"
  -- gruv()
  nordic()
end

return M
