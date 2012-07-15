set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/dotfiles/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif
NeoBundle 'Shougo/vimproc'
NeoBundle 'eagletmt/ghcmod-vim'

nnoremap <Nul> :GhcModType<Return>

syntax on
filetype on
filetype plugin on
set number
set title
set ruler
set nobackup
set noswapfile
set expandtab
set tabstop=4
set cursorline
highlight cursorline term=none cterm=none ctermbg=darkblue
