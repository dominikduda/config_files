" |-----------------------------------------------------------------------------------------|
" | FORMATTING INFO                                                                         |
" |-----------------------------------------------------------------------------------------|
" | Begin of section (preceded with upcased title): ************************************    |
" | End of section: <!!!!!!!!**************!!!!!!!!>                                        |
" | Section description (optional): < sample description >                                  |
" | There should be empty line before and after section                                     |
" | Everything but section begin/end should be indented at least twice                      |
" | Comment should indented 2x less then lines which it is concerning                       |
" |-----------------------------------------------------------------------------------------|

" ENCODING ************************************
    language en_US.UTF-8
    set langmenu=en_US.UTF-8
    set fileencoding=utf-8
" <!!!!!!!!**************!!!!!!!!>

" NOT SURE OR TOO LAZY TO CHECK ************************************
    autocmd QuickFixCmdPost *grep* cwindow
    set switchbuf=useopen
    set ttimeoutlen=0
    set smarttab
    set softtabstop=2
" <!!!!!!!!**************!!!!!!!!>

    " This have to be at the top to work apparently
        let mapleader=" "
    " Enable spell checking
        set spell
    " Start vim with folds unfolded (20 is just sample big-enough number)
        set foldlevel=20
    " Display special_character:as (first is non breaking space)
        set listchars=nbsp:•,tab:↹⇉
    " Enable displaying special characters
        set list
    " Set preview window height to 15 lines (for example fugitive :Gstatus uses it)
        set previewheight=15
    " Do not show mode in the status line (it cleaned last message)
        set noshowmode
    " Display window title in window bar (terminal have to allow it)
        set title
    " Display path to current file in window bar
        set title titlestring=%<%F%=
    " Maximum jump when scrolling horizontally
        set sidescroll=1
    " Always show at least 5 columns on the left/right side of cursor
        set sidescrolloff=5
    " Always show at least 1 line above/below the cursor
        set scrolloff=1
    " Use old regexp engine (on new one tags highlighting was running deadly slow)
        set regexpengine=0
    " AFAIK time to update gitgutter signs
        set updatetime=400
    " Mouse support
        set mouse=a
    " Only redraw when it is needed
        set lazyredraw
    " Sequence timeout
        set timeoutlen=900
    " Show absolute line number in current line
        set number
    " Wrapped line symbol
        set showbreak=▶▶▶
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
    " Text (e. g. comment) break point
        set textwidth=0
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
    " Override the 'ignorecase' option if the search replace contains upper case characters.
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

filetype off
call plug#begin('~/.config/nvim/plug')

    " Posting/updating/opening gists from vim
        Plug 'mattn/gist-vim'
    " gist-vim dependency
        Plug 'mattn/webapi-vim'
    " Add words found in tmux panes to auto completion list
        Plug 'wellle/tmux-complete.vim'
    " Physics based scrolling
        Plug 'yuttie/comfortable-motion.vim'
    " Navigation and information for yaml files (current node path, jump to parent, jump to key)
        Plug 'lmeijvogel/vim-yaml-helper'
    " Indent depth indicators
        Plug 'nathanaelkane/vim-indent-guides'
    " Flash yanked area
        Plug 'haya14busa/vim-operator-flashy'
    " vim-operator-flashy dependency
        Plug 'kana/vim-operator-user'
    " Set different syntax type in part of file (for example SQL embeded in ruby file)
        Plug 'joker1007/vim-ruby-heredoc-syntax'
    " Asynchronous Lint Engine
        Plug 'w0rp/ale'
    " CLIPS syntax
        Plug 'vim-scripts/clips.vim'
    " Color parentheses based on nest depth
        Plug 'kien/rainbow_parentheses.vim'
    " ascii art (useless)
        Plug 'vim-scripts/DrawIt'
    " Support for a lot of languages (syntax, indent and much more)
        Plug 'sheerun/vim-polyglot'
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
    " Repeat plugin commands with .
        Plug 'tpope/vim-repeat'
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
    " Auto add ends, endfuncion, endif
        Plug 'tpope/vim-endwise'
    " Better highlighting for c++
        Plug 'octol/vim-cpp-enhanced-highlight'
    " Auto insert matching brackets
        Plug 'Raimondi/delimitMate'
    " Slim support
        Plug 'slim-template/vim-slim'
    " Easy text align with regexp
        Plug 'godlygeek/tabular'
    " Coffe script support
        Plug 'kchmck/vim-coffee-script'
    " Project wide search
        Plug 'rking/ag.vim'
    " Yank history
        Plug 'Shougo/neoyank.vim'
    " Run tests from inside vim
        Plug 'janko-m/vim-test'
    " Dependency for neoyank (and some more kombajnish unused things), this isn'
        Plug 'Shougo/unite.vim'
    " Haml support
        Plug 'tpope/vim-haml'

