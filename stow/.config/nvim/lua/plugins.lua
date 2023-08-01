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
  { "catppuccin/nvim" },
  { "nvim-treesitter/nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "abecodes/tabout.nvim" },
  { "Wansmer/treesj" },
  { "windwp/nvim-ts-autotag" },
  { "nvim-treesitter/playground" },
  { "chrisbra/Colorizer" },
  { "nvim-lua/plenary.nvim" },
  { "lewis6991/impatient.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim" },
  { "ggandor/leap.nvim" },
  { "tpope/vim-repeat" },
  { "kylechui/nvim-surround" },
  { "tpope/vim-fugitive" },
  { "rafamadriz/friendly-snippets" },
  { "windwp/nvim-autopairs" },
  { "famiu/bufdelete.nvim" },
  { "numToStr/Comment.nvim" },
  { "jdhao/better-escape.vim" },
  { "stevearc/oil.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "jay-babu/mason-null-ls.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "smithbm2316/centerpad.nvim" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
    },
  },
  { "nvim-telescope/telescope.nvim" },
  { "ThePrimeagen/harpoon" },
}

require("lazy").setup(spec, {})
