"Ubuntusy
" set shell=/bin/bash\ -i
language en_US.UTF-8
set nocompatible
set re=1
set noswapfile
"sequence timeout
set timeoutlen=900
"show line number
set number
set relativenumber
"wrap long lines
"wrap symbol
set showbreak=+>>
set textwidth=120
set noshowmatch
"turn screen blinking off
set novisualbell
"hide file instead of closing (some plugins work better)
set hidden
"always show status line
set laststatus=2
set nobackup

"ENCODING
" set encoding=utf-8
"encoding when saving
set fileencoding=utf-8

"SEARCH
"highlight search results
set hlsearch
set smartcase
"search without confriming
set incsearch
set autoindent
"spaces instead of tabs
set expandtab
"default value
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
"shows colum and row
set ruler
set colorcolumn=120
set undolevels=100
set cursorline
set backspace=indent,eol,start
"color syntax
syntax on

"GVIM
if has('gui_running')
  set guifont=Hack\ 10
  "color current line background
  "remove right-hand scroll bar
  set guioptions-=r
  "remove left-hand scroll bar
  set guioptions-=L
  "remove toolbar
  set guioptions-=T
  "start maximized
  set lines=150 columns=300
endif

filetype off
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
"ctrl+p search
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-commentary'
"confrim autocompletion with tab
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
"select region +/-
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
"maximize/minimize window on f3
Plug 'szw/vim-maximizer'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-endwise'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'slim-template/vim-slim'
Plug 'lambdalisue/vim-fullscreen'
"language specific
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
" Plug 'Shougo/vimproc.vim'
" Plug 'Quramy/tsuquyomi'
" CHOOSE ONE DO
Plug 'airblade/vim-gitgutter'
" Plug 'leafgarland/typescript-vim'
" END

"neovim only
Plug 'benekastah/neomake'
call plug#end()
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

set background=dark
let &t_Co=256
colorscheme dante_modified

" let mapleader = ","
nnoremap , ;
nnoremap ; :
"airline fixes
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
"ctrl+move line
nmap <C-k> ddkP
nmap <C-j> ddp
imap <C-l> <Esc>$a
"press leader to easy motion
map <Leader> <Plug>(easymotion-prefix)
"NERDTree toggle
nmap <leader>2 :NERDTreeToggle<CR>
"close vim if only NERDTree is opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
map <C-l> :CtrlPMRU<CR>
"show hidden files
let g:ctrlp_show_hidden = 1
"Speed fixes http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    "Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    "ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"Async easytags
let g:easytags_async = 1
"Better performance
let g:easytags_syntax_keyword = 'always'
"tags filename and placement
set tags=./tags;
"create tag file per project
let g:easytags_dynamic_files = 2
"needed for upper line to work
set cpoptions+=d

let g:NERDTreeWinSize = 25

"copy to system clipboard
vnoremap <C-c> "+y
"paste form system clipboard
nmap <C-v> "+p
"auto set paste before pasting and set nopaste after pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_grep_command = 'ag %s -l --nocolor -g ""'

set wildignore+=*/tmp/*,*.so,*.swp,*.zipo

if has('nvim')
  "Exit terminal mode with esc
  :tnoremap <Esc> <C-\><C-n>"

  "Improve windows navigation by using 'alt + x' combination even when terminal window is active
  :tnoremap <A-h> <C-\><C-n><C-w>h
  :tnoremap <A-j> <C-\><C-n><C-w>j
  :tnoremap <A-k> <C-\><C-n><C-w>k
  :tnoremap <A-l> <C-\><C-n><C-w>l
  :nnoremap <A-h> <C-w>h
  :nnoremap <A-j> <C-w>j
  :nnoremap <A-k> <C-w>k
  :nnoremap <A-l> <C-w>l
endif

"tab lengths:
autocmd Filetype slim setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype haml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" let g:neomake_typescript_enabled_makers = []
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_tsc_fname = ''
" let g:syntastic_typescript_checkers = ['tsuquyomi']
" autocmd FileType typescript setlocal completeopt+=menu,preview

let g:ycm_path_to_python_interpreter = '/usr/bin/python'

autocmd! BufWritePost * Neomake
