local autocmd = vim.api.nvim_create_autocmd

-- Wrap settings for prose filetypes
autocmd("FileType", {
  pattern = { "markdown", "text", "typst" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.breakindent = true
    vim.opt_local.linebreak = true
    vim.keymap.set("n", "j", "gj", { buffer = true })
    vim.keymap.set("n", "k", "gk", { buffer = true })
    vim.opt_local.spell = false
  end,
})

-- Format templ files on save
autocmd("BufWritePre", {
  pattern = "*.templ",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Fix R/markdown code block transparency in Quarto files
local function clear_r_backgrounds()
  vim.cmd("hi! RCodeBlock guibg=NONE ctermbg=NONE")
  vim.cmd("hi! RQuartoNamespace guibg=NONE ctermbg=NONE")
  vim.cmd("hi! RCodeComment guibg=NONE ctermbg=NONE")
  vim.cmd("hi! RCodeIgnore guibg=NONE ctermbg=NONE")
  vim.cmd("hi! @markup.raw guibg=NONE ctermbg=NONE")
  vim.cmd("hi! @markup.raw.block.markdown guibg=NONE ctermbg=NONE")
end

autocmd("ColorScheme", { callback = clear_r_backgrounds })
autocmd("FileType", { pattern = { "quarto", "markdown" }, callback = clear_r_backgrounds })
autocmd("BufEnter", { pattern = { "*.qmd", "*.md" }, callback = clear_r_backgrounds })

-- Override markdown-oxide decorator highlights after LSP attaches
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "markdown_oxide" then
      vim.schedule(function()
        vim.api.nvim_set_hl(0, "@lsp.type.decorator",          { bg = "NONE", fg = "#ff79c6" })
        vim.api.nvim_set_hl(0, "@lsp.type.decorator.markdown", { bg = "NONE", fg = "#ff79c6" })
      end)
    end
  end,
})

-- dot/graphviz LSP
autocmd("BufEnter", {
  pattern = { "*.dot" },
  callback = function()
    vim.lsp.start({ name = "dot", cmd = { "dot-language-server", "--stdio" } })
  end,
})
