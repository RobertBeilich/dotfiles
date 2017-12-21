function! s:source_rc(path) abort
  let abspath = resolve(expand('~/.config/nvim/rc/' . a:path))
  execute 'source' fnameescape(abspath)
endfunction

call s:source_rc('base.vim')
call s:source_rc('dein.vim')
call s:source_rc('mappings.vim')
