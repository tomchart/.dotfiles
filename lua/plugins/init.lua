local plugin_settings = require("core.config").plugins
local present, packer = pcall(require, plugin_settings.options.packer.init_file)

if not present then
	return false
end

local plugins = {
	{ "nvim-lua/plenary.nvim" },
	{ "lewis6991/impatient.nvim" },
	{ "nathom/filetype.nvim" },

	{
		"wbthomason/packer.nvim",
		event = "VimEnter",
	},
	{
		"NTBBloodbath/galaxyline.nvim",
		after = "packer.nvim",
		config = function()
			require("plugins.galaxyline")
		end,
		requires = "kyazdani42/nvim-web-devicons",
	},
	{
		"akinsho/bufferline.nvim",
		after = "packer.nvim",
		config = function()
			require("plugins.nvim_bufferline")
		end,
		requires = "kyazdani42/nvim-web-devicons",
	},
}

return packer.startup(function(use)
	for _, v in pairs(plugins) do
		use(v)
	end
end)