" TMUX INTEGRATION ************************************
    " Execute commands from vim in tmux pane easily (mainly for running tests)
        Plug 'benmills/vimux'
    " Treat tmux panes like vim splits
        Plug 'christoomey/vim-tmux-navigator'
    " Tmux focus events integraion (switching between vim pane and other console pane)
        Plug 'tmux-plugins/vim-tmux-focus-events'
    " .tmux.conf syntax highlighting
        Plug 'tmux-plugins/vim-tmux'
" <!!!!!!!!**************!!!!!!!!>

" GENERAL ************************************
    Plug 'dominikduda/vim_current_word'
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
    " Enable 'bundle' in vim and more
        Plug 'tpope/vim-bundler'
    " Add rails-releated shortcuts to vim
        Plug 'tpope/vim-rails'
    " Vim-rails shortcuts everywhere!
        Plug 'tpope/vim-rake'
" <!!!!!!!!**************!!!!!!!!>

" AUTOCOMPLETE AND SNIPPETS ************************************
    " Confrim autocompletion with tab
        Plug 'ervandew/supertab'
    " Snippets for various languages pack
        Plug 'honza/vim-snippets'
    " Snippet engine
        Plug 'SirVer/ultisnips'
    " Dark powered autocompletion ];-|
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Deoplete extension for ruby methods
        Plug 'fishbullet/deoplete-ruby'
    " Deoplete extension (more tag sources)
        Plug 'Shougo/neoinclude.vim'
" <!!!!!!!!**************!!!!!!!!>
"
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

" GIST-VIM CONFIG ************************************
    let g:gist_open_browser_after_post = 1
    let g:gist_show_privates = 1
    let g:gist_post_private = 1
    let g:gist_update_on_write = 1
" <!!!!!!!!**************!!!!!!!!>

" VIM-INDENT-GUIDES CONFIG ************************************
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=242
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=244
    let g:indent_guides_guide_size = 2
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
    let g:indent_guides_default_mapping = 1
" <!!!!!!!!**************!!!!!!!!>

" COMFORTABLE-MOTION CONFIG ************************************
    let g:comfortable_motion_no_default_key_mappings = 1
    nnoremap <silent> <C-e> :call comfortable_motion#flick(40)<CR>
    nnoremap <silent> <C-y> :call comfortable_motion#flick(-40)<CR>
    nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
    nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
" <!!!!!!!!**************!!!!!!!!>

" VIM-MULTIPLE-CURSORS CONFIG ************************************
    " Pressing ESC with multiple cursors will exit visual mode instead of deleting all cursors (so they can be further used)
        let g:multi_cursor_exit_from_visual_mode = 0
" <!!!!!!!!**************!!!!!!!!>

" VIM-YAML-HELPER CONFIG ************************************
    let g:vim_yaml_helper#always_get_root = 1
    let g:vim_yaml_helper#auto_display_path = 1
" <!!!!!!!!**************!!!!!!!!>

" VIM-TRAILING-WHITESPACE CONFIG ************************************
    autocmd BufWritePre * FixWhitespace
" <!!!!!!!!**************!!!!!!!!>

" CLIPS SYNTAX CONFIG ************************************
    autocmd BufReadPost *.clp setlocal ts=8 sts=8 sw=8
" <!!!!!!!!**************!!!!!!!!>

