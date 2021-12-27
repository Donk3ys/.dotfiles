lua <<EOF
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

require("dapui").setup()
require("nvim-dap-virtual-text").setup()
EOF

let g:dap_virtual_text=v:true

nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

nnoremap <leader>dw :lua require("dapui").toggle()<CR>
nnoremap <leader>dk :lua require'dap.ui.widgets'.hover()<CR>
