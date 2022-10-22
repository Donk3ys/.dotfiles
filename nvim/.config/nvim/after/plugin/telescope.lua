-- Find files using Telescope command-line sugar.
local keymap = vim.keymap.set
local opts = { silent = true }
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", opts)
keymap("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "<leader>fl", "<cmd>Telescope flutter commands<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)

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
 		file_ignore_patterns = { "node_modules" },
		mappings = {
      i = {
        ['<A-d>'] = require('telescope.actions').delete_buffer,
      }
    }
  }
}
require('telescope').load_extension "fzf"
require("telescope").load_extension "flutter"
require("telescope").load_extension "file_browser"
local fb_actions = require "telescope".extensions.file_browser.actions
