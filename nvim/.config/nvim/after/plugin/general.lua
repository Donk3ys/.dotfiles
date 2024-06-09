-- Plugin Setup
-- require"mason".setup()
-- require"mason-lspconfig".setup()

require"todo-comments".setup {}

require"toggleterm".setup{
	open_mapping = [[<c-\>]],
	size = 30,
}

local highlight = {
    "LightGray",
}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "LightGray", { fg = "#7A7A7A" })
end)
vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { 
	exclude = {
   filetypes = {"log"}
  },
  scope = { highlight = highlight },
}
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

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
    progress = {
        display = {
          progress_icon = { pattern = "dots_snake", period = 1 },
        },
    },
}
require"gitsigns".setup() 
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

require'illuminate'.configure{
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
}

require"oil".setup()
vim.keymap.set("n", "<leader>fe", ":Oil --float <CR>", { desc = "Open parent directory" })

require'log-highlight'.setup {}

require'nvim-highlight-colors'.setup({
  render = 'virtual',
  virtual_symbol = '■',
})
