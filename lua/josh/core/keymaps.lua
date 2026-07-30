local opts = { silent = true, noremap = true }
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = "\\"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Window navigation
-- vim.keymap.set("n", "<C-l>", ":wincmd l<cr>", opts)
-- vim.keymap.set("n", "<C-h>", ":wincmd h<cr>", opts)
-- vim.keymap.set("n", "<C-k>", ":wincmd k<cr>", opts)
-- vim.keymap.set("n", "<C-j>", ":wincmd j<cr>", opts)

vim.keymap.set("n", "<leader>o", ":update<cr> :source<cr>")
vim.keymap.set("n", "<leader>w", ":write<cr>")
vim.keymap.set("n", "<leader>q", ":quit<cr>")

-- Insert mode
vim.keymap.set('i', '<C-a>', '<Home>', opts)
vim.keymap.set('i', '<C-e>', '<End>', opts)

-- Normal mode (note: overrides built-in C-a increment)
vim.keymap.set('n', '<C-a>', '^')
vim.keymap.set('n', '<C-e>', '$')

-- Command-line mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<cr>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"d<cr>')

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>r", ":Run ")
-- vim.keymap.set("n", "<leader>f", ":Pick files<cr>", opts)
-- vim.keymap.set("n", "<leader>h", ":Pick help<cr>", opts)

-- vim.keymap.set("n", "<leader>e", ":Lex<cr>")

vim.keymap.set("n", "<tab>", ":tabnext<cr>", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<cr>", opts)
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", opts)
vim.keymap.set("n", "<leader>td", ":tabclose<cr>", opts)

-- vim.keymap.set("n", "<S-h>", ":tabpre<cr>", opts)
-- vim.keymap.set("n", "<S-l>", ":tabnext<cr>", opts)

-- Make life easier
-- vim.keymap.set("n", ";", ":")
vim.keymap.set("i", "jk", "<esc>")

-- Quick source
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- better indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Centering
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("x", "p", '"_dp')
vim.keymap.set("x", "P", '"_dP')

vim.keymap.set("n", "<leader>cr", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  local file_type = vim.bo.filetype

  if file_type == "lua" then
    -- Run the LUA file in the terminal
    vim.cmd("terminal lua " .. vim.fn.fnameescape(file_name))
  elseif file_type == "c" then
    local bin_dir = "bin"
    local output = bin_dir .. "/main"

    if vim.fn.isdirectory(bin_dir) == 0 then
      vim.fn.mkdir(bin_dir, "p")
    end

    -- Compile and run the C file in the terminal
    vim.cmd(
    "terminal gcc "
      .. vim.fn.fnameescape(file_name)
      .. " -o "
      .. vim.fn.fnameescape(output)
      .. " && "
      .. vim.fn.fnameescape(output)
  )
  elseif file_type == "cpp" then
    -- Compile and run the CPP file in the terminal
    vim.cmd("terminal g++ " .. vim.fn.fnameescape(file_name) .. " -o result; ./result")
  elseif file_type == "python" then
    -- Compile and run the PYHTON file in the terminal
    vim.cmd("terminal python3 " .. file_name)
  elseif file_type == "go" then
    -- Compile and run the PYHTON file in the terminal
    vim.cmd("terminal go run " .. file_name)
  elseif file_type == "rust" then
    -- vim.cmd("rustc " .. file_name .. ";./" .. vim.fn.expand("%:t"))
    vim.cmd("terminal cargo run")
  end -- Compile Rust file
end, { desc = "Run Code" })

---@diagnostic disable-next-line: unused-local
local job_id = 0
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)

  ---@diagnostic disable-next-line: unused-local
  job_id = vim.bo.channel
end, { desc = "Small terminal" })

-- Enter normal mode in terminal
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", opts)

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

-- -- Example function using vim.ui.input
-- local function create_route()
--   vim.ui.input({ prompt = "Route: " }, function(path)
--     os.execute("mkdir -p example/route/" .. path)
--     vim.cmd("edit example/path/" .. path .. "/+foo.bar")
--   end)
-- end
--
-- vim.keymap.set("n", "<leader>c", create_route)

-- vim.keymap.set("n", "<leader><leader>o", "<cmd>source %<cr>")
vim.keymap.set("n", "<leader>o", ":.lua<cr>")
vim.keymap.set("v", "<leader>o", ":lua<cr>")

-- Keymap to run make
vim.keymap.set("n", "<leader>m", ":make<CR>", { desc = "Compile and run current file", silent = true})

vim.keymap.set("n", "<leader>lc", function()
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
