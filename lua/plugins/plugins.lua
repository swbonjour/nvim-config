return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	use 'ms-jpq/chadtree'

	use 'ryanoasis/vim-devicons'
	use 'nvim-tree/nvim-web-devicons'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'

	use 'akinsho/bufferline.nvim'

	use 'nvim-lualine/lualine.nvim'

	use 'AlexvZyl/nordic.nvim'
end)
