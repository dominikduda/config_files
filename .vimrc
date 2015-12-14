"Ubuntu
set shell=/bin/bash\ -i
language en_US.UTF-8
set nocompatible
set noswapfile
"sequence timeout
set timeoutlen=500
"show line number
set number
"wrap long lines
set linebreak
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
set encoding=utf-8
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
set backspace=indent,eol,start
"color syntax
syntax on

"GVIM
if has('gui_running')
  colorscheme dante_modified
  set guifont=Hack\ 9
  "color current line background
  set cursorline
  "color current color background
  set cursorcolumn
  "remove right-hand scroll bar
  set guioptions-=r
  "remove left-hand scroll bar
  set guioptions-=L
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
"ctrl+p search
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'
"confrim autocompletion with tab
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
"select region +/-
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
"maximize/minimize window on f3
Plugin 'szw/vim-maximizer'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-endwise'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()
filetype plugin indent on

"filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

let mapleader = ","
nnoremap ; :
"airline fixes
set fillchars+=stl:\ ,stlnc:\
let &t_Co=256
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"ctrl+move line
nmap <C-k> ddkP
nmap <C-j> ddp
"press leader to easy motion
map <Leader> <Plug>(easymotion-prefix)
"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
"Speed fixes http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

if executable('ag')
    "Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    "Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    "ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

"auto set paste before pasting and set nopaste after pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" autocmd BufWritePost * exe ":UpdateTags"
"tab lengths:
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype haml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
