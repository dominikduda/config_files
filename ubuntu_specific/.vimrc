set shell=/bin/zsh

" |-----------------------------------------------------------------------------------------|
" | FORMATTING INFO                                                                         |
" |-----------------------------------------------------------------------------------------|
" | Begin of section (preceded with upcased title): ************************************    |
" |                                                                                         |
" | End of section: <!!!!!!!!**************!!!!!!!!>                                        |
" |                                                                                         |
" | Section description: < sample description >                                             |
" |                                                                                         |
" | There should be empty line before and after section                                     |
" |                                                                                         |
" | Normal comment always concerns only one line below it (unless specified otherwise).     |
" |-----------------------------------------------------------------------------------------|

" ENCODING ************************************
language en_US.UTF-8
set langmenu=en_US.UTF-8
set fileencoding=utf-8
" <!!!!!!!!**************!!!!!!!!>
" Removed in nvim, keeping for backwards compatibility
" set nocompatible

" NOT SURE OR TOO LAZY TO CHECK ************************************
set ttimeoutlen=0
set smarttab
set softtabstop=2
" <!!!!!!!!**************!!!!!!!!>

" AFAIK time to update gitgutter signs
set updatetime=300
" Mouse support
set mouse=a
" Only redraw when it is needed
set lazyredraw
" Sequence timeout
set timeoutlen=900
" Show absolute line number in current line
set number
" Show relative line number
set relativenumber
" Wrapped line symbol
set showbreak=▶▶▶
" Text (e. g. comment) break point
set textwidth=120
" Disable jumping to matching parenthesis after typing it
set noshowmatch
" Disable creating swap files
set noswapfile
" Turn screen blinking off
set novisualbell
" Always show status line
set laststatus=2
" Show commands as they are entered
set showcmd
" Create vsplit on right side
set splitright
" Create hsplit on bottom
set splitbelow
" Hide buffers instead of closing them
set hidden
" Disable creating backup files
set nobackup
" Highlight search results
set hlsearch
" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase
" Search as you type
set incsearch
" Copy indent from current line when starting new line
set autoindent
" Spaces instead of tabs in insert mode
set expandtab
" Default tab width
set shiftwidth=2
" Add extra tab when starting new line in some cases
set smartindent
" Show column and row numbers
set ruler
" Color 120th column
set colorcolumn=120
" Amount of possible undos
set undolevels=100
" Highlight current line
set cursorline
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Color syntax
syntax on

" GVIM ************************************
" < may find use in the future >
if has('gui_running')
  " Font settings
  set guifont=Hack\ 10
  " Remove right-hand scroll bar
  set guioptions-=r
  " Remove left-hand scroll bar
  set guioptions-=L
  " Remove toolbar
  set guioptions-=T
  " Start maximized
  set lines=150 columns=300
endif
" <!!!!!!!!**************!!!!!!!!>

filetype off
call plug#begin('~/.vim/plugged')

" Plug 'tmux-plugins/vim-tmux-focus-events'

" GENERAL ************************************
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
" <!!!!!!!!**************!!!!!!!!>

" GIT INTEGRATION ************************************
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
" <!!!!!!!!**************!!!!!!!!>

" SMART SEARCH ************************************
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
" <!!!!!!!!**************!!!!!!!!>

" RAILS ************************************
" Enable 'bunle' in vim and more
Plug 'tpope/vim-bundler'
" Add rails-releated shortcuts to vim
Plug 'tpope/vim-rails'
" Vim-rails shortcuts everywhere!
Plug 'tpope/vim-rake'
" <!!!!!!!!**************!!!!!!!!>

" Syntax
Plug 'scrooloose/syntastic'
" Live markdown preview
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
" Enable 'Rvm use' in vim
Plug 'tpope/vim-rvm'
" Comments
Plug 'tpope/vim-commentary'
" Undo history tree
Plug 'sjl/gundo.vim'
" Change ruby blocks between do end and { }
Plug 'jgdavey/vim-blockle'

" AUTOCOMPLETE AND SNIPPETS ************************************
" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Confrim autocompletion with tab
Plug 'ervandew/supertab'
" Snippets for various languages pack
Plug 'honza/vim-snippets'
" Snippet engine
Plug 'SirVer/ultisnips'
" <!!!!!!!!**************!!!!!!!!>

" Repeat plugin commands with .
Plug 'tpope/vim-repeat'

