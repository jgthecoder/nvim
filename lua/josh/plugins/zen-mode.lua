return {
	{
		"folke/twilight.nvim",
        enabled = false,
		opts = {},
	},
    {
      "folke/zen-mode.nvim",
      enabled = false,
      event = "VeryLazy",
      config = function()
        vim.keymap.set("n", "<leader>z", function()
          require("zen-mode").toggle({
            window = {
              width = 0.8,
              options = {
                relativenumber = false,
                number = false,
              },
            },
            plugins = {
              twilight = { enabled = false },
            },
          })
        end, { desc = "Toggle zen mode", silent = true, noremap = true })
      end,
    },
}
