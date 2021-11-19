local g = vim.g
local cmd = vim.cmd

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

        -- UI
        use {'dracula/vim', as = 'dracula'}
        use 'machakann/vim-highlightedyank'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'glepnir/dashboard-nvim'
        use {
                'akinsho/bufferline.nvim',
                config = [[ require 'plugins.nvim_bufferline' ]],
                requires = 'kyazdani42/nvim-web-devicons'
        }
        use {
                'airblade/vim-gitgutter',
                config = [[ require 'plugins.vim_gitgutter' ]],
        }

        -- Command
        use 'justinmk/vim-sneak'
        use 'tpope/vim-eunuch'
        use 'tpope/vim-commentary'
        use 'tpope/vim-surround'
        use 'tpope/vim-fugitive'
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
                requires = { {'nvim-lua/plenary.nvim'} }
        }

        -- Text objects
        use 'windwp/nvim-autopairs'

end)


