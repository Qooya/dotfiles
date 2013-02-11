" ------------------------------------------------------------
" .vimrc by Qooya
" ------------------------------------------------------------

" vi互換モードにしない
set nocompatible

" ------------------------------------------------------------
" Vundle Plugin Settings
" Vundleによるプラグインの管理
"
" filetypeを一度OFFにする
" （ファイルタイプを追加するようなプラグインに必要）
filetype off
" Vundleを初期化する
set rtp+=~/.vim/vundle.git/
call vundle#rc()
" プラグインのリスト
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'
Bundle 'sgur/unite-qf'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'vim-scripts/AnsiEsc.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'Lokaltog/vim-powerline'
Bundle 'hallison/vim-markdown'
Bundle 'tyru/open-browser.vim'
Bundle 'vim-jp/vimdoc-ja'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/TwitVim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tcomment_vim'
" Vundleの処理後、ftpluginとindentを読み込む
filetype plugin indent on

" ------------------------------------------------------------
" Reset MyAutoCmd
" 自分専用のautocmdグループをリセットしておく
" （設定ファイルを何度も読み込むと多重定義されてしまうから）
augroup MyAutoCmd
  autocmd!
augroup END

" ------------------------------------------------------------
" File Open
" ファイル読み込み関連
"
" vim内部で使用する文字エンコード
set encoding=utf-8
" ファイルを読み込んだときの文字エンコードの自動判別（前の方が優先）
set fileencodings=utf-8,euc-jp,sjis,cp932
" ファイルを読み込んだときの改行コードの自動判別（前の方が優先）
set fileformats=unix,mac,dos
" ファイルを読み込んだときに、最後にカーソルがあった位置まで移動
augroup MyAutoCmd
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END
" 現在編集中のファイルを既定のアプリケーションで開く（Macのみ）
nnoremap <silent> <Leader>o :<C-u>! open %<CR>
" 設定ファイルの編集・リロードのコマンド追加
command! VimrcEdit edit ~/.vimrc
command! VimrcReload source ~/.vimrc

" ------------------------------------------------------------
" Tab
" タブ関連
nnoremap <S-Left> gt
nnoremap <S-Right> gT

" ------------------------------------------------------------
" Display
" ディスプレイ関連
"
" フォントの設定
set guifont=Ricty_for_Powerline:h18
set guifontwide=Ricty:h18
" アンチエイリアスを有効にする
set antialias
" 256色モードをサポート
set t_Co=256
" カラースキーマの設定
syntax enable
colorscheme monokai
" □や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
" ステータスラインの行数
set laststatus=2
" 入力中のコマンドを右下に表示する
set showcmd
" powerline
let g:Powerline_symbols = 'fancy'
" indent-guideline
" インデントのハイライトを最初から有効にする
let g:indent_guides_enable_on_vim_startup = 1
" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0
" インデントのカラーを設定する
augroup MyAutoCmd
  " 奇数インデント
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
  " 偶数インデント
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
augroup END
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
" 行番号を表示する
set number
" 長い行を折り返す
set wrap
" 表示しきれない最終行も表示する
set display+=lastline
" ビープ音の代わりに画面をフラッシュする
set visualbell
" 新しいウィンドウを開く場所の設定
set splitbelow "  下
set splitright "  右

" ------------------------------------------------------------
" Search
" 検索関連
"
" 検索の時に大文字小文字を区別しない
set ignorecase
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set smartcase
" 検索結果をハイライトする
set hlsearch
" 検索ハイライトをF4キーで消去する
nnoremap <F4> :<C-u>nohlsearch<CR>
" 日本語ヘルプを検索できるようにする
set helplang=ja,en
" 外部grepを設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
" 入力ミスしやすいコマンド履歴、検索履歴を置き換える
nnoremap qqq: <ESC>q:
nnoremap qqq/ <ESC>q/
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

" ------------------------------------------------------------
" Edit
" 編集関連
"
" 前の行に基づいてインデントする
set autoindent
" 新しい行をつくったときに高度なインデントを行う
set smartindent
" 日本語の行を連結するときに空白を入力しない
set formatoptions+=mM
" Tabの設定
set expandtab " softtabを有効にして、タブの代わりに空白文字を挿入する
set tabstop=2 shiftwidth=2 softtabstop=2 " インデント幅を2文字にする
set showtabline=2 " タブ文字を表示する
" BackSpaceの設定。行頭空白、改行、挿入モード開始位置での削除を許す
set backspace=indent,eol,start
" clipboard
" ヤンク、ペーストにクリップボードを使用する
set clipboard=unnamed,autoselect
" カッコやクオートなどを入力した際に左に自動で移動
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
" 線を引く
inoreabbrev <expr> dl repeat('-', 65 - col('.'))

