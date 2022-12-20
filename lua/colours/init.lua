local M = {}

M.init = function(theme)
  if not theme then
    theme = "dracula"
  end

  require("colours.theme").setup()
  -- require "colours.highlights"
end

return M
