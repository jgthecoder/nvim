-- KEYMAPS --
-- See `:h vim.keymap.set`

local opts = { silent = true, remap = false }
local map = vim.keymap.set

vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = "\\"

map("n", "<space>", "<NOP>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Window navigation
-- map("n", "<C-l>", ":wincmd l<cr>", opts)
-- map("n", "<C-h>", ":wincmd h<cr>", opts)
-- map("n", "<C-k>", ":wincmd k<cr>", opts)
-- map("n", "<C-j>", ":wincmd j<cr>", opts)

map("n", "<leader>o", ":update<cr> :source<cr>")
map("n", "<leader>w", ":write<cr>")
map("n", "<leader>q", ":quit<cr>")

map({ "n", "v", "x" }, "<leader>y", '"+y<cr>')
map({ "n", "v", "x" }, "<leader>d", '"d<cr>')

map("n", "<leader>lf", vim.lsp.buf.format)

map("n", "<leader>r", ":Run ")

map("n", "<tab>", ":tabnext<cr>", opts)
map("n", "<s-tab>", ":tabprev<cr>", opts)
map("n", "<leader>tn", ":tabnew<cr>", opts)
map("n", "<leader>td", ":tabclose<cr>", opts)

-- Make life easier
map("i", "jk", "<esc>")

-- better indenting
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Centering
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("x", "p", '"_dp')
map("x", "P", '"_dP')

---@diagnostic disable-next-line: unused-local
local job_id = 0
map("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)

  ---@diagnostic disable-next-line: unused-local
  job_id = vim.bo.channel
end, { desc = "Small terminal" })

-- Enter normal mode in terminal
map("t", "<esc><esc>", "<C-\\><C-n>", opts)

map("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

-- Keymap to run make
map("n", "<leader>m", ":make<CR>", { desc = "Compile and run current file", silent = true})

map("n", "<leader>lc", function()
  local file = vim.fn.expand("%")
  local pdf = vim.fn.expand("%:r") .. ".pdf"

  vim.fn.jobstart({ "pdflatex", "-interaction=nonstopmode", file }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.fn.jobstart({ "zathura", pdf })
      else
        vim.notify("pdflatex compilation failed", vim.log.levels.ERROR)
      end
    end,
  })
end, { desc = "Compile LaTeX and open PDF" })

map("n", "<leader>g", ":Goyo<cr>", { silent = true, noremap = true})

-- Git
map("n", "<leader>G", ":Git<cr>", { silent = true, noremap = true})

map("i", "<c-u>", "<esc>bviwUea")
