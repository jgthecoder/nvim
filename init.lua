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

