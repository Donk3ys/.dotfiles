lua << EOF
require("diaglist").init({
    debounce_ms = 50,
    buf_clients_only = false,
})
EOF

nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>
nmap <space>db <cmd>lua require('diaglist').open_buffer_diagnostics()<cr>