" " JS ************************************
" Plug 'pangloss/vim-javascript'
" Plug 'isRuslan/vim-es6'
" Plug 'kchmck/vim-coffee-script'
" Plug 'mxw/vim-jsx'
" " <!!!!!!!!**************!!!!!!!!>

" " TYPESCRIPT ************************************
" Plug 'Quramy/tsuquyomi'
" Plug 'leafgarland/typescript-vim'
" " Async execution library, required by tsuquyomi
" Plug 'Shougo/vimproc.vim'
" " <!!!!!!!!**************!!!!!!!!>

" Dim inactive windows
Plug 'blueyed/vim-diminactive'
" Airline
Plug 'bling/vim-airline'
" Detect trailing whitespaces
Plug 'bronson/vim-trailing-whitespace'
" Select region +/-
Plug 'terryma/vim-expand-region'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Maximize/minimize window on f3
Plug 'szw/vim-maximizer'
" Rubocop
Plug 'ngmy/vim-rubocop'
" Auto add ends, endfuncion, endif
Plug 'tpope/vim-endwise'
" Better highlighting for c++
Plug 'octol/vim-cpp-enhanced-highlight'
" Auto insert matching brackets
Plug 'jiangmiao/auto-pairs'
" Slim support
Plug 'slim-template/vim-slim'
" HTML support
Plug 'mattn/emmet-vim'
" Easy text align with regexp
Plug 'godlygeek/tabular'
" Coffe script support
Plug 'kchmck/vim-coffee-script'

" " GVIM ONLY ************************************
" " Enabling fulscreen helper
" Plug 'lambdalisue/vim-fullscreen'
" " <!!!!!!!!**************!!!!!!!!>

" Ruby support
Plug 'vim-ruby/vim-ruby'

" NEOVIM ONLY ************************************
Plug 'benekastah/neomake'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
" <!!!!!!!!**************!!!!!!!!>

" Haml support
Plug 'tpope/vim-haml'
call plug#end()

