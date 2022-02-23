local present, gps = pcall(require, "nvim-gps")
if not present then
    return
end

local M = {}

M.setup = function()
    -- write some config in here, fuck ugly atm
    gps.setup()
end

return M
