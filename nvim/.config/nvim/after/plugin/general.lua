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

vim.g.gitblame_disabled = 0

require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        -- 'lsp',
        -- 'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 0,
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {},
    under_cursor = true,
})

require'bufferline'.setup()
