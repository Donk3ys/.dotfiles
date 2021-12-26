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

" File Explore
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'akinsho/flutter-tools.nvim'

" Terminal
Plug 'akinsho/toggleterm.nvim'

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"" UI
Plug 'sainnhe/gruvbox-material'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'NTBBloodbath/galaxyline.nvim' , {'branch': 'main'}

call plug#end()

source $HOME/.config/nvim/source/lspconfig.vim
source $HOME/.config/nvim/source/treesitter.vim
source $HOME/.config/nvim/source/autopairs.vim
source $HOME/.config/nvim/source/telescope.vim
source $HOME/.config/nvim/source/fugitive.vim
source $HOME/.config/nvim/source/cmp.vim
source $HOME/.config/nvim/source/galaxyline.vim
source $HOME/.config/nvim/source/todo-comments.vim
source $HOME/.config/nvim/source/dap.vim

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
