local cmp = require('cmp')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_buffer' },
		{ name = 'nvim_path' },
		{ name = 'nvim_cmdline' },
	}),
	mapping = cmp.mapping.preset.insert({
      		['<C-b>'] = cmp.mapping.scroll_docs(-4),
      		['<C-f>'] = cmp.mapping.scroll_docs(4),
      		['<C-Space>'] = cmp.mapping.complete(),
      		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-j>'] = cmp.mapping(function(fallback)
    	  			if cmp.visible() then
        				if #cmp.get_entries() == 1 then
          					cmp.confirm({ select = true })
       					else
          					cmp.select_next_item()
       					end
				elseif has_words_before() then
					cmp.complete()
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					end
				else
					fallback()
				end
			end, { "i", "s" }),
		['<C-k>'] = cmp.mapping(function(fallback)
    	  			if cmp.visible() then
        				if #cmp.get_entries() == 1 then
          					cmp.confirm({ select = true })
       					else
          					cmp.select_prev_item()
       					end
				elseif has_words_before() then
					cmp.complete()
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					end
				else
					fallback()
				end
			end, { "i", "s" }),
		['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
		end, { "i", "s" }),
	})
})
