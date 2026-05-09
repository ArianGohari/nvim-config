return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            ".gitignore",
            ".github",
            ".hgignore",
            "package-lock.json",
          },
          never_show = { ".git", ".hg" },
        },
      },
    },
  },
}
