return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function ()
      vim.keymap.set("n", "<Leader>ff",  "<Cmd>FzfLua files<CR>",   { desc = "Find files" })
      vim.keymap.set("n", "<Leader>fc",  "<Cmd>FzfLua files cwd='~/.config/nvim' <CR>", { desc = "Search neovim config" })
      vim.keymap.set("n", "<Leader>fh",  "<Cmd>FzfLua helptags<CR>", { desc = "Search neovim config" })
      vim.keymap.set("n", "<Leader><Leader>", "<Cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
      vim.keymap.set("n", "<Leader>fg",  "<Cmd>FzfLua live_grep<CR>",    { desc = "Search project" })
      vim.keymap.set("n", "<C-g>",  "<Cmd>FzfLua git_files<CR>",    { desc = "Search project" })
    end
  },
}
