set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/dotfiles/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif
"These are for ghc-mod.
NeoBundle 'Shougo/vimproc'
NeoBundle 'eagletmt/ghcmod-vim'
"These are for neco-ghc.
NeoBundle 'ujihisa/neco-ghc'
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:neocomplcache_enable_at_startup = 1
"These are for unite-haddoc.
NeoBundle 'Shougo/unite.vim'
NeoBundle 'eagletmt/unite-haddoc'

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
