-- [ OPTIONS ] --

local set = vim.opt

vim.g.loaded_editorconfig = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_spellfile = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_shada_plugin = 1


vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "size"
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'

vim.g.have_nerd_font = true

set.guicursor = "i:block"
-- set.colorcolumn = "80"
set.showcmd = false
set.numberwidth = 4
set.signcolumn = "yes"
set.fillchars = { eob = " "}
set.termguicolors = true
set.ignorecase = true
set.swapfile = false
set.autoindent = true
set.expandtab = false
set.laststatus = 2
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.shiftround = true
-- set.listchars = "tab: ,multispace:|   "
-- set.list = true
set.number = true
set.relativenumber = true
set.wrap = false
set.confirm = true
set.cursorline = true
set.scrolloff = 8
set.inccommand = "split"
set.undodir = os.getenv('HOME') .. '/.vim/undodir'
set.undofile = true
set.completeopt = { "menuone", "popup", "noinsert" }
set.winborder = "rounded"
set.hlsearch = false
set.cmdheight = 0
set.splitright = true
set.splitbelow = true
set.shortmess:append("Ic")
set.ruler = false

vim.filetype.add({
  extension = {
    h = "c",
  },
})

vim.diagnostic.config({
  underline = { severity = vim.diagnostic.severity.ERROR },
  update_in_insert = false,
  severity_sort = true,
  virtual_text = { current_line = true },
  float = {
    border = "rounded",
    source = "if_many",
  },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  } or {},
})
