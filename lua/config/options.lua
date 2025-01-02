-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- -- LSP Server to use for Python.
-- vim.g.lazyvim_python_lsp = "basedpyright"

-- -- conform format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.templ",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- enable deno
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

require("lspconfig").denols.setup({})

local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup({
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
})
