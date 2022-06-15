local present, leap = pcall(require, "leap")
if not present then
	return
end

local M = {}

M.setup = function()
	leap.setup({
        case_insensitive = true,
    })
    leap.set_default_keymaps()
end

return M
