return {
  {
    "stevearc/oil.nvim",
    opts = {},
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {"permissions", "size", "mtime",  "icon"},
        delete_to_trash = true,
        keymaps = {
          ["<C-h>"] = false,
        },
        view_options = {
          show_hidden = true,
          float = {
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {
              winblend = 0,
            },
          },
        }
      })
      vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Browse files from here" })
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end,
  },
}
