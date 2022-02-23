local M = {}

M.init = function(theme)
    if not theme then
        theme = "dracula"
    end

    vim.cmd("colorscheme " .. theme)
    require "colours.highlights"
end

return M
