local present, tree = pcall(require, "nvim-treesitter")

if not present then
	return
end

local ts_configs = require("nvim-treesitter.configs")

default = {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		disable = { "yaml" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "grn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
		disable = { "yaml", "python" },
	},
}

local M = {}

M.setup = function()
	ts_configs.setup(default)
end

return M
