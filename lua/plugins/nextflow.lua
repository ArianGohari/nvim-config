vim.lsp.enable("nextflow")

vim.lsp.config["nextflow"] = {
  cmd = { "java", "-jar", "/Users/arian/nextflow/language-server-all.jar" },
  filetypes = { "nextflow", "nf", "config" },
  root_markers = { "nextflow.config", ".git" },
  settings = {
    nextflow = {
      files = {
        exclude = { ".git", ".nf-test", "work" },
      },
    },
  },
}

return {
  {
    "nextflow-io/vim-language-nextflow",
    ft = { "nextflow", "nf" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        extension = {
          nf = "nextflow",
          ["nextflow.config"] = "nextflow",
          ["nf.test"] = "nextflow",
        },
      })

      -- Modern way to add custom parsers
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.nf", "*.nextflow", "nextflow.config", "*.nf.test" },
        callback = function()
          vim.bo.filetype = "nextflow"
        end,
      })

      -- Add nextflow to ensure_installed if it's available
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "nextflow") then
        table.insert(opts.ensure_installed, "nextflow")
      end
    end,
  },
}
