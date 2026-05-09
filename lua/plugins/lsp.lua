return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Server-specific overrides (must come before vim.lsp.enable)
      vim.lsp.config("panache", {
        cmd = { "panache", "lsp" },
        filetypes = { "markdown", "quarto", "rmd" },
        root_markers = { "panache.toml", ".panache.toml", ".git" },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.enable({
        "gopls",
        "clangd",
        "zls",
        "ts_ls",
        "svelte",
        "cssls",
        "html",
        "pyright",
        "ruff",
        "lua_ls",
        "sourcekit",
        "markdown_oxide",
        "panache",
        "kotlin_language_server",
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, vim.tbl_extend("force", opts, { desc = desc }))
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "References")
          map("K", vim.lsp.buf.hover, "Hover")
          map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        end,
      })
    end,
  },
}
