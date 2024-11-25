-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "<S-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gds', ':vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>h', 'function() vim.lsp.inlay_hint(0, nil)end', opts)

  -- formatting on save
  -- if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  -- end

  navic.attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

require'lspconfig'.bashls.setup{
  on_attach = on_attach,
}

require'lspconfig'.csharp_ls.setup{
	on_attach = on_attach,
}

require'flutter-tools'.setup {
	lsp = {
		on_attach = on_attach,
  }
	-- 	    color = { -- show the derived colours for dart variables
	--      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
	--      virtual_text = true, -- show the highlight using virtual text
	--      virtual_text_str = "■", -- the virtual text character to highlight
	--    },
	-- },
	--  debugger = {
	--    enabled = false,
	--  },
	--  dev_log = {
	--    enabled = true,
	--  },
	-- -- widget_guides = {
	-- -- 	enabled = true,
	-- -- },
}

require'lspconfig'.gleam.setup{
	on_attach = on_attach,
}

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
  hint = {enabled = true},
}

require'rust-tools'.setup{
  server = {
    on_attach = on_attach,
  },
}

require'lspconfig'.solidity_ls.setup{
  on_attach = on_attach,
  -- cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
 --  -- cmd = { "solidity-language-server", "--stdio" },
	-- filetypes = { 'solidity' },
	-- root_dir = require("lspconfig.util").find_git_ancestor,
	-- single_file_support = true,
}

require'lspconfig'.svelte.setup{
	on_attach = on_attach,
}

require'lspconfig'.ts_ls.setup{
	on_attach = on_attach,
}


require'rust-tools'.setup{
  server = {
    on_attach = on_attach,
  },
}
require'lspconfig'.yamlls.setup {
	on_attach = on_attach,
  capabilities = capabilities,
}

-- nvim_lsp.diagnosticls.setup {
--   on_attach = on_attach,
-- }

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    -- virtual_text = {
    --   spacing = 4,
    --   prefix = ''
    -- }

  	virtual_text = false,
  }
)

-- local null_ls = require'null-ls'
-- null_ls.setup({
--     sources = {
--         -- null_ls.builtins.formatting.prettier,
-- 				-- null_ls.builtins.code_actions.eslint_d,
--         -- null_ls.builtins.formatting.yamllint,
--     },
-- })
