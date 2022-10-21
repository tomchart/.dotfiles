local present, packer = pcall(require, "plugins.packerInit")

if not present then
	return false
end

local plugins = {
	{ "chrisbra/Colorizer" },
	{ "nvim-lua/plenary.nvim" },
	{ "lewis6991/impatient.nvim" },
	{
    "nathom/filetype.nvim",
    config = function()
      require("plugins.configs.filetype")
    end,
  },
	{
		"wbthomason/packer.nvim",
		event = "VimEnter",
	},
	-- {
	-- 	"dracula/vim",
	-- 	as = "dracula",
	-- },
	-- {
	-- 	"shaunsingh/nord.nvim",
	-- 	as = "nord",
	-- },
	{
		"rebelot/kanagawa.nvim",
		as = "kanagawa",
	},
	{
		"glepnir/dashboard-nvim",
		after = "kanagawa",
		config = function()
			require("plugins.configs.dashboard-nvim")
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		after = "dashboard-nvim",
	},
	{
		"NTBBloodbath/galaxyline.nvim",
		after = "dashboard-nvim",
		config = function()
			require("plugins.configs.galaxyline")
		end,
	},
  -- {
  --   "feline-nvim/feline.nvim",
  --   after = "dashboard-nvim",
  --   setup = function()
  --     require("plugins.configs.statusline").setup()
  --   end,
  -- },
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	after = "galaxyline.nvim",
	-- 	config = function()
	-- 		require("plugins.configs.nvim_bufferline")
	-- 	end,
	-- 	setup = function()
	-- 		require("core.mappings").bufferline()
	-- 	end,
	-- },
  {
		"ggandor/leap.nvim",
        config = function()
            require("plugins.configs.others").leap()
        end,
	},
  {
      "tpope/vim-repeat",
  },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = function()
			require("plugins.configs.others").indent()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter").setup()
		end,
		run = ":TSUpdate",
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("plugins.configs.surround").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	},
	-- git stuff
	{
		"tpope/vim-fugitive",
		after = "nvim-treesitter",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		config = function()
			require("plugins.configs.gitsigns").setup()
		end,
	},

	-- lsp stuff
	{
		"neovim/nvim-lspconfig",
		after = "vim-fugitive",
		setup = function()
			require("core.mappings").lspconf()
		end,
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
		"rafamadriz/friendly-snippets",
		module = "cmp_nvim_lsp",
		event = "InsertEnter",
	},

	-- cmp is mostly working but throwing errors for galaxyline when running some snippets??
	{
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', },
      { "hrsh7th/cmp-path", after = "nvim-cmp", },
      -- { "hrsh7th/cmp-cmdline", after = "nvim-cmp", },
      { "onsails/lspkind-nvim", after = "nvim-cmp", },
      { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip', },
    },
		config = function()
			require("plugins.configs.cmp").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").luasnip()
		end,
	},

	-- misc plugins
	{
		"windwp/nvim-autopairs",
		after = "lspkind-nvim",
		config = function()
			require("plugins.configs.others").autopairs()
		end,
	},
	{
		"famiu/bufdelete.nvim",
		event = "BufReadPost",
	},
	{
		"numToStr/Comment.nvim",
    after = "nvim-autopairs",
		config = function()
			require("plugins.configs.comment").setup()
		end,
	},
	{
		"jdhao/better-escape.vim",
		event = "InsertCharPre",
		config = function()
			require("plugins.configs.others").escape()
		end,
	},
	{
		"dstein64/vim-startuptime",
	},

	-- file managing, picking, etc
	{
		"nvim-telescope/telescope.nvim",
		after = "galaxyline.nvim",
		setup = function()
			require("core.mappings").tele()
		end,
		config = function()
			require("plugins.configs.telescope").setup()
		end,
	},
	-- {
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	after = "telescope.nvim",
	-- 	setup = function()
	-- 		require("core.mappings").nvimtree()
	-- 	end,
	-- 	config = function()
	-- 		require("plugins.configs.nvimtree").setup()
	-- 	end,
	-- },
}

return packer.startup(function(use)
	for _, v in pairs(plugins) do
		use(v)
	end
end)
