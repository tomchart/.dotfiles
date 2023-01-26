local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
      vim.cmd.packadd('packer.nvim')
    end
local packer = require('packer')
local util = require('packer.util')

packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    })
    use("nvim-treesitter/nvim-treesitter-context")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/playground")
    use("chrisbra/Colorizer")
    use("nvim-lua/plenary.nvim")
    use("lewis6991/impatient.nvim")
    use("hctomhart/gruvbox.nvim")
    use("glepnir/dashboard-nvim")
    use("kyazdani42/nvim-web-devicons")
    use("feline-nvim/feline.nvim")
    use("ggandor/leap.nvim")
    use("tpope/vim-repeat")
    use("lukas-reineke/indent-blankline.nvim")
    use("kylechui/nvim-surround")
    use("tpope/vim-fugitive")
    use("neovim/nvim-lspconfig")
    use("ray-x/lsp_signature.nvim")
    use("rafamadriz/friendly-snippets")
    use("windwp/nvim-autopairs")
    use("famiu/bufdelete.nvim")
    use("numToStr/Comment.nvim")
    use("jdhao/better-escape.vim")
    use("dstein64/vim-startuptime")
    use("jpalardy/vim-slime")
    use("tpope/vim-vinegar")
    use("j-hui/fidget.nvim")
    use("windwp/nvim-ts-autotag")
    use({
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    })
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    })
    use({
      "ThePrimeagen/harpoon",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    })
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', },
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', },
        { "hrsh7th/cmp-path", after = "nvim-cmp", },
        { "onsails/lspkind-nvim", after = "nvim-cmp", },
        { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip', },
      },
    })
    use({
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
    })
  end,
  config ={
    display = {
      open_fn = util.float
    }
  }
  })
