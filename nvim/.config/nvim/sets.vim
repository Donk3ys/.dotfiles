" General Settings
set number
set relativenumber			" Line numnbers relative current line
set scrolloff=8					" Lines auto scroll up/down before hit bottom/top page
set nowrap              " Display long lines as just one line
set mouse=a             " Enable your mouse
set splitbelow          " Horizontal splits will automatically be below
set splitright          " Vertical splits will automatically be to the right

set tabstop=2           " Insert 2 spaces for a tab
set shiftwidth=2        " Change the number of space characters inserted for indentation
set smarttab            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent         " Makes indenting smart
set smartcase						" Case sensitive search
set autoindent          " Good auto indent
"set foldmethod=indent		" Folds lines of code by indent

set nohlsearch					" Dont highlight words for search

set nobackup            " This is recommended by coc
set nowritebackup       " This is recommended by coc

set hidden							" Keep buffers open in background
set noswapfile

set clipboard=unnamedplus " Copy paste between vim and everything else

" Where to store undo file
set undodir=~/.vim/undo-dir
set undofile

" Language Settings
au BufNewFile,BufRead *.py
		\ set tabstop=4 |
		\ set softtabstop=4 |
		\ set shiftwidth=4 |
		\ set fileformat=unix

au BufNewFile,BufRead *.html,*.css,*.dart,*.js
		\ set tabstop=2 |
		\ set softtabstop=2 |
		\ set shiftwidth=2

filetype plugin on

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" " Better code folding
" function! MyFoldText()
"     let line = getline(v:foldstart)
"     let foldedlinecount = v:foldend - v:foldstart + 1
"     return ' ﬌ '. foldedlinecount . line
" endfunction
" set foldtext=MyFoldText()
" set fillchars=fold:\

" Allow php varibales
"set iskeyword=@,48-57,_,192-255,$
set iskeyword+=$