" NOT SURE OR TOO LAZY TO CHECK ************************************
filetype plugin indent on
set wildignore+=*/tmp/*,*.so,*.swp,*.zipo
set omnifunc=syntaxcomplete#Complete
let &t_Co=256
set t_Co=16
colorscheme dante_modified
" JS thing
let g:jsx_ext_required = 0
" <!!!!!!!!**************!!!!!!!!>

" YOUCOMPLETEME CONFIG ************************************
" Path to python interpreter for ycm
" let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
" Make YCM compatible with UltiSnips using supertab (3 lines below)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" <!!!!!!!!**************!!!!!!!!>

" ULTISNIPS CONFIG ************************************
" Better key bindings for UltiSnipsExpandTrigger (3 lines below)
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" <!!!!!!!!**************!!!!!!!!>

" LIVEDOWN CONFIG ************************************
nmap gm :LivedownToggle<CR>
" The system command to launch a browser
let g:livedown_browser = 'google-chrome'
" Should the browser window pop-up upon previewing
let g:livedown_open = 1
" <!!!!!!!!**************!!!!!!!!>

" NEOTERM CONFIG ************************************
nmap <leader>2 :Ttoggle<CR>
let g:neoterm_size = 10
let g:neoterm_keep_term_open = 0
" <!!!!!!!!**************!!!!!!!!>

" AIRLINE CONFIG ************************************
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
" <!!!!!!!!**************!!!!!!!!>

" CTRLP CONFIG ************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
map <C-l> :CtrlPMRU<CR>
"show hidden files
let g:ctrlp_show_hidden = 1
"Speed fixes http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Use ag instead of grep if installed
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" <!!!!!!!!**************!!!!!!!!>

" EASYTAGS CONFIG ************************************
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
" <!!!!!!!!**************!!!!!!!!>

" DIMINACTIVE SETTINGS ************************************
" Enable dimming non-file windows (like nerdtree, ag)
let g:diminactive_buftype_blacklist = []
" tmux integration
let g:diminactive_enable_focus = 1
" Fixes not-dimming properly when file is opened from nerdtree
autocmd BufNew * DimInactive
" <!!!!!!!!**************!!!!!!!!>
"
" NERDTREE CONFIG ************************************
let g:NERDTreeWinSize = 43
"close vim if only NERDTree is opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" start with nerdtree open if no file were specified (2 lines below)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NerdTree toggle
nmap <leader>1 :NERDTreeToggle<CR>
" <!!!!!!!!**************!!!!!!!!>

" TAGBAR CONFIG ************************************
" autocmd BufEnter * nested :call tagbar#autoopen(0)
nmap <leader>\ :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_width = 39
let g:tagbar_sort = 0
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
" <!!!!!!!!**************!!!!!!!!>

" GITGUTTER CONFIG ************************************
let g:gitgutter_sign_column_always = 1
" View diff with <leader>1
" nnoremap <expr> <leader>2 (g:gitgutter_highlight_lines) ? ':GitGutterLineHighlightsToggle<CR>:NERDTreeToggle<CR><C-w>l:q!<CR>' : ':GitGutterLineHighlightsToggle<CR>:Gvsplit<CR>:NERDTreeToggle<CR>'
" uncomment 2 lines below in case of performance issues
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_async = 1
" <!!!!!!!!**************!!!!!!!!>

" PERSONAL CONFIG AND SHORTCUTS ************************************
" show highlight source by pressing F10 (3 lines below)
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" ctrl+move line (2 lines below)
nmap <C-k> ddkP
nmap <C-j> ddp
nnoremap , ;
nnoremap ; :
imap <C-l> <Esc>$a
" Copy to system clipboard
vnoremap <C-c> "+y
" Paste form system clipboard (2 lines below)
nmap <C-v> "+p
imap <C-v> <Esc>"+pa
" Change current line color when entering insert mode
autocmd InsertEnter * highlight  CursorLine ctermbg=52
" Revert current line color to default when leaving insert mode
autocmd InsertLeave * highlight  CursorLine ctermbg=235
" Search on , (2 lines below)
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap , :Ag<SPACE>
" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change (2 lines below)
set autoread
au CursorHold * checktime
" Toggle Gundo window
nnoremap <F5> :GundoToggle<CR>
" move Ag window to bottom after opened
autocmd FileType qf wincmd J
" <!!!!!!!!**************!!!!!!!!>

" VIM-TEST CONFIG ************************************
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = 'neoterm'
let g:neoterm_position = 'horizontal'
" <!!!!!!!!**************!!!!!!!!>

" BLOCKLE CONFIG ************************************
" let g:blockle_mapping = '<C-b>'
" <!!!!!!!!**************!!!!!!!!>

" FUGITIVE CONFIG ************************************
set diffopt+=vertical
" <!!!!!!!!**************!!!!!!!!>

" TERMINAL MODE SHORTCUTS ************************************
if has('nvim')
  " Exit terminal mode with esc
  :tnoremap <Esc> <C-\><C-n>"
  " Improve windows navigation by using 'alt + *' combination even when terminal window is active
  :tnoremap <A-h> <C-\><C-n><C-w>h
  :tnoremap <A-j> <C-\><C-n><C-w>j
  :tnoremap <A-k> <C-\><C-n><C-w>k
  :tnoremap <A-l> <C-\><C-n><C-w>l
  :nnoremap <A-h> <C-w>h
  :nnoremap <A-j> <C-w>j
  " Its like this to swap to middle buffer when switching from term (left is usually nerdtree)
  :nnoremap <A-k> <C-w>k
  :nnoremap <A-l> <C-w>l
endif
" <!!!!!!!!**************!!!!!!!!>

" TAB LENGTHS ************************************
autocmd Filetype slim setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype haml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype sass setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
" <!!!!!!!!**************!!!!!!!!>

" TYPESCRIPT SETTINGS ************************************
let g:neomake_javascript_enabled_makers = ['eslint']
let g:tsuquyomi_disable_quickfix = 1
" let g:neomake_typescript_enabled_makers = []
" let g:syntastic_typescript_tsc_fname = ''
" let g:syntastic_typescript_checkers = ['tsuquyomi']
autocmd FileType typescript setlocal completeopt+=menu,preview
" <!!!!!!!!**************!!!!!!!!>

" AB SPECIFIC ************************************
" Add empty line at end of file after save
set eol
let test#ruby#rspec#executable = 'foreman run rspec'
let g:test#runner_commands = ['Rspec']
" vim-rails priority rspec tests when using :A
let g:rails_projections = {
      \  'app/*.rb': {
      \     'alternate': 'spec/{}_spec.rb',
      \     'type': 'source'
      \   },
      \  'spec/*_spec.rb': {
      \     'alternate': 'app/{}.rb',
      \     'type': 'test'
      \   }
      \}
" Color 100th column
set colorcolumn=100
" <!!!!!!!!**************!!!!!!!!>

autocmd! BufWritePost * Neomake
"Auto remove trailing whitespaces on save
autocmd BufWritePre * FixWhitespace
set switchbuf=split

