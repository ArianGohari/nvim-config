return {
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require("mini.statusline").setup()
      require("mini.completion").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.comment").setup()
      require("mini.ai").setup()
      require("mini.bufremove").setup()
      require("mini.indentscope").setup()
    end,
  },
}
