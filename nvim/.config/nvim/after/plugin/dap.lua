local dap = require('dap')

  dap.adapters.dart = {
    type = "executable",
    command = "node",
    args = {os.getenv('HOME').."/development/Dart-Code/out/dist/debug.js", "flutter"}
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = os.getenv('HOME').."/development/flutter/bin/cache/dart-sdk/",
      flutterSdkPath = os.getenv('HOME').."/development/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    }
  }

require('dap-go').setup()
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
-- let g:dap_virtual_text=v:true

local keymap = vim.keymap.set
local opts = { silent = true }
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", opts)

keymap("n", "<leader>dw", ":lua require'dapui'.toggle()<CR>", opts)
keymap("n", "<leader>dk", ":lua require'dapui'.eval()<CR>", opts)
keymap("n", "<leader>td", ":lua require('dap-go').debug_test()", opts)
