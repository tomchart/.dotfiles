local present, autopairs = pcall(require, "nvim-autopairs")

if not present then
	return
end

local M = {}

M.setup = function()
	autopairs.setup({})
end

return M
