
" [ encode ]
set encoding=utf8  " エンコード
set fileencoding=utf-8  " ファイルエンコード

" [ color ]
syntax on

let g:jellybeans_overrides = {
\  'Todo': { 'guifg': '303030', 'guibg': 'f0f000', 'ctermfg': 'Black', 'ctermbg': 'Yellow', 'attr': 'bold' },
\}

"colorscheme jellybeans
colorscheme mydark

" [ line number ]
set number  "行番号を表示する
set title "編集中のファイル名を表示

" [ status-line ]
set laststatus=2
set statusline=%F%r%h%=
set ruler  " 右下に行・列の番号を表示する
set showcmd  " コマンドを画面最下部に表示する

" [ key-control ]
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set backspace=start,eol,indent " バックスペースキーの作用する範囲の定義
"set backspace=eol

" [ view ]
set list  " 改行 ( $ ) やタブ ( ^I ) を可視化する
"set listchars=eol:$,tab:>\ ,extends:<
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" [ search ] "
set incsearch   " インクリメンタルサーチ
set ignorecase  " 検索時に大文字小文字を区別しない
set smartcase   " 検索文字列に大文字が含まれている場合は区別して検索する
"set wrapscan    " 検索時に最後まで行ったら最初に戻る
set nowrapscan  " 検索時に最後まで行ったら最初に戻らない
set wildmenu wildmode=list:full
set nohlsearch  " 検索語にマッチした単語をハイライトする
set cursorline  " カーソル行の背景色を変える

" [ indent / tab ] "



" [ Charset, Line ending ] "
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set ffs=unix,dos,mac			" LF, CRLF, CR
if exists('&ambiwidth')
	set ambiwidth=double		" UTF-8の□や○でカーソル位置がずれないようにする
endif



" [ clip board ] "
set clipboard+=unnamed
set clipboard=unnamed

" [ backup ] "
set directory=$HOME/.vim/vimbackup
set backupdir=$HOME/.vim/vimbackup

" [ other ] "
" スワップファイルは使わない
set noswapfile
" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=2
" ビープ音を消す
set vb t_vb=
set novisualbell

" ======================
" |  ***  Plugin  ***  |
" ======================
" [ Neobundle ] " {{{
set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" gitへのアクセスプロトコルをsshに変更
"let g:neobundle_default_git_protocol='ssh'
"let g:neobundle#types#git#default_protocol = 'ssh'
"let g:neobundle#default_sites = "github"
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" --| My Bundles here: |------------
NeoBundle 'github:Shougo/unite.vim'
"
"
" --| My Bundles end:  |------------

call neobundle#end()
filetype plugin indent on

" vim上で，↓を実行すれば適用される。
" :NeoBundleInstall
"
" アップデートするには
" :NeoBundleUpdate
"
" 不要になったプラグインを削除するには、
" :NeoBundleの設定を.vimrcから削除した後、↓のコマンドを実行
" :NeoBundleClean

" 自動アップデート
NeoBundleCheck

"}}}





