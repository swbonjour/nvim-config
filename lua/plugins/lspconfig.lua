local lspconfig = require('lspconfig')

local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['lua_ls'].setup({
	capabilities = capabilities,
	on_init = function(client)
    		local path = client.workspace_folders[1].name
		print(path)
    	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.stdpath("config") .. "/lua",
					"C:/Users/koprovKR/AppData/Local/nvim-data/site/pack/packer/start",
				},
			}
		}
	}
})

lspconfig['ts_ls'].setup({
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig['html'].setup({
	capabilities = capabilities,
})

lspconfig['cssls'].setup({
	capabilities = capabilities,
})

lspconfig['jsonls'].setup({
})
