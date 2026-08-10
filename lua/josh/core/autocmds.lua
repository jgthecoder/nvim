-- AUTOCOMMANDS --
-- See `:h nvim_create_user_command()` 
--     `:h user-commands`
--     `:h nvim_create_augroup`
--     `:h nvim_create_autocmd`
--     `:h nvim_clear_autocmds`

local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup
local usrcmd = vim.api.nvim_create_user_command

-- Don't auto insert comment leader on new line
autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

local augroup = autogrp("custom-augroup", { clear = true })
autocmd("FileType", {
  pattern = { "fugitive", "oil", "help", "man", "compilation" },
  group = augroup,
  desc = "Use q to close the window",
  command = "nnoremap <buffer> q <cmd>quit<cr>",
})

usrcmd("Run", function(opts)
  vim.cmd("belowright split | terminal " .. opts.args)
end, { nargs = "+" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})


vim.cmd [[
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
  autocmd BufRead,BufNewFile *.tex set filetype=tex
  autocmd BufRead,BufNewFile *.h set filetype=c
]]

-- Start in insert mode in terminal mode
vim.cmd([[autocmd TermOpen term://* startinsert]])

