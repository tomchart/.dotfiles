local M = {}

M.init = function(theme)
  if not theme then
    theme = "dracula"
  end

  require("colours.theme").setup()

end

return M
