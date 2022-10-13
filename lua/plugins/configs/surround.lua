local present, nvim_surround = pcall(require, "nvim-surround")

if not present then
	return
end

local M = {}

M.setup = function()
  nvim_surround.setup({})
end

return M
