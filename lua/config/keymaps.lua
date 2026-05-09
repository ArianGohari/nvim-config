local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Buffer navigation
map("n", "<S-h>", ":bprev<CR>", { silent = true })
map("n", "<S-l>", ":bnext<CR>", { silent = true })
map("n", "<leader>bd", function() require("mini.bufremove").delete() end, { desc = "Delete buffer" })

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Keep cursor centered on search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Paste without losing register
map("v", "p", '"_dP')

-- Diagnostics
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
