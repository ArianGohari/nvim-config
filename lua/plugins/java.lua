-- jdtls is complex to set up manually; nvim-java handles workspace config,
-- java version management, and the java-debug-adapter DAP integration.
-- Mason installs jdtls + java-debug-adapter automatically.
return {
  {
    "nvim-java/nvim-java",
    lazy = true,
    ft = "java",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("java").setup()
      vim.lsp.enable("jdtls")
    end,
  },
}
