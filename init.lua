require('bootstrap')

require('plugins/plugins')

require('plugins/mason')
require('plugins/cmp')
require('plugins/lspconfig')
require('plugins/tree')

require('nvim-highlight-colors').setup({
})

require('nvim-autopairs').setup({
})

require('conform').setup({
    formatters_by_ft = {
        typescript = { "prettier" }
    }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

require('lint').linters_by_ft = {
	typescript = {'eslint'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require('inc_rename').setup({
})

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

opt.swapfile = false

opt.tabstop = 4

opt.shiftwidth = 4

opt.expandtab = true

local keymap = vim.api.nvim_set_keymap;

keymap('i', 'jk', '<Esc>', {})

keymap('n', 'gb', ':BufferLinePick<CR>', {})

keymap('n', 'gD', ':BufferLinePickClose<CR>', {})

keymap('n', '<C-p>', ':Telescope find_files<CR>', {})

keymap('n', '<C-f>', ':Telescope live_grep<CR>', {})

keymap('n', '<F11>', ':Telescope lsp_references<CR>', {})

vim.cmd('language en_US')

vim.cmd.colorscheme('nordic')
