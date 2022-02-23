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
        after = "packer.nvim"
    },
    {
        "kyazdani42/nvim-web-devicons",
        after = "dracula"
    },
    {
        "NTBBloodbath/galaxyline.nvim",
        after = "packer.nvim",
        config = function()
            require("plugins.configs.galaxyline")
        end,
    },
    {
        "SmiteshP/nvim-gps",
        after = "galaxyline.nvim",
        config = function()
            require("plugins.configs.nvim-gps")
        end,
    },
	{
		"akinsho/bufferline.nvim",
		after = "nvim-gps",
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
        config = function()
            require("plugins.configs.cmp")
        end,
    },
    {
        "hrsh7th/vim-vsnip",
        after = "cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-vsnip",
        after = "cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        after = "cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-nvim-lua",
        after = "cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-buffer",
        after = "cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-path",
        after = "cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-cmdline",
        after = "cmp-nvim-lua"
    },
    {
        "onsails/lspkind-nvim",
        after = "cmp-nvim-lua"
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
