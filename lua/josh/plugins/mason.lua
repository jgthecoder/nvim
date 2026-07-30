return {
	"mason-org/mason-lspconfig.nvim",
    enabled = false,
	opts = {
		ensure_installed = {
			"bashls",
			"tinymist",
			"clangd",
			"lua_ls",
			-- "rust_analyzer",
			"html",
			"cssls",
			-- "tailwindcss",
			"pyright",
			"ruff",
			"emmet_language_server",
			-- "gopls",
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
