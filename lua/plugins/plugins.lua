return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
    use 'marko-cerovac/material.nvim'

	use 'ms-jpq/chadtree'

	use 'ryanoasis/vim-devicons'
	use 'nvim-tree/nvim-web-devicons'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'

	use 'akinsho/bufferline.nvim'

	use 'nvim-lualine/lualine.nvim'

	use 'AlexvZyl/nordic.nvim'
    use 'morhetz/gruvbox'

	use 'iamcco/markdown-preview.nvim'

	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'

	use 'brenoprata10/nvim-highlight-colors'

	use 'windwp/nvim-autopairs'

    use 'stevearc/conform.nvim'

    use 'mfussenegger/nvim-lint'

    use 'smjonas/inc-rename.nvim'
end)
