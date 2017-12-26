nmap <buffer> <leader>t  <Plug>(go-test)

nmap <buffer> <leader>r  <Plug>(go-run)

nmap <buffer> <Leader>d <Plug>(go-doc)

nmap <buffer> <Leader>c <Plug>(go-coverage-toggle)

nmap <buffer> <Leader>i <Plug>(go-info)

nmap <buffer> <Leader>l <Plug>(go-metalinter)

" :GoDef but opens in a vertical split
nmap <buffer> <Leader>v <Plug>(go-def-vertical)
" :GoDef but opens in a horizontal split
nmap <buffer> <Leader>s <Plug>(go-def-split)

" :GoAlternate  commands :A, :AV, :AS and :AT
command! -bang -buffer A call go#alternate#Switch(<bang>0, 'edit')
command! -bang -buffer AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang -buffer AS call go#alternate#Switch(<bang>0, 'split')
command! -bang -buffer AT call go#alternate#Switch(<bang>0, 'tabe')

nmap <buffer> <C-g> :GoDeclsDir<cr>
imap <buffer> <C-g> <esc>:<C-u>GoDeclsDir<cr>
