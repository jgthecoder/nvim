-- LAZY_PLUGIN_SPEC = {}
--
-- local function spec(item)
--   table.insert(LAZY_PLUGIN_SPEC, { import = item })
-- end
--
-- spec("custom.plugins.lualine")

require "josh.core.options"
require "josh.core.keymaps"
require "josh.core.lsp"
require "josh.core.autocmds"
require "josh.lazy"

vim.cmd [[ colorscheme monolith ]]
-- vim.cmd [[
--   set termguicolors
--   set bg=dark
--   colorscheme quiet
--   highlight Keyword gui=bold
--   highlight Comment gui=italic
--   highlight Constant guifg=#999999
--   highlight NormalFloat guibg=#333333
-- ]]
--
