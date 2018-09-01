" save as root
command W w !sudo tee % >/dev/null

"always open help at top
cnoreabbrev <expr> h ((getcmdtype() == ':' && getcmdpos() <= 2)? 'top h' : 'h')
cnoreabbrev <expr> help ((getcmdtype() == ':' && getcmdpos() <= 5)? 'top help' : 'help')
map <F1> :top help 

inoremap jk <esc>
nnoremap ä ddp
nnoremap ö ddkP
nnoremap Y y$

nnoremap <space> za

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

" copy all and close (without saving)
nnoremap ZT ggVG"+yZQ<CR>
