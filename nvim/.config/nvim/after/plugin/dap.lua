local dap = require('dap')

-- C# 
dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg',
  args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
					local filename = ""
					local cwd = vim.fn.getcwd()
					-- Loop through files
					local p = io.popen('find "'..cwd..'" -type f')
					for file in p:lines() do						
						local ext = file:match("^.+(%..+)$") -- ".csproj"
						if ext == ".csproj" then
							
							-- Split string by /
							local paths = {};
							for match in (file.."/"):gmatch("(.-)".."/") do
									table.insert(paths, match);
							end
							
							filename = string.sub(paths[#paths], 1, -8) .. ".dll"
						end
					end

        return vim.fn.input('Path to dll', cwd .. '/bin/Debug/net6.0/' .. filename, 'file')
    end,
  },
}

-- Dart / Flutter
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

-- Go
require('dap-go').setup()

-- TS / JS
require("dap-vscode-js").setup {
	node_path = "node",
	debugger_path = DEBUGGER_PATH,
	-- debugger_cmd = { "js-debug-adapter" },
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

for _, language in ipairs { "typescript", "javascript" } do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "${workspaceFolder}/node_modules/.bin/ts-node",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end


require("dapui").setup({
	icons = { expanded = "", collapsed = "", current_frame = "ﰛ" },
	controls = {
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
})
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
