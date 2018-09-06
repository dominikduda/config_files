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

    " Does not break hard/symbolic links on file save
        set backupcopy=yes
    " Disable shape-changing cursor (underline, bar)
        set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
    " Custom spell file (use :mkspell! % in the file to reload)
        set spellfile=~/.config/nvim/spell/techspeak.utf-8.add
    " Saves file automatically on most needed events
        set autowrite
    " One of the things which prevents line from auto-breaking at certain length in insert mode
        set formatoptions-=t
    " This have to be at the top to work apparently
        let mapleader=" "
    " Enable spell checking
        " set spell
    " Start vim with folds unfolded (20 is just sample big-enough number)
        set foldlevel=20
    " Display special_character:as (first is non breaking space)
        set listchars=nbsp:•,tab:⎔➤
    " Enable displaying special characters
        set list
    " Set preview window height to 15 lines (for example fugitive :Gstatus uses it)
        set previewheight=15
    " Do not show mode in the status line (it cleaned last message)
        set noshowmode
    " Display window title in window bar (terminal have to allow it)
        set title
    " Display path to current file in window bar
        set titlestring=%<%F%=
    " Maximum jump when scrolling horizontally
        set sidescroll=1
    " Always show at least 5 columns on the left/right side of cursor
        set sidescrolloff=5
    " Always show at least 1 line above/below the cursor
        set scrolloff=1
    " Use old regexp engine (on new one tags highlighting was running deadly slow)
        set regexpengine=0
    " AFAIK time to update gitgutter signs
        set updatetime=200
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
    " Text (e. g. comment) break point (simply big-enough number)
        set textwidth=2000
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
    " Play sound on keypress and enter (ala typewriter)
        Plug 'skywind3000/vim-keysound'
    " * and # from visual
        Plug 'haya14busa/vim-asterisk'
    " Show nth out of x inc search results message
        Plug 'osyo-manga/vim-anzu'
    " Matching parens/tags features
        Plug 'andymass/vim-matchup'
    " Automatically close html/xhtml tags
        Plug 'alvan/vim-closetag'
    " Split/join multiline entities (blocks, ifs, method invocations)
        Plug 'AndrewRadev/splitjoin.vim', { 'branch': 'master' }
    " Lot of new text objects, adds cin(, da, and more
        Plug 'wellle/targets.vim'
    " Convert betwen snake/camel/mixed/... case, :Subvert command, replacing many combinations of word
        Plug 'tpope/tpope-vim-abolish'
    " Add indent text object
        Plug 'michaeljsmith/vim-indent-object'
    " Autoformat code using linter
        Plug 'sbdchd/neoformat'
    " todo-list management
        Plug 'rlue/vim-getting-things-down'
    " Posting/updating/opening gists from vim
        Plug 'mattn/gist-vim'
    " Gist-vim dependency
        Plug 'mattn/webapi-vim'
    " Navigation and information for yaml files (current node path, jump to parent, jump to key)
        Plug 'lmeijvogel/vim-yaml-helper'
    " Indent depth indicators
        Plug 'nathanaelkane/vim-indent-guides'
    " Flash yanked area
        Plug 'haya14busa/vim-operator-flashy'
    " Vim-operator-flashy dependency
        Plug 'kana/vim-operator-user'
    " Asynchronous lint engine
        Plug 'w0rp/ale'
    " Color parentheses based on nest depth
        Plug 'kien/rainbow_parentheses.vim'
    " Live markdown preview
        Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
    " Enable 'Rvm use' in vim
        Plug 'tpope/vim-rvm'
    " Comments
        Plug 'scrooloose/nerdcommenter'
    " Undo history tree
        Plug 'mbbill/undotree'
    " Change ruby blocks between do end and { }
        Plug 'jgdavey/vim-blockle'
    " Repeat plugin commands with .
        Plug 'tpope/vim-repeat'
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
    " Open files from nerd tree with default application for file extension (e. g. images)
        Plug 'ivalkeen/nerdtree-execute'

