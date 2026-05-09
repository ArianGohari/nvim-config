return {
  {
    "wojciech-kulik/xcodebuild.nvim",
    lazy = true,
    ft = { "swift", "objc" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
}
