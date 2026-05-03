return {
	{
		"nvim-neo-tree/neo-tree.nvim",
    enabled = false,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		lazy = false, -- neo-tree will lazily load itself
		---@module "neo-tree"
		---@diagnostic disable-next-line: undefined-doc-name
		---@type neotree.Config?
		opts = {
			window = {
				width = 40,
			},
		},
		config = function()
			vim.keymap.set("n", "<Leader>e", ":Neotree toggle float<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "<Leader><tab>", ":Neotree toggle left<CR>", { silent = true, noremap = true })
		end,
	},
}
