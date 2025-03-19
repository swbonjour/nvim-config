require('bootstrap')

require('plugins/plugins')

require('plugins/mason')
require('plugins/cmp')
require('plugins/lspconfig')
require('plugins/tree')

local bufferline = require('bufferline')

bufferline.setup({
	options = {
		mode = 'buffers',
		style_preset = bufferline.style_preset.default,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
				    	end,
		offsets = {
				{
				    filetype = "CHADTree",
				    text = "File Explorer",
				    text_align = "center",
				    separator = true
				}
			    }
		},
})

require('lualine').setup({
	options = {
		theme = 'nordic',
	},
	sections = {
		-- lualine_a = { { 'mode', icons_enabled = true, icon = { ' ', color = { fg = '#c90f02', bg = 'black' } } } },
		lualine_x = { 'lsp_status', 'encoding' }
	}
})

local opt = vim.opt;

opt.number = true

local keymap = vim.api.nvim_set_keymap;

keymap('i', 'jk', '<Esc>', {})

keymap('n', 'gb', ':BufferLinePick<CR>', {})

keymap('n', 'gD', ':BufferLinePickClose<CR>', {})

vim.cmd('language en_US')

vim.cmd.colorscheme('nordic')
