return {
  {
    "barrettruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = function()
      vim.g.live_server = {
        port = 8080,
      }
    end
  }
}
