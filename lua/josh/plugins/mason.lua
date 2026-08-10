return {
	"mason-org/mason-lspconfig.nvim",
    enabled = false,
	opts = {
		ensure_installed = {
			-- "bashls",
			"clangd",
			-- "lua_ls",
			-- "tailwindcss",
			-- "pyright",
			-- "emmet_language_server",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		-- "neovim/nvim-lspconfig",
	},
}
