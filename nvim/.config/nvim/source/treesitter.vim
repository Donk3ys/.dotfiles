lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
		"bash",
    "css",
		"dart",
		"dockerfile",
    "html",
    "javascript",
    "json",
    "php",
    "rust",
    "toml",
    "yaml",
  },
}
EOF

"set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
