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
  require("nordic").setup({
    bold_keywords = true,
    italic_comments = true,
    reduced_blue = true,
    underline = false,
    telescope = {
      style = "flat",
    },
  })
  vim.cmd("colorscheme nordic")
end

local M = {}

M.setup = function()
  -- vim.o.background = "dark"
  -- gruv()
  nordic()
end

return M