" JS UTILS ************************************
    " Backbone support
        Plug 'mklabs/vim-backbone'
    " To defintion/import movement
        Plug 'moll/vim-node'
    " Numbered console logs, current selection to labeled debug string
        Plug 'bergercookie/vim-debugstring'
    " Fix all imports
        Plug 'Galooshi/vim-import-js', { 'do': 'npm install -g import-js@3.0.0' }
    " GraphQL syntax and indent
        Plug 'jparise/vim-graphql'
" <!!!!!!!!**************!!!!!!!!>

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
    " Signed bookmarks persisting over vim quit
        Plug 'MattesGroeger/vim-bookmarks'
    " Graphical indicator of current line relation to file length
        Plug 'drzel/vim-line-no-indicator'
    Plug 'dominikduda/vim_current_word'
    Plug 'xolox/vim-misc'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'majutsushi/tagbar'
" <!!!!!!!!**************!!!!!!!!>

" SYNTAX ************************************
    " Set different syntax type in part of file (for example SQL embeded in ruby file)
        Plug 'joker1007/vim-ruby-heredoc-syntax'
    " CLIPS syntax
        Plug 'vim-scripts/clips.vim'
    " Support for a lot of languages (syntax, indent and much more)
        Plug 'sheerun/vim-polyglot', { 'do': 'rm ~/.config/nvim/plug/vim-polyglot/after/indent/jsx.vim' }
    " jsx syntax
        Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
        Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" <!!!!!!!!**************!!!!!!!!>

" GIT INTEGRATION ************************************
      Plug 'airblade/vim-gitgutter'
      Plug 'tpope/vim-fugitive'
      " Extension to vim-fugitive open files on github and more
          Plug 'tpope/vim-rhubarb'
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
    " Add words found in tmux panes to auto completion list
        Plug 'wellle/tmux-complete.vim'
    " Port of Damians snippets for VScode
        Plug 'dominikduda/vim_es7_javascript_react_snippets'
    " Intelligent js complete source
        Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
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
call plug#end()
filetype plugin indent on

