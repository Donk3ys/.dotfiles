lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
	code_action_icon = ' ',
	code_action_prompt = {
	 enable = false,
	},
}
EOF

" Diagnostics
nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-e> <Cmd>Lspsaga show_line_diagnostics<CR>

" Docs
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> gp <Cmd>Lspsaga preview_definition<CR>

" Code Actions
nnoremap <silent><leader>ac :Lspsaga code_action<CR>
vnoremap <silent><leader>ac :<C-U>Lspsaga range_code_action<CR>


nnoremap <silent> <C-t> :Lspsaga open_floaterm<CR>
tnoremap <silent> <C-t> <C-\><C-n>:Lspsaga close_floaterm<CR>

"nnoremap <leader>rn :Lspsaga rename<CR>
