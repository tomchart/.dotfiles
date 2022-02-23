local present, packer = pcall(require, "plugins.packerInit")

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
		"dracula/vim",
		as = "dracula",
		-- after = "packer.nvim"
	},
	{
		"glepnir/dashboard-nvim",
		after = "dracula",
		config = function()
			require("plugins.configs.dashboard-nvim")
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		after = "dashboard-nvim",
	},
	{
		"SmiteshP/nvim-gps",
		after = "nvim-web-devicons",
		config = function()
			require("plugins.configs.nvim-gps").setup()
		end,
	},
	{
		"NTBBloodbath/galaxyline.nvim",
		after = "nvim-gps",
		config = function()
			require("plugins.configs.galaxyline")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		after = "galaxyline.nvim",
		config = function()
			require("plugins.configs.nvim_bufferline")
		end,
		setup = function()
			require("core.mappings").bufferline()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("plugins.configs.nvim_treesitter")
		end,
	},

	-- lsp stuff
	{
		"neovim/nvim-lspconfig",
		after = "bufferline.nvim",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp_signature")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.null-ls")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		after = "null-ls.nvim",
		config = function()
			require("plugins.configs.cmp").setup()
		end,
	},
	{
		"hrsh7th/vim-vsnip",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-vsnip",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-nvim-lua",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
	},
	{
		"onsails/lspkind-nvim",
		after = "nvim-cmp",
	},

	-- misc plugins
	{
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.nvim_autopairs")
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("core.mappings").tele()
		end,
		setup = function()
			require("plugins.configs.telescope")
		end,
	},
}

return packer.startup(function(use)
	for _, v in pairs(plugins) do
		use(v)
	end
end)
