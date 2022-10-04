local present, surround_conf = pcall(require, "nvim-surround")

if not present then
	return
end

local M = {}

M.setup = function()
  surround_conf.setup()
end

return M