" ------------------------------------------------------------
" neocomplcache
"
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字を区別しない
"let g:neocomplcache_enable_smart_case  =  1

" ------------------------------------------------------------
" neosnippet
"
" スニペットのテンプレートの置き場所
if !exists("g:neosnippet#snippets_directory")
  let g:neosnippet#snippets_directory = ""
endif
let g:neosnippet#snippets_directory = "~/.vim/snippets"
" <TAB>でスニペット補完
if g:neocomplcache_enable_at_startup
  imap <expr><TAB> neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"
endif
" デフォルトのスニペットを無効化する。
let g:neosnippet#disable_runtime_snippets = {
      \   'html' : 1
      \}

" ------------------------------------------------------------
" ref
"
" アクセスする辞書のURLを設定する
let g:ref_source_webdict_sites = {
      \  'alc': {
      \    'url': 'http://eow.alc.co.jp/%s',
      \    'line':44,
      \  }
      \}
" デフォルトの辞書を設定する
let g:ref_source_webdict_sites.default = 'alc'
" webdictを呼び出す。
nnoremap <Leader>d :<C-u>Ref webdict<Space>

" ------------------------------------------------------------
" unite
"
" 常にインサートモードで起動する
let g:unite_enable_start_insert = 1
" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
" file_recで除外するファイルのパターンを設定する。unite#custom_source()を使用
call unite#custom_source('file_rec', 'ignore_pattern', '\.png$\|\.jpg$\|\.jpeg$\|\.gif$\|\.mid$\|\.ttf$\|\.mp3$')
" デフォルトでは ignorecase と smartcase を使う
" ignorecaseオプションを有効にしている場合に、smartcaseを有効にすると
" 小文字で検索すると大文字と小文字を無視して検索します。
" 大文字が入ると、ignorecaseが無効になります
call unite#set_buffer_name_option('default', 'ignorecase', 1)
call unite#set_buffer_name_option('default', 'smartcase', 1)
" ファイル選択時は smartcase を使わない
call unite#set_buffer_name_option('files', 'smartcase', 0)
" コマンド一覧からコマンドを起動
nnoremap <silent> <C-u><C-u> :<C-u>Unite -default-action=execute command<CR>
" 現在のバッファがあるディレクトリのファイル一覧を開く
nnoremap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" カレントディレクトリ以下のファイルを再帰的に取ってくる
nnoremap <silent> <C-u><C-p> :<C-u>Unite file_rec<CR>
" 最近使用したファイル一覧を開く
nnoremap <silent> <C-u><C-r> :<C-u>Unite file_mru<CR>
" 最近使用したディレクトリ一覧から、カレントディレクトリを移動する
nnoremap <silent> <C-u><C-d> :<C-u>Unite -default-action=cd directory_mru<CR>
" ブックマーク一覧
nnoremap <silent> <C-u><C-m> :<C-u>Unite bookmark<CR>
" vimgrep検索
nnoremap <silent> <C-u><C-g> :<C-u>Unite vimgrep -no-quit<CR>
" バッファ一覧
nnoremap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
" ウィンドウ一覧
nnoremap <silent> <C-u><C-w> :<C-u>Unite window<CR>
" タブ一覧
nnoremap <silent> <C-u><C-t> :<C-u>Unite tab<CR>
" ヘルプ
nnoremap <silent> <C-u><C-h> :<C-u>Unite help<CR>
" ソース一覧
"nnoremap <silent> <C-u><C-s> :<C-u>Unite source<CR>
"nnoremap <silent> <C-u><C-s> :<C-u>Unite snippet<CR>
"nnoremap <silent> <C-u><C-s> :<C-u>Unite menu<CR>
" アウトラインからカーソル移動
nnoremap <silent> <C-u><C-o> :<C-u>Unite outline<CR>
" QuickFixを表示する
nnoremap <silent> <C-u><C-x> :<C-u>Unite qf<CR>
" uniteバッファの設定
augroup MyAutoCmd
  autocmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    " ノーマルモード時にESCキーを押すとUniteを終了する
    nmap <buffer> <Esc> <Plug>(unite_exit)
    " インサートモード時にBackSpaceキーを押すとパスの階層を一つ消す
    "imap <buffer> <BS> <Plug>(unite_delete_backward_path)
  endfunction
augroup END

" ------------------------------------------------------------
" quickrun
"
" MarkdownをHTMLに変換してブラウザで表示する（要open-browser.vim）
" quickrun-examplesを参照
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'outputter': 'null',
      \ 'command': 'open',
      \ 'cmdopt': '-a',
      \ 'args': 'Marked',
      \ 'exec': '%c %o %a %s',
      \ }
" ------------------------------------------------------------
" TwitVim
"
" ブラウザを開くときに送るコマンドを設定（URLの上で<Leader>g)
let twitvim_browser_cmd = "open"
