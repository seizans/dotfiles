set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"These are for ghc-mod.
NeoBundle 'Shougo/vimproc'
"NeoBundle 'eagletmt/ghcmod-vim'

"These are for neco-ghc.
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'ujihisa/neco-ghc'
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"let g:neocomplcache_enable_at_startup = 1

NeoBundle 'Shougo/unite.vim'
"NeoBundle 'eagletmt/unite-haddock'

NeoBundle 'surround.vim'

"For colorschema
NeoBundle 'w0ng/vim-hybrid'
colorscheme hybrid

"nnoremap <Nul> :GhcModType<Return>

filetype plugin indent on
NeoBundleCheck

syntax on
filetype on
filetype plugin on
set title
set ruler
set expandtab
set tabstop=4
set cursorline

set nowritebackup
set nobackup
set noswapfile

set ignorecase
set smartcase
set incsearch
set hlsearch

set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
