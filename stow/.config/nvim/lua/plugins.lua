local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd.packadd("packer.nvim")
end
local packer = require("packer")

packer.startup({
    function(use)
      use("wbthomason/packer.nvim")
      use({
          "nvim-treesitter/nvim-treesitter",
          run = ":TSUpdate",
      })
      use("nvim-treesitter/nvim-treesitter-context")
      use("nvim-treesitter/nvim-treesitter-textobjects")
      use("nvim-treesitter/playground")
      use("chrisbra/Colorizer")
      use("nvim-lua/plenary.nvim")
      use("lewis6991/impatient.nvim")
      use("hctomhart/gruvbox.nvim")
      use("AlexvZyl/nordic.nvim")
      use("glepnir/dashboard-nvim")
      use("kyazdani42/nvim-web-devicons")
      use("nvim-lualine/lualine.nvim")
      use("ggandor/leap.nvim")
      use("tpope/vim-repeat")
      use("lukas-reineke/indent-blankline.nvim")
      use("kylechui/nvim-surround")
      use("tpope/vim-fugitive")
      use("ray-x/lsp_signature.nvim")
      use("rafamadriz/friendly-snippets")
      use("windwp/nvim-autopairs")
      use("famiu/bufdelete.nvim")
      use("numToStr/Comment.nvim")
      use("jdhao/better-escape.vim")
      use("dstein64/vim-startuptime")
      use("tpope/vim-vinegar")
      use("j-hui/fidget.nvim")
      use("windwp/nvim-ts-autotag")
      use("williamboman/mason.nvim")
      use("williamboman/mason-lspconfig.nvim")
      use("neovim/nvim-lspconfig")
      use("jose-elias-alvarez/null-ls.nvim")
      use("jay-babu/mason-null-ls.nvim")
      use({
          "folke/noice.nvim",
          requires = {
              "MunifTanjim/nui.nvim",
              "rcarriga/nvim-notify",
          },
      })
      use({
          "lewis6991/gitsigns.nvim",
          requires = {
              "nvim-lua/plenary.nvim",
          },
      })
      use({
          "nvim-telescope/telescope.nvim",
          requires = {
              "nvim-lua/plenary.nvim",
          },
      })
      use({
          "ThePrimeagen/harpoon",
          requires = {
              "nvim-lua/plenary.nvim",
          },
      })
      use("hrsh7th/nvim-cmp")
      use("saadparwaiz1/cmp_luasnip")
      use("hrsh7th/cmp-nvim-lsp")
      use("hrsh7th/cmp-nvim-lua")
      use("hrsh7th/cmp-buffer")
      use("hrsh7th/cmp-path")
      use("onsails/lspkind-nvim")
      use("L3MON4D3/LuaSnip")
    end,
    config = {
        display = {
            open_fn = function ()
              return require 'packer.util'.float { border = 'rounded' }
            end
        },
    },
})
