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

NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_python_checker='flake8'

NeoBundle 'jmcantrell/vim-virtualenv', {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundle 'lambdalisue/vim-django-support', {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
"NeoBundle "davidhalter/jedi-vim", {
      "\ "autoload": {
      "\   "filetypes": ["python", "python3", "djangohtml"],
      "\  }}
      "\ },
      "\ "build": {
      "\   "mac": "pip install jedi",
      "\   "unix": "pip install jedi",
      "\ }}
"let s:hooks = neobundle#get_hooks("jedi-vim")
"function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  "let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  "let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
  "let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
  "let g:jedi#goto_command = '<Leader>G'
"endfunction
NeoBundle 'hynek/vim-python-pep8-indent', {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/YankRing.vim'

"For colorschema
NeoBundle 'w0ng/vim-hybrid'

"nnoremap <Nul> :GhcModType<Return>

filetype plugin indent on
NeoBundleCheck

syntax on
set title
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
colorscheme hybrid

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
