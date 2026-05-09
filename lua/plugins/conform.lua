local function find_config(bufnr, config_files)
  return vim.fs.find(config_files, {
    upward = true,
    stop = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
  })[1]
end

local function biome_or_prettier(bufnr)
  if find_config(bufnr, { "biome.json", "biome.jsonc" }) then
    return { "biome", stop_after_first = true }
  end
  if find_config(bufnr, {
    ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.yaml",
    ".prettierrc.json5", ".prettierrc.js", ".prettierrc.cjs", ".prettierrc.toml",
    "prettier.config.js", "prettier.config.cjs",
  }) then
    return { "prettier", stop_after_first = true }
  end
  return { "prettier", stop_after_first = true }
end

local web_filetypes = {
  "javascript", "javascriptreact", "typescript", "typescriptreact",
  "vue", "svelte", "css", "scss", "less", "html",
  "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars",
}

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = (function()
        local result = { go = { "gofumpt", "goimports" } }
        for _, ft in ipairs(web_filetypes) do
          result[ft] = biome_or_prettier
        end
        return result
      end)(),
    },
  },
}
