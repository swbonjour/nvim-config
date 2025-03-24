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

vim.g.material_style = "darker"

local colors = require("material.colors")

local m = colors.main
local e = colors.editor
local s = colors.syntax

local M = {}

M.normal = {
    a = { fg = e.accent, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
    c = { fg = s.comments, bg = e.bg },
}

M.insert = {
    a = { fg = m.green, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
}

M.visual = {
    a = { fg = m.purple, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
}

M.replace = {
    a = { fg = m.red, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
}

M.command = {
    a = { fg = m.yellow, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
}

M.inactive = {
    a = { fg = e.disabled, bg = e.bg },
    b = { fg = e.disabled, bg = e.bg },
    c = { fg = e.disabled, bg = e.bg }
}

require('lualine').setup({
    options = {
        theme = M,
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

vim.g.gruvbox_contrast_dark = 'medium'

vim.cmd.colorscheme('material-darker')

vim.diagnostic.config({
    virtual_text = false,
    underline = true,
})

vim.o.updatetime = 250

_G.LspDiagnosticsPopupHandler = function()
  local current_cursor = vim.api.nvim_win_get_cursor(0)
  local last_popup_cursor = vim.w.lsp_diagnostics_last_cursor or {nil, nil}

  if not (current_cursor[1] == last_popup_cursor[1] and current_cursor[2] == last_popup_cursor[2]) then
    vim.w.lsp_diagnostics_last_cursor = current_cursor
    vim.diagnostic.open_float(nil, {focur=false})
  end
end

vim.cmd [[
augroup LSPDiagnosticsOnHover
  autocmd!
  autocmd CursorHold *   lua _G.LspDiagnosticsPopupHandler()
augroup END
]]
