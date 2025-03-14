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
end)