" VIM_CURRENT_WORD CONFIG ************************************
    hi CurrentWord ctermbg=53
    hi CurrentWordTwins ctermbg=237
" <!!!!!!!!**************!!!!!!!!>

" VIM-RUBY-HEREDOC-SYNTAX CONFIG ************************************
    " Change syntax highlighter from 'ruby' to 'SQL' between 'END_OF_SQL' heredoc
        let g:ruby_heredoc_syntax_filetypes = {
                \ "sql" : {
                \   "start" : "END_OF_SQL",
                \},
        \}
" <!!!!!!!!**************!!!!!!!!>

" VIM-OPERATOR-FLASHY CONFIG ************************************
    highlight Flashy ctermbg=255 cterm=NONE
    map y <Plug>(operator-flashy)
    nmap Y <Plug>(operator-flashy)$
" <!!!!!!!!**************!!!!!!!!>

" VIM-TMUX-NAVIGATOR CONFIG ************************************
    " Disable tmux navigator when zooming the vim pane
        let g:tmux_navigator_disable_when_zoomed = 1
    let g:tmux_navigator_no_mappings = 1
    noremap <silent> <A-h> :TmuxNavigateLeft<CR>
    noremap <silent> <A-j> :TmuxNavigateDown<CR>
    noremap <silent> <A-k> :TmuxNavigateUp<CR>
    noremap <silent> <A-l> :TmuxNavigateRight<CR>
" <!!!!!!!!**************!!!!!!!!>

" VIM-EXPAND-REGION CONFIG ************************************
    " Press v in visual mode to expand region (first press will select word which cursor is currently on)
        vmap v <Plug>(expand_region_expand)
" <!!!!!!!!**************!!!!!!!!>

" ALE CONFIG ************************************
    autocmd InsertLeave * ALELint
    let g:ale_set_highlights = 0
    let g:ale_sign_error = 'X➜'
    let g:ale_sign_warning = '!➜'
    let g:ale_lint_delay = 400
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed =  1
    " Jump betwen lint errors
        nmap <silent> [l <Plug>(ale_previous_wrap)
        nmap <silent> ]l <Plug>(ale_next_wrap)
" <!!!!!!!!**************!!!!!!!!>

" RAINBOW-PARENTHESES CONFIG ************************************
    au VimEnter * RainbowParenthesesActivate
    au BufReadPost * RainbowParenthesesLoadRound
    au BufReadPost * RainbowParenthesesLoadSquare
    au BufReadPost * RainbowParenthesesLoadBraces
    let g:rbpt_colorpairs = [
                          \ ['129', 'RoyalBlue3'],
                          \ ['32', 'RoyalBlue3'],
                          \ ['118', 'firebrick3'],
                          \ ['226', 'RoyalBlue3'],
                          \ ['202', 'DarkOrchid3'],
                          \ ['160', 'DarkOrchid3'],
                          \ ['129', 'RoyalBlue3'],
                          \ ['32', 'RoyalBlue3'],
                          \ ['118', 'firebrick3'],
                          \ ['226', 'RoyalBlue3'],
                          \ ['202', 'DarkOrchid3'],
                          \ ['160', 'DarkOrchid3'],
                          \ ['129', 'RoyalBlue3'],
                          \ ['32', 'RoyalBlue3'],
                          \ ['118', 'firebrick3'],
                          \ ['226', 'RoyalBlue3'],
                          \ ['202', 'DarkOrchid3'],
                          \ ['160', 'DarkOrchid3'],
                          \ ]
    let g:rbpt_max = 18
" <!!!!!!!!**************!!!!!!!!>

" CLEVER-F CONFIG ************************************
    let g:clever_f_ignore_case = 1
" <!!!!!!!!**************!!!!!!!!>

" NEOYANK CONFIG ************************************
    nnoremap <leader>2 :Unite history/yank -default-action=append<Cr>
" <!!!!!!!!**************!!!!!!!!>

" SUPERTAB CONFIG ************************************
    let g:SuperTabDefaultCompletionType = "<c-n>"
" <!!!!!!!!**************!!!!!!!!>

