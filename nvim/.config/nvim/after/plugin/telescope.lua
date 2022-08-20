-- Find files using Telescope command-line sugar.
local keymap = vim.keymap.set
local opts = { silent = true }
--keymap("n", "<S-a>", "<cmd>Telescope lsp_code_actions<CR>", opts)
keymap("n", "<S-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<S-d>", "<cmd>Telescope diagnostics<CR>", opts)
keymap("n", "<S-e>", "<cmd>Telescope file_browser<CR>", opts)
keymap("n", "<S-h>", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", opts)
keymap("n", "<S-l>", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<S-f>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<S-r>", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "<S-t>", "<cmd>Telescope TodoTelescope<CR>", opts)
keymap("n", "<leader>fl", "<cmd>Telescope flutter commands<CR>", opts)

-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
	  decorations = {
			statusline = {
				app_version = false,
				device = true,
			}
  	},
    layout_strategy = "vertical",
  }
}
require('telescope').load_extension "fzf"
require("telescope").load_extension "flutter"
require("telescope").load_extension "file_browser"
local fb_actions = require "telescope".extensions.file_browser.actions
