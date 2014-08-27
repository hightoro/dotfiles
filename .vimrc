
" [ encode ]
set encoding=utf8  " エンコード
set fileencoding=utf-8  " ファイルエンコード

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
"let &t_ti.="e[1 q" "カーソルを調整
"let &t_SI.="e[5 q" "カーソルを調整
"let &t_EI.="e[1 q" "カーソルを調整
"let &t_te.="e[0 q" "カーソルを調整

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
set directory=$HOME/.vim/backup
set backupdir=$HOME/.vim/backup

" [ other ] "
" スワップファイルは使わない
set noswapfile
" インサートモードから抜けると自動的にIMEをオフにする
"set iminsert=2
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
let g:neobundle#types#git#default_protocol = 'ssh'
"let g:neobundle#types#git#default_protocol = 'git'
"let g:neobundle#default_sites = "github"

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" --| My Bundles here: |------------
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'altercation/vim-colors-solarized' " solarized
"NeoBundle 'croaker/mustang-vim'              " mustang
"NeoBundle 'jeffreyiacono/vim-colors-wombat'  " wombat カラースキーム
"NeoBundle 'nanotech/jellybeans.vim'          " jellybeans
"NeoBundle 'vim-scripts/Lucius'               " lucius カラースキーム
NeoBundle 'vim-scripts/Zenburn'              " zenburn カラースキーム
"NeoBundle 'mrkn/mrkn256.vim'                 " mrkn256 カラースキーム
"NeoBundle 'jpo/vim-railscasts-theme'         " railscasts カラースキーム
"NeoBundle 'therubymug/vim-pyte'              " pyte カラースキーム
"NeoBundle 'tomasr/molokai'                   " molokai
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
"NeoBundleCheck

"}}}


" [ color ]
"syntax on
syntax enable
set t_Co=256
set background=dark

"colorscheme solarized
"let g:solarized_termcolors=256

colorschem zenburn
