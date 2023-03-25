-- Plugin Setup
require"mason".setup()

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

-- vim.cmd [[highlight IndentBlanklineContextStart guisp=#61AFEF gui=underline]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#1d2021 gui=nocombine]]
require("indent_blankline").setup {
    -- show_current_context_start = true,
    show_current_context = true,
	  indentLine_enabled = 1,
		filetype_exclude = {
			"log",
		},
}

require"scrollbar".setup({
	marks = {
        Search = {
            text = { "s" },
            highlight = "Purple",
        },
        Error = {
            text = { "e" },
            highlight = "Red",
        },
        Warn = {
            text = { "w" },
            highlight = "Yellow",
        },
        Info = {
            text = { "i" },
            highlight = "Blue",
        },
        Hint = {
            text = { "h" },
            highlight = "Green",
        },
    },
	handlers = {
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns.nvim
    },
})

-- vim.notify = require("notify")

require"fidget".setup{
	text = {
			spinner = "dots_snake",
		},
}
require"gitsigns".setup() 
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

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
