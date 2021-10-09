lua << EOF
require("vimway-lsp-diag").init({
    debounce_ms = 50,
    buf_clients_only = false,
})
EOF
nmap <space>dw <cmd>lua require('vimway-lsp-diag').open_all_diagnostics()<cr>
nmap <space>db <cmd>lua require('vimway-lsp-diag').open_buffer_diagnostics()<cr>
