-- My Settings Setup
require'sets'
require'maps'
require'packer-config'


-- Plugins With File Setup
require'plugins.autopairs'
require'plugins.cmp'
require'plugins.dap'
require'plugins.galaxyline'
require'plugins.lspconfig'
require'plugins.telescope'
require'plugins.treesitter'


-- Plugin Setup
require"todo-comments".setup {}
require"toggleterm".setup{
	open_mapping = [[<c-\>]],
	size = 30,
}
require"Comment".setup()
local ft = require('Comment.ft')
ft.dart = {'//%s', '/*%s*/'}
--Comment context
require"nvim-treesitter.configs".setup {
	context_commentstring = {
		enable = true
	}
}
require"scrollbar".setup()
vim.notify = require("notify")
require"fidget".setup{
	text = {
			spinner = "dots_snake",
		},
}
require"gitsigns".setup {}
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })


-- colorscheme
vim.cmd('colorscheme gruvbox-material')
