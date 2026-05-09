-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- -- LSP Server to use for Python.
vim.g.lazyvim_python_lsp = "ruff"

-- Set Python 3 provider to the pyenv virtualenv
vim.g.python3_host_prog = "/Users/arian/.pyenv/versions/nvim-virtualenv/bin/python3"

-- -- conform format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.templ",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.opt.synmaxcol = 0

-- Disable markdown rendering/concealing
vim.opt.conceallevel = 0
