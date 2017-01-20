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

" Change vertical buffer separator (last char)
set fillchars+=vert:\│
" Maximum jump when scrolling horizontally
set sidescroll=1
" Always show at least 5 columns on the left/right side of cursor
set sidescrolloff=5
" Always show at least 1 line above/below the cursor
set scrolloff=1
" Use old regexp engine (on new one tags highlighting was running deadly slow)
set regexpengine=0
" AFAIK time to update gitgutter signs
set updatetime=600
" Mouse support
set mouse=a
" Only redraw when it is needed
set lazyredraw
" Sequence timeout
set timeoutlen=900
" Show absolute line number in current line
set number
" Show relative line number
" set relativenumber
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
" Ignore case of searched characters
set ignorecase
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
call plug#begin('~/.config/nvim/plug')

" tmux focus events integraion (switching between vim pane and other console pane)
Plug 'tmux-plugins/vim-tmux-focus-events'
" .tmux.conf syntax highlighting
Plug 'tmux-plugins/vim-tmux'
" ascii art (useless)
Plug 'vim-scripts/DrawIt'

" GENERAL ************************************
Plug 'xolox/vim-misc'
Plug 'c0r73x/neotags.nvim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'rhysd/clever-f.vim'
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
Plug 'mbbill/undotree'
" Change ruby blocks between do end and { }
Plug 'jgdavey/vim-blockle'

" AUTOCOMPLETE AND SNIPPETS ************************************
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
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
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
Plug 'Raimondi/delimitMate'
" Slim support
Plug 'slim-template/vim-slim'
" HTML support
Plug 'mattn/emmet-vim'
" Easy text align with regexp
Plug 'godlygeek/tabular'
" Coffe script support
Plug 'kchmck/vim-coffee-script'
" Project wide search
Plug 'rking/ag.vim'

" " GVIM ONLY ************************************
" " Enabling fulscreen helper
" Plug 'lambdalisue/vim-fullscreen'
" " <!!!!!!!!**************!!!!!!!!>

" Ruby support
Plug 'vim-ruby/vim-ruby'

" NEOVIM ONLY ************************************
" Yank history
Plug 'Shougo/neoyank.vim'
Plug 'benekastah/neomake'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" <!!!!!!!!**************!!!!!!!!>

" Dependency for neoyank (and some more kombajnish unused things), this isn'
Plug 'Shougo/unite.vim'

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

" CLEVER-F CONFIG ************************************
let g:clever_f_ignore_case = 1
" <!!!!!!!!**************!!!!!!!!>

" NEOYANK CONFIG ************************************
nnoremap <leader>3 :Unite history/yank -default-action=append<Cr>
" <!!!!!!!!**************!!!!!!!!>

" SUPERTAB CONFIG ************************************
let g:SuperTabDefaultCompletionType = "<c-n>"
" <!!!!!!!!**************!!!!!!!!>

" NEOTAGS CONFIG ************************************
let g:neotags_enabled = 0
let g:neotags_highlight = 1
" <!!!!!!!!**************!!!!!!!!>

" DEOPLETE CONFIG ************************************
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_refresh_delay = 25
imap <c-j> <Tab>
imap <c-k> <S-Tab>
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
" let g:neoterm_size = 20
let g:neoterm_keep_term_open = 1
let g:neoterm_run_tests_bg = 1
" <!!!!!!!!**************!!!!!!!!>

" AIRLINE CONFIG ************************************
" Caused errors after one of updates
let g:airline#extensions#tagbar#enabled = 0
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_summerfruit'
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

" DIMINACTIVE SETTINGS ************************************
" Enable dimming non-file windows (like nerdtree, ag)
let g:diminactive_buftype_blacklist = []
" tmux integration
let g:diminactive_enable_focus = 1
" Fixes not-dimming properly when file is opened from nerdtree
autocmd BufNew * DimInactive
" <!!!!!!!!**************!!!!!!!!>

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
let g:tagbar_sort = 1
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
" uncomment 2 lines below in case of performance issues
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_async = 1
" <!!!!!!!!**************!!!!!!!!>

" AG.VIM CONFIG ************************************
let g:ag_highlight=1
nnoremap , :Ag<Space>-Q<Space>'
" <!!!!!!!!**************!!!!!!!!>

" PERSONAL CONFIG AND SHORTCUTS ************************************
" show highlight source by pressing F10 (3 lines below)
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" ctrl+move line (2 lines below)
nmap <C-k> ddkP
nmap <C-j> ddp
nnoremap ; :
imap <C-l> <End>
imap kk <Right>
imap jj <Esc>
" Copy to system clipboard
vnoremap <C-c> "+y
" Paste form system clipboard (2 lines below)
nmap <C-v> "+p
imap <C-v> <Esc>"+pa
" Change current line color when entering insert mode
autocmd InsertEnter * highlight  CursorLine ctermbg=52
" Revert current line color to default when leaving insert mode
autocmd InsertLeave * highlight  CursorLine ctermbg=235
" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change (2 lines below)
set autoread
au CursorHold * checktime
" Toggle Undotree window
nnoremap <F5> :UndotreeToggle<CR>
" move Ag window to bottom after opened
" autocmd FileType qf wincmd J
" Use { to span next line to current
nnoremap { J
" Use J and K to jump between paragraphs in visual and normal modes (4 lines below)
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
" Use H and L to jump to beginning and end of line in normal and visual modes (4 lines below)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
" <!!!!!!!!**************!!!!!!!!>

" VIM-TEST CONFIG ************************************
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = 'neoterm'
" let test#strategy = 'vimux'
let g:neoterm_position = 'horizontal'
" let g:test#preserve_screen = 1
" <!!!!!!!!**************!!!!!!!!>

" BLOCKLE CONFIG ************************************
" let g:blockle_mapping = '<C-b>'
" <!!!!!!!!**************!!!!!!!!>

" FUGITIVE CONFIG ************************************
set diffopt+=vertical
noremap <Left> :diffget //2<Cr>:diffupdate<Cr>
noremap <Right> :diffget //3<Cr>:diffupdate<Cr>
noremap <Up> u:diffupdate<Cr>
noremap <leader><Up> :set cursorline!<Cr>:set sidescrolloff=100<Cr>:Gdiff<Cr>
noremap <leader><Down> :set cursorline!<Cr>:set sidescrolloff=5<Cr>:diffoff<Cr><C-w>h:q!<Cr><C-w>l:q!<Cr>
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
" <!!!!!!!!**************!!!!!!!!c

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
set switchbuf=useopen
