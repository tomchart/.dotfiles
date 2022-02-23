local present, fidget = pcall(require, "fidget")
if not present then
	return
end

local M = {}

M.setup = function()
	fidget.setup({})
end

return M
