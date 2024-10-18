return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup {
      -- flutter_path = nil,
      -- flutter_lookup_cmd = "asdf where flutter",
      fvm = false,
      widget_guides = { enabled = true },
      lsp = {
        settings = {
          showtodos = true,
          completefunctioncalls = true,
          analysisexcludedfolders = {
            vim.fn.expand "$Home/.pub-cache",
          },
          renamefileswithclasses = "prompt",
          updateimportsonrename = true,
          enablesnippets = false,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(_)
          require("dap").adapters.dart = {
            type = "executable",
            command = vim.fn.stdpath "data" .. "/mason/bin/dart-debug-adapter",
            args = { "flutter" },
          }
          require("dap").configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch flutter",
              dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
              flutterSdkPath = "home/flutter",
              program = "${workspaceFolder}/lib/main.dart",
              cwd = "${workspaceFolder}",
            },
          }
          -- uncomment below line if you've launch.json file already in your vscode setup
          -- require("dap.ext.vscode").load_launchjs()
        end,
      },
    }
  end,
}
