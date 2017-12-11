function! NumberAutoGroupToggle()
  if !exists('#NumberAutoGroup#InsertEnter')
    call NumberAutoGroupOn()
  else
    call NumberAutoGroupOff()
  endif
endfunction

function! NumberAutoGroupOn()
  augroup NumberAutoGroup
    autocmd!
    autocmd BufRead,BufNewFile * set relativenumber
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
  augroup END
endfunction

function! NumberAutoGroupOff()
  augroup NumberAutoGroup
    autocmd!
    set norelativenumber
  augroup END
endfunction

call NumberAutoGroupOn()
