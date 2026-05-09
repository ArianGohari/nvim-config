return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "go", "gomod", "gosum",
          "c", "cpp",
          "zig",
          "python",
          "typescript", "javascript", "tsx", "html", "css", "json", "jsonc",
          "svelte",
          "swift",
          "java",
          "dart",
          "kotlin",
          "r", "markdown", "markdown_inline",
          "yaml", "toml", "bash",
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- Fix: set-lang-from-info-string! crashes when TSNode is invalidated by
      -- buffer changes (e.g. autocomplete). Replicate the original with pcall.
      local aliases = { ex = "elixir", pl = "perl", sh = "bash", uxn = "uxntal", ts = "typescript" }
      local function resolve_lang(alias)
        -- strip quarto-style {r} or {python} braces and options after space
        local cleaned = alias:gsub("^{(.-)%s*[,}].*", "%1"):gsub("^{(.-)}$", "%1"):gsub("%s.*", "")
        return vim.filetype.match({ filename = "a." .. cleaned }) or aliases[cleaned] or cleaned
      end

      vim.treesitter.query.add_directive(
        "set-lang-from-info-string!",
        function(match, _, bufnr, pred, metadata)
          local node = match[pred[2]]
          if not node then return end
          local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
          if not ok or not text then return end
          metadata["injection.language"] = resolve_lang(text:lower())
        end,
        { force = true }
      )
    end,
  },
}
