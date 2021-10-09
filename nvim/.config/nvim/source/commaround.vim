" Comment Map
vmap <leader>c <Plug>ToggleCommaround

" Add lang
lua require('nvim-commaround.config').config["dart"] = {single = "//", block = nil}
lua require('nvim-commaround.config').config["php"] = {single = "//", block = nil}
