-- OPTIONS --

local set = vim.opt

vim.g.goyo_width = 65

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
set.numberwidth = 2
set.signcolumn = "yes"
set.fillchars = { eob = " "}
set.termguicolors = true
set.clipboard = 'unnamedplus'
set.ignorecase = true
set.swapfile = false
set.autoindent = false
set.autoread = true
set.expandtab = true
set.laststatus = 3
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.shiftround = false
set.listchars = "tab: ,multispace:|   "
set.list = true
set.number = true
set.relativenumber = true
set.wrap = false
set.confirm = true
set.cursorline = true
-- set.scrolloff = 8
set.sidescrolloff = 8
set.inccommand = "split"
set.undodir = os.getenv('XDG_CACHE_HOME') .. '/vim/undodir'
set.undofile = true
set.completeopt = { "menuone", "popup", "noinsert", "noselect" }
set.winborder = "rounded"
set.hlsearch = true
set.splitright = true
set.splitbelow = true
-- set.shortmess:append("Ic")
set.showtabline = 1
set.ruler = true

-- vim.filetype.add({
--   extension = {
--     h = "c",
--   },
-- })

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

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.cmd('filetype detect')
