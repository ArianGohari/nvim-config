return {
  {
    "quarto-dev/quarto-nvim",
    lazy = true,
    ft = { "quarto" },
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "lua" },
        chunks = "all",
        diagnostics = { enabled = false },
      },
    },
  },
}
