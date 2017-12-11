" suppress intro when starting vim
set shortmess+=I

set shiftwidth=2
set tabstop=2
set expandtab

set completeopt-=preview
set scrolloff=10

set ignorecase
set smartcase

set inccommand=split

"set splitbelow " conflicts with fugitive windows
set splitright
set winminheight=0

set wildignore+=*/build/*

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

set number

if has('mouse')
  set mouse=a
endif

filetype plugin indent on

" Reopen at last position if possible
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif

if has("persistent_undo")
  set undofile
endif
