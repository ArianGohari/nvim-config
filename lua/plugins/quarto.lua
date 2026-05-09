-- plugins/quarto.lua
return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "lua" },
        chunks = "all",
        diagnostics = {
          enabled = false, -- Disable diagnostics to avoid otter file errors
        },
      },
    },
  },
}
