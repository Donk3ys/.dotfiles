local map = vim.api.nvim_set_keymap
local opts = {noremap=true, silent=true}

-- SPACE set to leader
vim.g.mapleader=' '

-- Buffers
map('n', '<C-p>', ':BufferPrevious<CR>', opts)
map('n', '<C-n>', ':BufferNext<CR>', opts)

-- SHIFT-< & SHIFT-> Better tabbing
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
