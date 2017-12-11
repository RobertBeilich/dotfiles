setlocal completeopt+=menu,preview
nmap <buffer> <localleader>e <Plug>(TsuquyomiRenameSymbol)
nmap <buffer> <localleader>E <Plug>(TsuquyomiRenameSymbolC)
nmap <buffer> <localleader>T : <C-u>echo tsuquyomi#hint()<CR>
