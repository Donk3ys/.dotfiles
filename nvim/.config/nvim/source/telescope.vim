" Find files using Telescope command-line sugar.
nnoremap <S-p> <cmd>Telescope find_files<cr>
"nnoremap <S-e> <cmd>Telescope file_browser<cr>
"nnoremap <S-b> <cmd>Telescope buffers<cr>
nnoremap <S-l> <cmd>Telescope live_grep<cr>
nnoremap <S-h> <cmd>Telescope help_tags<cr>
nnoremap <S-d> <cmd>Telescope lsp_workspace_diagnostics<cr>

nnoremap <leader>fl <cmd>Telescope flutter commands<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
	  decorations = {
			statusline = {
				app_version = false,
				device = true,
			}
  },
    layout_strategy = "vertical",
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("flutter")
EOF