" NOT SURE OR TOO LAZY TO CHECK ************************************
    set wildignore+=*/tmp/*,*.so,*.swp,*.zipo
    set omnifunc=syntaxcomplete#Complete
    set t_Co=256
    colorscheme dante_modified
" <!!!!!!!!**************!!!!!!!!>

" VIM-BOOKMARKS CONFIG ************************************
  let g:bookmark_center = 1
  let g:bookmark_save_per_working_dir = 0
  let g:bookmark_manage_per_buffer = 0
  " Unmap default mappings when entering nerd tree and map when entering other buffer
      function! BookmarkMapKeys()
          nmap mm :BookmarkToggle<CR>
          nmap mi :BookmarkAnnotate<CR>
          nmap mn :BookmarkNext<CR>
          nmap mp :BookmarkPrev<CR>
          nmap ma :BookmarkShowAll<CR>
          nmap mc :BookmarkClear<CR>
          nmap mx :BookmarkClearAll<CR>
          nmap mkk :BookmarkMoveUp
          nmap mjj :BookmarkMoveDown
      endfunction
      function! BookmarkUnmapKeys()
          unmap mm
          unmap mi
          unmap mn
          unmap mp
          unmap ma
          unmap mc
          unmap mx
          unmap mkk
          unmap mjj
      endfunction
      autocmd BufEnter * :call BookmarkMapKeys()
      autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
" <!!!!!!!!**************!!!!!!!!>

" VIM-LINE-NO-INDICATOR CONFIG ************************************
    let g:line_no_indicator_chars = [
        \ '   ', '▏  ', '▎  ', '▍  ', '▌  ',
        \ '▋  ', '▊  ', '▉  ', '█  ', '█▏ ',
        \ '█▎ ', '█▍ ', '█▌ ', '█▋ ', '█▊ ',
        \ '█▉ ', '██ ', '██▏', '██▎', '██▍',
        \ '██▌', '██▋', '██▊', '██▉', '███'
        \ ]
" <!!!!!!!!**************!!!!!!!!>

" DEOPLETE-TERNJS CONFIG ************************************
    " Remove .tern-port on vim start if exists (echos never worked)
        function! TernPrep()
            if !empty(glob(join([getcwd(), ".tern-port"], "/")))
                echo ".tern-port exists, deleting with result:"
                echo delete(fnameescape(join([getcwd(), ".tern-port"], "/"))) == 0 ? "Success" : "Fail"
            endif
        endfunction
        autocmd VimEnter * :call TernPrep()
    let g:deoplete#sources#ternjs#filetypes = [
        \ 'jsx',
        \ 'javascript',
        \ 'html',
        \ 'css',
        \ 'coffe',
        \ 'eruby',
        \ 'javascript.jsx',
        \ 'vue',
        \ ]
" <!!!!!!!!**************!!!!!!!!>

" VIM-ASTERISK CONFIG ************************************
    vmap * <Plug>(asterisk-g*)
    vmap # <Plug>(asterisk-g#)
" <!!!!!!!!**************!!!!!!!!>

" VIM-ANZU CONFIG ************************************
    nmap <silent> * <Plug>(anzu-star-with-echo)zz:set cursorcolumn<CR><Plug>(anzu-echo-search-status)
    nmap <silent> # <Plug>(anzu-sharp-with-echo)zz:set cursorcolumn<CR><Plug>(anzu-echo-search-status)
    let g:airline#extensions#anzu#enabled = 0
    let g:anzu_status_format = "%#Search#▶%p◀ (%i/%l)"
    nmap <silent> N <Plug>(anzu-N-with-echo)zz:set cursorcolumn<CR><Plug>(anzu-echo-search-status)
    nmap <silent> n <Plug>(anzu-n-with-echo)zz:set cursorcolumn<CR><Plug>(anzu-echo-search-status)
    autocmd CursorMoved,CursorHold,InsertEnter * set nocursorcolumn
" <!!!!!!!!**************!!!!!!!!>

" VIM-MATCHUP CONFIG ************************************
    " don't recognize anything in comments
        let g:matchup_delim_noskips = 2
    let g:matchup_matchparen_deferred = 1
    let g:matchup_matchparen_deferred_show_delay = 250
    let g:matchup_matchparen_deferred_hide_delay = 750
    let g:matchup_matchparen_hi_surround_always = 1
    let g:matchup_matchparen_timeout = 500
    let g:matchup_matchparen_insert_timeout = 1000
    highlight MatchWord ctermbg=NONE ctermfg=226 cterm=bold
    highlight MatchParen ctermbg=NONE ctermfg=226 cterm=bold,underline
    highlight MatchParenCur ctermbg=NONE ctermfg=226 cterm=bold,underline
" <!!!!!!!!**************!!!!!!!!>

" SPLITJOIN.VIM CONFIG ************************************
    let g:splitjoin_ruby_curly_braces = 0
    let g:splitjoin_ruby_hanging_args = 0
    let g:splitjoin_split_mapping = ''
    let g:splitjoin_join_mapping = ''
    nmap <Leader>j :SplitjoinJoin<cr>
    nmap <Leader>s :SplitjoinSplit<cr>
" <!!!!!!!!**************!!!!!!!!>

" VIM-GUTENTAGS CONFIG ************************************
    let g:gutentags_ctags_exclude = [
        \ "node_modules",
        \ ".git"
        \ ]
" <!!!!!!!!**************!!!!!!!!>

" VIM-GETTING-THINGS-DOWN CONFIG ************************************
    let g:gtdown_cycle_states = ['TODO', 'WIP', 'DONE', 'WAIT', 'CANCELLED']
    let g:gtdown_default_fold_level = 2222
    let g:gtdown_show_progress = 1
    let g:gtdown_fold_list_items = 0
    command! TODO :call getting_things_down#show_todo()
    augroup gtDown
        " Cycle through TODO keywords
            autocmd BufReadPre TODO.md nmap <buffer> <silent> <leader>s :call getting_things_down#cycle_status()<CR>
        " Toggle TODO tasks
            autocmd BufReadPre TODO.md nnoremap <buffer> <silent> <leader>t :call getting_things_down#toggle_task()<CR>
            autocmd BufReadPre TODO.md vnoremap <buffer> <silent> <leader>t :call getting_things_down#toggle_task()<CR>
        " Change default task colors
            autocmd BufReadPre TODO.md hi! markdownTodoReadyN ctermfg=227
            autocmd BufReadPre TODO.md hi! markdownTodoDoneN ctermfg=40
            autocmd BufReadPre TODO.md hi! markdownTodoWaitingN ctermfg=160
    augroup END
" <!!!!!!!!**************!!!!!!!!>

" VIM-POLYGLOT CONFIG ************************************
    " Javascript syntax higlighter breaks rainbow_parentheses.vim - using alternative
        " let g:polyglot_disabled = ['javascript', 'javascript.jsx', 'markdown', 'yaml']
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
    let g:indent_guides_default_mapping = 0
" <!!!!!!!!**************!!!!!!!!>

" VIM-MULTIPLE-CURSORS CONFIG ************************************
    " Pressing ESC with multiple cursors will exit visual mode instead of deleting all cursors (so they can be further used)
        let g:multi_cursor_exit_from_visual_mode = 0
" <!!!!!!!!**************!!!!!!!!>

" VIM-YAML-HELPER CONFIG ************************************
    let g:vim_yaml_helper#always_get_root = 1
    let g:vim_yaml_helper#auto_display_path = 0
    autocmd! CursorMoved *.yml YamlDisplayFullPath
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
    highlight Flashy ctermbg=NONE cterm=reverse
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

" VIM-KEYSOUND CONFIG ************************************
  let g:keysound_enable = 1
  let g:keysound_theme = 'typewriter'
" <!!!!!!!!**************!!!!!!!!>

" VIM-DEBUGSTRING CONFIG ************************************
    vnoremap <Leader>ds y:AddDebugStringExpr('<C-r>"')<Enter>==
" <!!!!!!!!**************!!!!!!!!>

" VIM-EXPAND-REGION CONFIG ************************************
    " Press v in visual mode to expand region (first press will select word which cursor is currently on)
        vmap v <Plug>(expand_region_expand)
" <!!!!!!!!**************!!!!!!!!>

" ALE CONFIG ************************************
    let g:ale_fixers = {}
    let g:ale_fixers['javascript'] = ['eslint']
    let g:ale_fixers['javascript.jsx'] = ['eslint']
    highlight link ALEStyleErrorSign todo
    let g:ale_type_map = {'eslint': {'E': 'ES'}}
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    autocmd InsertLeave * ALELint
    let g:ale_set_highlights = 0
    let g:ale_sign_error = 'X➜'
    let g:ale_sign_warning = '!➜'
    let g:ale_sign_style_error = 'S➜'
    let g:ale_lint_delay = 400
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed =  1
    " Jump betwen lint errors
        nmap <silent> [l <Plug>(ale_previous_wrap)
        nmap <silent> ]l <Plug>(ale_next_wrap)
" <!!!!!!!!**************!!!!!!!!>

" RAINBOW-PARENTHESES CONFIG ************************************
    autocmd VimEnter * RainbowParenthesesActivate
    autocmd BufReadPost * RainbowParenthesesLoadRound
    autocmd BufReadPost * RainbowParenthesesLoadSquare
    autocmd BufReadPost * RainbowParenthesesLoadBraces
    autocmd BufReadPost *.js RainbowParenthesesToggleAll
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
                          \ ['129', 'RoyalBlue3'],
                          \ ['32', 'RoyalBlue3'],
                          \ ['118', 'firebrick3'],
                          \ ['226', 'RoyalBlue3'],
                          \ ['202', 'DarkOrchid3'],
                          \ ['160', 'DarkOrchid3'],
                          \ ]
    let g:rbpt_max = 24
" <!!!!!!!!**************!!!!!!!!>

" NERDCOMMENTER CONFIG ************************************
    let g:NERDCreateDefaultMappings = 0
    let g:NERDSpaceDelims = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }
    nmap gcc <plug>NERDCommenterToggle
    nmap gcj <plug>NERDCommenterAltDelims<plug>NERDCommenterToggle<plug>NERDCommenterAltDelims
    vmap gcc <plug>NERDCommenterToggle
    vmap gcj <Esc><plug>NERDCommenterAltDelimsgv<plug>NERDCommenterToggle<plug>NERDCommenterAltDelims
" <!!!!!!!!**************!!!!!!!!>

" CLEVER-F CONFIG ************************************
    let g:clever_f_ignore_case = 1
" <!!!!!!!!**************!!!!!!!!>

" NEOYANK CONFIG ************************************
    nnoremap <leader>2 :Unite history/yank -default-action=append<Cr>
" <!!!!!!!!**************!!!!!!!!>
"
" SUPERTAB CONFIG ************************************
    let g:SuperTabDefaultCompletionType = "<c-n>"
" <!!!!!!!!**************!!!!!!!!>

" DEOPLETE CONFIG ************************************
    let g:deoplete#auto_complete_start_length = 1
    let deoplete#tag#cache_limit_size = 50000000
    let g:deoplete#auto_complete_delay = 2
    let g:deoplete#enable_ignore_case = 0
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_at_startup = 1
    " let g:deoplete#enable_refresh_always = 1
    let g:deoplete#enable_refresh_always = 0
    let g:deoplete#auto_refresh_delay = 1
    let g:deoplete#max_abbr_width = 0
    let g:deoplete#max_menu_width = 0
    let g:deoplete#max_list = 50
    imap <C-j> <Tab>
    imap <C-k> <S-Tab>
" <!!!!!!!!**************!!!!!!!!>

" ULTISNIPS CONFIG ************************************
    " Add html snippets to js files (needed e. g. in react)
        autocmd FileType javascript UltiSnipsAddFiletypes html
    " Better key bindings for UltiSnipsExpandTrigger
        let g:UltiSnipsExpandTrigger = "<C-e>"
        let g:UltiSnipsJumpForwardTrigger = "<C-e>"
        let g:UltiSnipsJumpBackwardTrigger = "<C-h>"
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
    let g:airline_theme='wombat'
    let g:airline_section_z = '0 %#__accent_bold#%{LineNoIndicator()}▏%#__restore__#%L  ➜▌%2c'
" <!!!!!!!!**************!!!!!!!!>

" CTRLP CONFIG ************************************
    " '>' signs in beginning of line
        hi! CtrlPLinePre ctermfg=240
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
    " Show only files from current working dir in mru mode
        let g:ctrlp_mruf_relative = 1
        let g:ctrlp_mruf_exclude = '\.git/.*'
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
    let NERDTreeMinimalUI = 1
    let NERDTreeStatusline=""
    autocmd BufEnter NERD_tree_* setlocal signcolumn=no
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
    set signcolumn=yes
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

" VIMUX CONFIG ************************************
    let g:vimuxUseNearestPane = 0
" <!!!!!!!!**************!!!!!!!!>

" FUGITIVE CONFIG ************************************
    autocmd FileType gitcommit setlocal colorcolumn=72
    set diffopt+=vertical
    noremap <Left> :diffget //2<Cr>:diffupdate<Cr>
    noremap <Right> :diffget //3<Cr>:diffupdate<Cr>
    noremap <Up> u:diffupdate<Cr>
    noremap <leader><Up> :set cursorline!<Cr>:set sidescrolloff=100<Cr>:Gdiff<Cr>/HEAD<Cr>zz
    noremap <leader><Down> :set cursorline!<Cr>:set sidescrolloff=5<Cr>:diffoff<Cr><C-w>h:q!<Cr><C-w>l:q!<Cr>:w<Cr>
" <!!!!!!!!**************!!!!!!!!>

" VIM-CLOSETAG CONFIG ************************************
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
" <!!!!!!!!**************!!!!!!!!>

" PROJECT SPECIFIC ************************************
    if $CURRENT_PROJECT_NAME == 'CATALYST'
        autocmd FileType javascript setlocal colorcolumn=101
        autocmd FileType javascript.jsx setlocal colorcolumn=101
        let g:deoplete#enable_ignore_case = 1
        " Search projectwide
            nnoremap , :Ag!<Space>-Q<Space>--ignore node_modules<Space>''<Left>
        " Search selected text project wide (+ possibility to pass path)
            vnoremap , y:Ag!<Space>-Q<Space>--ignore node_modules<Space>'<C-r>"'<Space>
        let g:ale_linters = {
        \   'javascript': ['eslint'],
        \}
        let g:rbpt_max = 0
        " Custom test command for javascript in MD
          autocmd BufRead,BufNewFile *.js nmap <buffer> <leader>t cp:VimuxRunCommand('clear; echo -e npm run test -- --cf <C-r>+; npm run test -- --cf <C-r>+')<Cr>
        let g:gutentags_ctags_exclude = [
            \ "node_modules",
            \ ".git",
            \ "client/package.json",
            \ "client/package-lock.json",
            \ "client/coverage",
            \ "public"
            \ ]
    endif
" <!!!!!!!!**************!!!!!!!!>

" PERSONAL CONFIG AND SHORTCUTS ************************************
    " Show highlight source by pressing F10
        map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
    " ctrl + j/k to move line
        noremap <C-k> ddkP
        noremap <C-j> ddp
    nnoremap ; :
    inoremap <C-l> <End>
    inoremap kk <Right>
    inoremap <A-j> <Esc>
      " Copy to system clipboard
          vnoremap <C-c> "+y
      " Paste form system Crlipboard
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
          autocmd CursorHold * checktime
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
          nnoremap <A-C-h> :vertical resize +4<CR>
          nnoremap <A-C-j> :resize -4<CR>
          nnoremap <A-C-k> :resize +4<CR>
          nnoremap <A-C-l> :vertical resize -4<CR>
      " Move vertically by rows rather than lines, useful with long lines + wrap on
          nnoremap j gj
          nnoremap k gk
      " Move vertically by lines rather than rows in quickfix window
          autocmd BufReadPost quickfix nnoremap <buffer> j j
          autocmd BufReadPost quickfix nnoremap <buffer> k k
      " Move preview window to full width row at bottom when opened
          autocmd BufEnter ?* call PreviewHeightWorkAround()
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
      " Replace selected phrase globally in file
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
      " Keep cursor position after yanking in visual mode
          vmap y ygv<Esc>
      " Index of tmux pane to run tests in
          let g:VimuxRunnerIndex = $VIMUX_RUNNER_PANE_INDEX
      " Take most characters literally in incsearch
          map / /\V
          map ? ?\V
      " Search react component usages
          noremap <leader>u lbvey:Ag! --ignore node_modules --ignore tests '<<C-r>0\b'<CR>
      " Jumps to definition of javascript thing under cursor and persists current inc search value
          noremap gd :let @t = @/<CR>*ggn$hgfggn:let @/ = @t<CR>
      " Flash window if changed from another vim one
          function! SiemanoFlash()
            2match IncSearch /./
            redraw
            sleep 10m
            2match none
          endfunction
          autocmd WinEnter * call SiemanoFlash()
" <!!!!!!!!**************!!!!!!!!>

" TODO: use this to temporairly disable some plugins
  " Called Called once right before you start selecting multiple cursors
  " function! Multiple_cursors_before()
  "   if exists(':NeoCompleteLock')==2
  "     exe 'NeoCompleteLock'
  "   endif
  " endfunction

  " Called once only when the multiple selection is canceled (default <Esc>)
  " function! Multiple_cursors_after()
  "   if exists(':NeoCompleteUnlock')==2
  "     exe 'NeoCompleteUnlock'
  "   endif
  " endfunction
