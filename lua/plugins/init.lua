local present, packer = pcall(require, "plugins.packerInit")

if not present then
	return false
end

local plugins = {
	{ "chrisbra/Colorizer" },
	{ "nvim-lua/plenary.nvim" },
	{ "lewis6991/impatient.nvim" },
	-- {
 --    "nathom/filetype.nvim",
 --    config = function()
 --      require("plugins.configs.filetype")
 --    end,
 --  },
	{
		"wbthomason/packer.nvim",
		event = "VimEnter",
	},
	{
		"rebelot/kanagawa.nvim",
		as = "kanagawa",
	},
  { 'nyoom-engineering/oxocarbon.nvim' },
  { "folke/tokyonight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
	{
		"glepnir/dashboard-nvim",
		after = "oxocarbon.nvim",
		config = function()
			require("plugins.configs.dashboard-nvim")
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		after = "dashboard-nvim",
	},
  {
    "feline-nvim/feline.nvim",
    after = "dashboard-nvim",
    config = function()
      require("plugins.configs.statusline").setup()
    end,
  },
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
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("plugins.configs.ts_context").setup()
    end,
    after = "nvim-treesitter"
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
  {
    "jpalardy/vim-slime",
    after = "Comment.nvim",
    config = function ()
      require("core.mappings").slime()
    end
  },

	-- file managing, picking, etc
  {
    "ThePrimeagen/harpoon",
    after = "dashboard-nvim",
    before = "telescope.nvim",
    setup = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        }
      })
    end,
    config = function()
      require("core.mappings").harp()
    end,
  },
	{
		"nvim-telescope/telescope.nvim",
		after = "dashboard-nvim",
		setup = function()
			require("core.mappings").tele()
		end,
		config = function()
			require("plugins.configs.telescope").setup()
		end,
	},
  {
    "tpope/vim-vinegar",
    after = "telescope.nvim"
  },
}

return packer.startup(function(use)
	for _, v in pairs(plugins) do
		use(v)
	end
end)