" NEOTAGS CONFIG ************************************
    let g:neotags_ctags_bin = '/home/dominikduda/github/ctags/ctags'
    let g:neotags_ctags_args = [
                \ '--recurse=yes',
                \ '--sort=yes',
                \ '--fields=+l',
                \ '--c-kinds=+p',
                \ '--c++-kinds=+p',
                \ '--extras=+q'
                \ ]
    let g:neotags_enabled = 1
    let g:neotags_highlight = 0
    let g:neotags_file = './tags'
    let g:neotags_recursive = 1
    let g:neotags_events_update = ['BufWritePost']
" <!!!!!!!!**************!!!!!!!!>

" DEOPLETE CONFIG ************************************
    let deoplete#tag#cache_limit_size = 50000000
    let g:deoplete#auto_complete_delay=2
    let g:deoplete#enable_ignore_case = 0
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#auto_refresh_delay = 2
    let g:deoplete#max_abbr_width = 0
    let g:deoplete#max_menu_width = 0
    imap <c-j> <Tab>
    imap <c-k> <S-Tab>
" <!!!!!!!!**************!!!!!!!!>

" ULTISNIPS CONFIG ************************************
    " Better key bindings for UltiSnipsExpandTrigger
        let g:UltiSnipsExpandTrigger = "<C-e>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" <!!!!!!!!**************!!!!!!!!>

" LIVEDOWN CONFIG ************************************
    " The system command to launch a browser
        let g:livedown_browser = 'google-chrome'
    " Should the browser window pop-up upon previewing
        let g:livedown_open = 1
" <!!!!!!!!**************!!!!!!!!>

" AIRLINE CONFIG ************************************
    " Caused errors after one of updates
        let g:airline#extensions#tagbar#enabled = 0
    let g:airline#extensions#hunks#enabled = 0
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#branch#format = 2
    let g:airline#extensions#branch#displayed_head_limit = 15
    set fillchars+=stl:\ ,stlnc:\
    let g:airline_powerline_fonts = 1
    let g:airline_theme='base16_summerfruit'
" <!!!!!!!!**************!!!!!!!!>

" CTRLP CONFIG ************************************
    let g:ctrlp_max_files = 0
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    map <C-l> :CtrlPMRU<CR>
    " Speed fixes http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
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
" <!!!!!!!!**************!!!!!!!!>

" NERDTREE CONFIG ************************************
    let g:NERDTreeWinSize = 36
    " Close vim if only NERDTree is opened
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " NerdTree toggle
        nmap <leader>1 :NERDTreeToggle<CR>
    noremap <leader>f :NERDTreeFind<CR>zz
" <!!!!!!!!**************!!!!!!!!>

" TAGBAR CONFIG ************************************
    nmap <leader>3 :TagbarToggle<CR>
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
    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1
    let g:gitgutter_async = 1
" <!!!!!!!!**************!!!!!!!!>

" AG.VIM CONFIG ************************************
    let g:ag_highlight=1
    " Search projectwide
        nnoremap , :Ag!<Space>-Q<Space>''<Left>
    " Search selected text project wide (+ possibility to pass path)
        vnoremap , y:Ag!<Space>-Q<Space>'<C-r>"'<Space>
    let g:ag_apply_qmappings=0
" <!!!!!!!!**************!!!!!!!!>

" VIM-TEST CONFIG ************************************
    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    nmap <silent> <leader>a :TestSuite<CR>
    nmap <silent> <leader>l :TestLast<CR>
    nmap <silent> <leader>g :TestVisit<CR>
    let test#strategy = 'vimux'
" <!!!!!!!!**************!!!!!!!!>

" FUGITIVE CONFIG ************************************
    set diffopt+=vertical
    noremap <Left> :diffget //2<Cr>:diffupdate<Cr>
    noremap <Right> :diffget //3<Cr>:diffupdate<Cr>
    noremap <Up> u:diffupdate<Cr>
    noremap <leader><Up> :set cursorline!<Cr>:set sidescrolloff=100<Cr>:Gdiff<Cr>/HEAD<Cr>zz
    noremap <leader><Down> :set cursorline!<Cr>:set sidescrolloff=5<Cr>:diffoff<Cr><C-w>h:q!<Cr><C-w>l:q!<Cr>:w<Cr>
