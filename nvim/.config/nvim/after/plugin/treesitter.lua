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
		"c_sharp",
		"dart",
		"dockerfile",
		"go",
    "html",
    "javascript",
    "json",
		"lua",
    "make",
    "php",
    "rust",
 		"solidity",
		"svelte",
    "toml",
    "typescript",
		"tsx",
    "yaml",
  },
}

-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- ufo folds
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.wo.foldcolumn = '1'
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = {} -- like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities,
    })
end
require"ufo".setup()
