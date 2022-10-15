local map = vim.api.nvim_set_keymap
local opts = {noremap=true, silent=true}

-- SPACE set to leader
vim.g.mapleader=' '

-- Buffers
map('n', '<C-p>', ':bprev<CR>', opts)
map('n', '<C-n>', ':bnext<CR>', opts)

-- SHIFT-< & SHIFT-> Better tabbing
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Copy Paste to System Clipboard
map('v', 'y', '"+y', opts)
map('v', 'yy', '"+yy', opts)

-- Prevent X / x from Adding to Clipboard
map('n', 'x', '"_x', opts)
map('n', 'X', '"_X', opts)
map('x', 'p', 'pgvy', opts)
