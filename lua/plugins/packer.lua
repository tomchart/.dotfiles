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

        -- UI
        use {'dracula/vim', as = 'dracula'}
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
                'airblade/vim-gitgutter',
                config = [[ require 'plugins.vim_gitgutter' ]],
        }
        use {
                'luukvbaal/stabilize.nvim',
                config = [[ require 'plugins.stabilize']]
        }
        use {
                'karb94/neoscroll.nvim',
                config = [[ require 'plugins.neoscroll']]
        }
        use 'chrisbra/Colorizer'

        -- Command
        use 'justinmk/vim-sneak'
        use 'tpope/vim-eunuch'
        use 'tpope/vim-commentary'
        use 'tpope/vim-surround'
        use 'tpope/vim-fugitive'
        use 'junegunn/vim-peekaboo'
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
        
        

        -- Text objects
       use {
                'windwp/nvim-autopairs',
                config = [[ require 'plugins.nvim_autopairs' ]],
        }

end)


