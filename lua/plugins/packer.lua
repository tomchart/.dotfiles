local g = vim.g
local cmd = vim.cmd

cmd('autocmd BufWritePost packer.lua source <afile> | PackerCompile')

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- UI
	use 'machakann/vim-highlightedyank'

	-- Command
	use 'justinmk/vim-sneak'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
    use {
        'famiu/feline.nvim',
        config = [[ require 'plugins.statusline' ]]
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
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Theme
	use {'dracula/vim', as = 'dracula'}
end)


