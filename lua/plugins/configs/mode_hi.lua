local present, modes = pcall(require, "modes")

if not present then
	return
end

local M = {}

M.setup = function()
	modes.setup({
		line_opacity = 0.2,
		set_cursor = false,
		focus_only = true,
	})
end

return M
