"""""""""""""""""""""""""""""""""""""""""
" NEO VIM
"
"""""""""""""""""""""""""""""""""""""""""

" Import General Settings & Key Maps
source $HOME/.config/nvim/sets.vim
source $HOME/.config/nvim/maps.vim


" Plugins
call plug#begin("~/.config/nvim/plugged")
" All
Plug 'nvim-lua/plenary.nvim'

" Buffers
Plug 'romgrk/barbar.nvim'

" Comments
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'folke/todo-comments.nvim'

" Auto Complete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'windwp/nvim-autopairs'

" Debug
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" File Explore
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'akinsho/flutter-tools.nvim'
Plug 'simrat39/rust-tools.nvim'

" Terminal
Plug 'akinsho/toggleterm.nvim'

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"" UI
Plug 'sainnhe/gruvbox-material'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'NTBBloodbath/galaxyline.nvim' , {'branch': 'main'}
Plug 'petertriho/nvim-scrollbar'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

call plug#end()

source $HOME/.config/nvim/after/plugins/lspconfig.vim
source $HOME/.config/nvim/after/plugins/treesitter.vim
source $HOME/.config/nvim/after/plugins/autopairs.vim
source $HOME/.config/nvim/after/plugins/telescope.vim
source $HOME/.config/nvim/after/plugins/fugitive.vim
source $HOME/.config/nvim/after/plugins/cmp.vim
source $HOME/.config/nvim/after/plugins/galaxyline.vim
source $HOME/.config/nvim/after/plugins/todo-comments.vim
source $HOME/.config/nvim/after/plugins/dap.vim

lua <<EOF
require"toggleterm".setup{
  open_mapping = [[<c-\>]],
	size = 30,
}

require'Comment'.setup()
local ft = require('Comment.ft')
ft.dart = {'//%s', '/*%s*/'}

--Comment context
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require("scrollbar").setup()

require("lsp_lines").register_lsp_virtual_lines()
EOF


" Colors
set termguicolors
set background=dark
colorscheme gruvbox-material
let g:gruvbox_material_background = 'soft'
" let g:airline_theme='transparent'


" Trim Whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

autocmd CursorMoved * exe printf('match CurrentWord /\V\<%s\>/', escape(expand('<cword>'), '/\'))
