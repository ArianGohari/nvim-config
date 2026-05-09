vim.g.python3_host_prog = "/Users/arian/.pyenv/versions/nvim-virtualenv/bin/python3"
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
vim.g.netrw_hide = 1
vim.g.netrw_banner = 0
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 0
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
opt.showmode = false -- mini.statusline shows this

opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.timeoutlen = 300

opt.conceallevel = 0
opt.synmaxcol = 0

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.fillchars = { vert = "│", vertleft = "│", vertright = "│", verthoriz = "┼", horiz = "─", eob = " " }

opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

opt.shortmess:append("I")

opt.completeopt = "menuone,noselect"
opt.pumheight = 10
