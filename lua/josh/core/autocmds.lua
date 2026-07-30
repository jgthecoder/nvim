-- Don't auto insert comment leader on new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

local augroup = vim.api.nvim_create_augroup("custom-augroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "oil", "help", "man", "compilation" },
  group = augroup,
  desc = "Use q to close the window",
  command = "nnoremap <buffer> q <cmd>quit<cr>",
})

vim.api.nvim_create_user_command("Run", function(opts)
  vim.cmd("belowright split | terminal " .. opts.args)
end, { nargs = "+" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Start in insert mode in terminal mode
vim.cmd([[autocmd TermOpen term://* startinsert]])

-- Autocommands to set makeprg
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt.makeprg = "python3 %"
  end,
})

-- Autocommands to set tabstop in .h filesj
vim.api.nvim_create_autocmd("FileType", {
  pattern = "h",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.filetype = "c"
  end,
})


-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "c",
--   callback = function()
--     -- compile to ./file and run
--     vim.opt.makeprg = "gcc % -o result && ./result"
--   end,
-- })

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "*",
  callback = function()
    vim.cmd("botright copen")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt.makeprg = "rustc % -o result && ./result"
  end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })
--
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   pattern = { "*.c", "*.h" },
--   callback = function()
--     -- Check if we are in a directory containing a 'src' folder
--     local root = vim.fn.finddir("src", ".;")
--     if root ~= "" then
--       vim.fn.jobstart("ctags -R src/ include/", {
--         detach = true,
--         on_exit = function(_, code)
--           if code == 0 then
--             print("Ctags updated in background")
--           end
--         end
--       })
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- defaults:
        -- https://neovim.io/doc/user/news-0.11.html#_defaults

        map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("gd", vim.lsp.buf.definition, "Goto Definition")
        map("<leader>la", vim.lsp.buf.code_action, "Code Action")
        map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
        map("<leader>lf", vim.lsp.buf.format, "Format")
        map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

        local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

            -- When cursor stops moving: Highlights all instances of the symbol under the cursor
            -- When cursor moves: Clears the highlighting
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            -- When LSP detaches: Clears the highlighting
            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end,

})

vim.cmd [[
  let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  map <leader>v :VimwikiIndex<CR>
  let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
  autocmd BufRead,BufNewFile *.tex set filetype=tex
]]
