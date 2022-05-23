" Find files using Telescope command-line sugar.
"nnoremap <S-a> <cmd>Telescope lsp_code_actions<cr>
nnoremap <S-a> <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <S-d> <cmd>Telescope diagnostics<cr>
nnoremap <S-e> <cmd>Telescope file_browser<cr>
nnoremap <S-h> <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>
nnoremap <S-l> <cmd>Telescope live_grep<cr>
nnoremap <S-p> <cmd>Telescope find_files<cr>
nnoremap <S-r> <cmd>Telescope lsp_references<cr>
nnoremap <S-t> <cmd>TodoTelescope<cr>

nnoremap <leader>fl <cmd>Telescope flutter commands<cr>

lua << EOF
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

EOF
