local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local spec = {
  { "nvim-treesitter/nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "nvim-treesitter/playground" },
  { "chrisbra/Colorizer" },
  { "nvim-lua/plenary.nvim" },
  { "lewis6991/impatient.nvim" },
  { "hctomhart/gruvbox.nvim" },
  { "AlexvZyl/nordic.nvim" },
  { "glepnir/dashboard-nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim" },
  { "ggandor/leap.nvim" },
  { "tpope/vim-repeat" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "kylechui/nvim-surround" },
  { "tpope/vim-fugitive" },
  { "ray-x/lsp_signature.nvim" },
  { "rafamadriz/friendly-snippets" },
  { "windwp/nvim-autopairs" },
  { "famiu/bufdelete.nvim" },
  { "numToStr/Comment.nvim" },
  { "jdhao/better-escape.vim" },
  { "dstein64/vim-startuptime" },
  { "tpope/vim-vinegar" },
  { "j-hui/fidget.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "jay-babu/mason-null-ls.nvim" },
  { "rcarriga/nvim-notify" },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
    }
  },
}

require("lazy").setup(spec, {})