" <!!!!!!!!**************!!!!!!!!>

" AB SPECIFIC ************************************
    let g:test#runner_commands = ['Rspec']
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
    " Color 200th column
        set colorcolumn=200
" <!!!!!!!!**************!!!!!!!!>

" PERSONAL CONFIG AND SHORTCUTS ************************************
    " Show highlight source by pressing F10
        map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
    " ctrl + j/k to move line
        nmap <C-k> ddkP
        nmap <C-j> ddp
    nnoremap ; :
    inoremap <C-l> <End>
    inoremap kk <Right>
    inoremap jj <Esc>
    " Copy to system clipboard
        vnoremap <C-c> "+y
    " Paste form system clipboard
        noremap <C-v> "+P
    " Replace currently selected text with one from clipboard
        vnoremap <C-v> x"+P
        inoremap <C-v> <Esc>"+pa
    " Change current line color when entering/leaving insert mode
        autocmd InsertEnter * highlight  CursorLine ctermbg=52
        autocmd InsertLeave * highlight  CursorLine ctermbg=235
    " Change current line number color when entering/leaving insert mode
        autocmd InsertEnter * highlight  CursorLineNR ctermbg=124
        autocmd InsertLeave * highlight  CursorLineNR ctermbg=246
    " Check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
        set autoread
        au CursorHold * checktime
    " Toggle Undotree window
        nnoremap <F5> :UndotreeToggle<CR>
    " Use { to connect next line to current
        nnoremap { J
    " Use J and K to jump between paragraphs in visual, normal, during yank and delete
        noremap J }
        noremap K {
        nmap yJ y}
        nmap yK y{
        nmap dJ d}
        nmap dK d{
        vmap J }
        vmap K {
    " Use H and L to jump to beginning and end of line in normal, visual, during yank and delete
        nmap H ^
        nmap L $
        nmap yL y$
        nmap yH y^
        nmap dL d$
        nmap dH d^
        vmap H ^
        vmap L $
    " Resize buffer on ctrl + alt + direction
        nnoremap <A-C-h> :vertical resize +1<CR>
        nnoremap <A-C-j> :resize -1<CR>
        nnoremap <A-C-k> :resize +1<CR>
        nnoremap <A-C-l> :vertical resize -1<CR>
    " Move vertically by rows rather than lines, useful with long lines + wrap on
        nnoremap j gj
        nnoremap k gk
    " Move vertically by lines rather than rows in quickfix window
        autocmd BufReadPost quickfix nnoremap <buffer> j j
        autocmd BufReadPost quickfix nnoremap <buffer> k k
    " Center screen on next/previous selection.
        nnoremap n nzz
        nnoremap N Nzz
    " Move preview window to full width row at bottom when opened
        au BufEnter ?* call PreviewHeightWorkAround()
        func! PreviewHeightWorkAround()
          if &previewwindow
            exec 'wincmd J'
            exec 'setlocal winheight='.&previewheight
          endif
        endfunc
    " Save all files when nvim looses focus (ignores unnamed buffers warnings)
        autocmd FocusLost * silent! wa
    " Copy path to current file to clipboard (starting from root of the project)
        nmap <silent> cp :let @+ = expand("%")<CR>:echom('Current file path copied to clipboard')<CR>
    " Exit copy mode
        vnoremap q <Esc>
    " Replace selected phrace globally in file
        vnoremap R y:%s/<C-r>"//gc<Left><Left><Left>
    " Function and corresponding command to update plugins with fix_vim_syntax_files.sh ran pre and post
      function! s:update_plugins()
        :! fix_vim_syntax_files.sh
        :PlugUpdate
        :echom 'blocked for 10 seconds'
        exec input('Press Enter when update is finished')
        :! fix_vim_syntax_files.sh
      endfunction
      command! UpdatePlugins call s:update_plugins()
" <!!!!!!!!**************!!!!!!!!>
