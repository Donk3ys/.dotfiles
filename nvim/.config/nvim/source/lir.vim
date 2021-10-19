lua << EOF
local actions = require'lir.actions'

require'lir'.setup {
  show_hidden_files = false,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['h']     = actions.up,
    ['q']     = actions.quit,

		['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

--		['C'] = clipboard_actions.copy,
--    ['X'] = clipboard_actions.cut,
--    ['P'] = clipboard_actions.paste,

  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true,
    },

    -- You can define a function that returns a table to be passed as the third
    -- argument of nvim_open_win().
    win_opts = function()
      local width = math.floor(vim.o.columns * 0.5)
      local height = math.floor(vim.o.lines * 0.5)

      return {
        border = 'single',
        -- border = require("lir.float.helper").make_border_opts({
        --   "+",
        --   "─",
        --   "+",
        --   "│",
        --   "+",
        --   "─",
        --   "+",
        --   "│",
        -- }, "Normal"),
        width = width,
        height = height,
      }
    end,
  },
  hide_cursor = true,
}

-- custom folder icon
require'nvim-web-devicons'.set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#7ebae4",
    name = "LirFolderNode"
  }
})

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]

vim.api.nvim_set_keymap(
  "n",
  "<S-e>",
  "<Cmd>lua require'lir.float'.toggle()<CR>",
  { silent = true, noremap = true }
)
EOF
