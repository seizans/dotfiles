"NeoBundle
if has('vim_starting')
  if &compatible
    set nocompatible  " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'


"Base
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'cespare/vim-toml'

NeoBundle 'Shougo/neocomplete.vim'
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Use camel case completion.
let g:neocomplete#enable_camel_case = 1
" buffer file name pattern that locks neocomplete. e.g. ku.vim or fuzzyfinder
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" This variable controls the number of candidates displayed in a pop-up menu
let g:neocomplete#max_list = 20
" Define file-type dependent dictionaries.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

NeoBundle 'elixir-lang/vim-elixir'

NeoBundle 'scrooloose/syntastic'
"let g:syntastic_debug = 1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=120'

"For colorschema
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'tpope/vim-surround'
"NeoBundle 'vim-scripts/Align'
"NeoBundle 'vim-scripts/YankRing.vim'

"NeoBundle 'tyru/open-browser.vim'
"nmap gW <Plug>(openbrowser-open)


"Erlang
NeoBundle 'vim-erlang/vim-erlang-runtime'
NeoBundle 'vim-erlang/vim-erlang-omnicomplete'
NeoBundle 'vim-erlang/vim-erlang-compiler'

NeoBundle 'vim-erlang/vim-erlang-tags'

NeoBundle 'airblade/vim-rooter'
set tags+=.git/tags,tags
let g:rooter_autocmd_patterns = '*.erl'
let g:rooter_silent_chdir = 1
" erlファイルをerlangとして認識する
au BufNewFile,BufRead *.erl setf erlang
au FileType erlang setlocal errorformat=%f:%l:\ %m

" Lua
"NeoBundleLazy 'git@github.com:shiguredo/luli.vim.git', {
"     \ 'autoload': {
"     \   'filetypes': ['lua']
"     \ }}
"NeoBundleLazy 'git@github.com:shiguredo/lunaspot.vim.git', {
"     \ 'autoload': {
"     \   'filetypes': ['lua']
"     \ }}
"let g:syntastic_lua_checkers = ['luli']

"Haskell
"These are for ghc-mod.
"NeoBundle 'eagletmt/ghcmod-vim'
"These are for neco-ghc.
"NeoBundle 'ujihisa/neco-ghc'
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"NeoBundle 'eagletmt/unite-haddock'
"nnoremap <Nul> :GhcModType<Return>

NeoBundle 'jmcantrell/vim-virtualenv', {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
"NeoBundle 'lambdalisue/vim-django-support', {
"      \ "autoload": {
"      \   "filetypes": ["python", "python3", "djangohtml"]
"      \ }}
NeoBundle "davidhalter/jedi-vim"
autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#popup_select_first=0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python = '\h\w|[^. \t].\w'
"let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
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

" Golang
"set rtp+=$GOROOT/misc/vim
"set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
"exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
"set completeopt=menu,preview
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" エラー出るのでとりあえずコメントアウト
"NeoBundle 'tpope/vim-pathogen'
"execute pathogen#infect()
"let g:syntastic_go_checkers = ['go', 'golint']

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


syntax on
set title
set ruler
set expandtab
autocmd! FileType go setlocal noexpandtab
set tabstop=4
set shiftwidth=4
set cursorline
set background=dark
colorscheme hybrid
"colorscheme jellybeans

" Macの場合はVisualMode時に C-c と C-v でコピー、ペーストできるように
"let s:is_mac = (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
"if s:is_mac
"    vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
"    nmap <Space><C-v> :call setreg("\"",system("pbpaste"))<CR>p
"endif

set nowritebackup
set nobackup
set noswapfile

set ignorecase
set smartcase
set incsearch
set hlsearch

set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

set visualbell t_vb=    " ビープ音を無効化する
set list                " 不可視文字の可視化
"set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=120      " その代わり120文字目にラインを入れる
set backspace=indent,eol,start  " インサートモードに入る前からあった文字を消せる
set t_Co=256

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" オムニ補完を<C-f>で
imap <C-f> <C-x><C-o>

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

" rstの下線を適切な長さで引く: visual mode で <space># と押下する
nnoremap <silent> <space># yyp<c-v>$r#
nnoremap <silent> <space>= yyp<c-v>$r=
nnoremap <silent> <space>- yyp<c-v>$r-
