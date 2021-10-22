" SPACE set to leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Buffers
nnoremap <silent> <C-p> :BufferPrevious<CR>
nnoremap <silent> <C-n> :BufferNext<CR>
nnoremap <silent> <C-c> :BufferClose<CR>

" Use alt + hjkl to resize windows
"nnoremap <M-j>    :resize -2<CR>
"nnoremap <M-k>    :resize +2<CR>
"nnoremap <M-h>    :vertical resize -2<CR>
"nnoremap <M-l>    :vertical resize +2<CR>

" Move to begin / end of line
nnoremap <C-h> 0
nnoremap <C-l> $

" TAB in general mode will move to next window buffer
"nnoremap <TAB> <C-W>w
" Move next / prev buffers -> plug Buf-Tab-Line
" SHIFT-TAB will go between tab buffers
" nnoremap <S-TAB> :bnext<CR>
" nnoremap <C-N> :bnext<CR>
" nnoremap <C-P> :bprev<CR>


" SHIFT-< & SHIFT-> Better tabbing
vnoremap < <gv
vnoremap > >gv

" Set fold method to indent
nmap za :set foldmethod=expr<CR>
