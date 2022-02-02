local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local execute = vim.api.nvim_command

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

cmd('autocmd BufWritePost packer.lua source <afile> | PackerCompile')

return require('packer').startup(function()
        -- Packer
        use 'wbthomason/packer.nvim'

        -- Syntax
        use {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate',
                config = [[ require 'plugins.nvim_treesitter' ]],
        }

        -- Completion
        use {
            'neovim/nvim-lspconfig',
            config = function()
                require 'plugins.lspconfig'
            end,
        } 
        use {
                'hrsh7th/nvim-cmp',
                config = function()
                    require 'plugins.cmp'
                end,
                requires = {
                    use 'hrsh7th/vim-vsnip',
                    use 'hrsh7th/cmp-vsnip',
                    use 'hrsh7th/cmp-nvim-lsp',
                    use 'hrsh7th/cmp-nvim-lua',
                    use 'onsails/lspkind-nvim'
                },
        }
        use {
                'ray-x/lsp_signature.nvim',
                config = [[ require 'plugins.lsp_signature' ]],
        }

        -- Theme
        use {'dracula/vim', as = 'dracula'}
        use {'marko-cerovac/material.nvim', as = 'material'}
        use 'folke/tokyonight.nvim'
        use 'sainnhe/everforest'

        -- UI
        use {
            'NTBBloodbath/galaxyline.nvim',
            config = function()
                require 'plugins.galaxyline'
            end,
            requires = 'kyazdani42/nvim-web-devicons',
        }
        use {
                'glepnir/dashboard-nvim',
                config = [[ require 'plugins.dashboard-nvim']]
        }
        use 'machakann/vim-highlightedyank'
        use {
                'lukas-reineke/indent-blankline.nvim',
                config = [[ require 'plugins.indent-blankline']]
        }
        use 'famiu/bufdelete.nvim'
        use {
                'akinsho/bufferline.nvim',
                config = [[ require 'plugins.nvim_bufferline' ]],
                requires = 'kyazdani42/nvim-web-devicons'
        }
        use {
          'lewis6991/gitsigns.nvim',
              requires = {
                'nvim-lua/plenary.nvim'
              },
              config = [[ require 'plugins.gitsigns']]
        }
        use {
            'j-hui/fidget.nvim',
            config = [[ require 'plugins.fidget' ]]
        }
        

        -- Command
        use 'ggandor/lightspeed.nvim'
        use 'tpope/vim-repeat'
        use 'tpope/vim-eunuch'
        use 'tpope/vim-commentary'
        use 'tpope/vim-surround'
        use 'tpope/vim-fugitive'
        use 'junegunn/gv.vim'
        use 'chrisbra/Colorizer'
        use {
          "folke/trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons",
          config = [[ require 'plugins.trouble']] 
        }
        use {
                'bkad/CamelCaseMotion',
                config = [[ require 'plugins.camelcasemotion' ]]
        }
        use {
                'kyazdani42/nvim-tree.lua',
                config = [[ require 'plugins.nvim_tree' ]],
                requires = 'kyazdani42/nvim-web-devicons',
        }
        use {
                'nvim-telescope/telescope.nvim',
                config = [[ require 'plugins.telescope' ]],
                requires = 'nvim-lua/plenary.nvim',
        }

        -- Performance
        use 'nathom/filetype.nvim'
        use {
            'luukvbaal/stabilize.nvim',
            config = [[ require 'plugins.stabilize']]
        }
        

        -- Text objects
       use {
                'windwp/nvim-autopairs',
                config = [[ require 'plugins.nvim_autopairs' ]],
        }

end)


