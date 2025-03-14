local config = function ()
	local mason = require('mason')

	local mason_lspconfig = require('mason-lspconfig')

	mason.setup({
		package_installed = "✓",
            	package_pending = "➜",
            	package_uninstalled = "✗"
	})

	mason_lspconfig.setup({
		ensure_installed = {
			"lua_ls",
			"ts_ls",
		},
		automatic_installation = true,
	})
end

config()
