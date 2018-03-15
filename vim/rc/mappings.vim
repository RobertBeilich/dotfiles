let mapleader=','
let maplocalleader=','

" save as root
command W w !sudo tee % >/dev/null

"always open help at top
cnoreabbrev <expr> h ((getcmdtype() == ':' && getcmdpos() <= 2)? 'top h' : 'h')
cnoreabbrev <expr> help ((getcmdtype() == ':' && getcmdpos() <= 5)? 'top help' : 'help')
map <F1> :top help<CR>

inoremap jk <esc>
" nnoremap - ddp
" nnoremap + ddkP
nnoremap ä ddp
nnoremap Ä ddkP
" nnoremap ä <c-w>w
" nnoremap Ä <c-w>W
nnoremap Y y$

nnoremap <c-w>H :topleft vnew<CR>
nnoremap <c-w>J :botright new<CR>
nnoremap <c-w>K :topleft new<CR>
nnoremap <c-w>L :botright vnew<CR>

" move inside wrapped lines instead of jumping above
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

nnoremap ZT ggVG"+y:q!<CR>

" nmap n :ShowSearchIndex<CR><Plug>Evanesco_n
" nmap N :ShowSearchIndex<CR><Plug>Evanesco_N
