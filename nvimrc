if &compatible
  set nocompatible
endif

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

" state は必要に感じるまで外す
"if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#end()
"  call dein#save_state()
"endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif

" Shougo/deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 20

" 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

" 'scrooloose/syntastic'
"let g:syntastic_debug = 1
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=120'

let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['ruby']}
let g:syntastic_ruby_checkers = ['rubocop']

" 'vim-erlang/vim-erlang-tags'
" 'airblade/vim-rooter'
" set tags+=.git/tags,tags
" let g:rooter_autocmd_patterns = '*.erl'
" let g:rooter_silent_chdir = 1
" erlファイルをerlangとして認識する
au BufNewFile,BufRead *.erl setf erlang
au FileType erlang setlocal errorformat=%f:%l:\ %m

"au BufNewFile,BufRead *.ex setf elixir
"au BufNewFile,BufRead *.exs setf elixir
"au BufNewFile,BufRead *.eex setf elixir
"au FileType elixir setlocal errorformat=%f:%l:\ %m
"let g:syntastic_elixir_checkers = ['vim-elixir']

" "davidhalter/jedi-vim"
autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#popup_select_first=0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
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


filetype plugin indent on

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
let s:is_mac = (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
if s:is_mac
    vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
    nmap <Space><C-v> :call setreg("\"",system("pbpaste"))<CR>p
endif

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
