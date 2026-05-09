-- Mason is used here only for DAP adapters (codelldb, java-debug-adapter).
-- Run :MasonInstall codelldb java-debug-adapter after first launch.
return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
      "williamboman/mason.nvim",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "DAP continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "DAP step over" },
      { "<F11>", function() require("dap").step_into() end, desc = "DAP step into" },
      { "<F12>", function() require("dap").step_out() end, desc = "DAP step out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "DAP UI" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup()
      require("dap-go").setup()

      -- codelldb for C, Zig, Swift (install via :MasonInstall codelldb)
      local mason_data = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = mason_data .. "/adapter/codelldb",
          args = { "--port", "${port}" },
        },
      }

      for _, lang in ipairs({ "c", "cpp", "zig", "swift" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch",
            program = function()
              return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
          },
        }
      end

      -- Auto open/close dapui
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
}
