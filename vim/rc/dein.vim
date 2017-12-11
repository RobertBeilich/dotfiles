" setup dein.vim folder
let s:path = $HOME.'/.vim/bundle'
if !isdirectory(s:path.'/repos')
  silent call mkdir(s:path, "p", 0775)
  !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
  !bash /tmp/installer.sh ~/.vim/bundle
endif
execute 'set runtimepath+='.s:path.'/repos/github.com/Shougo/dein.vim'

let s:toml_path = $HOME.'/.config/nvim/rc/toml'

if !dein#load_state(s:path)
  finish
endif
call dein#begin(s:path, expand('<sfile>'))

call dein#load_toml(s:toml_path.'/environment.toml')
call dein#load_toml(s:toml_path.'/editing.toml')
call dein#load_toml(s:toml_path.'/ft.toml')
call dein#load_toml(s:toml_path.'/git.toml')
call dein#load_toml(s:toml_path.'/projects.toml')
call dein#load_toml(s:toml_path.'/writing.toml')
call dein#load_toml(s:toml_path.'/theme.toml')

" IMPORTANT: keep devicons at the very bottom
" IMPORTANT: install font in advance
" look here: https://github.com/ryanoasis/nerd-fonts
call dein#add('ryanoasis/vim-devicons')

call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif
