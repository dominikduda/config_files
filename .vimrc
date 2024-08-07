" |-----------------------------------------------------------------------------------------|
" | FORMATTING INFO                                                                         |
" |-----------------------------------------------------------------------------------------|
" | Begin of section (preceded with upcased title): ************************************    |
" | End of section: <!!!!!!!!**************!!!!!!!!>                                        |
" | Section description (optional): < sample description >                                  |
" | There should be empty line before and after section                                     |
" | Everything but section begin/end should be indented at least twice                      |
" | should indented less then lines which it is concerning                                  |
" |-----------------------------------------------------------------------------------------|

" ENCODING ************************************
    language en_US.UTF-8
    set langmenu=en_US.UTF-8
    set fileencoding=utf-8
" <!!!!!!!!**************!!!!!!!!>

  " NOT SURE OR TOO LAZY TO CHECK ************************************
    set switchbuf=useopen
    set ttimeoutlen=0
    set softtabstop=2
" <!!!!!!!!**************!!!!!!!!>

    " Does not break hard/symbolic links on file save
        set backupcopy=yes
    " Disable shape-changing cursor (underline, bar)
        set guicursor=n-v-c-sm:block,i-ci-ve:ver10,r-cr-o:ver10
    " Custom spell file (use :mkspell! % in the file to reload)
        " set spellfile=~/.config/nvim/spell/techspeak.utf-8.add
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
    " Enable displaying special characters
        set list
    " Set preview window height to 15 lines (for example fugitive :Gstatus uses it)
        set previewheight=24
    " Do not show mode in the status line (it cleaned last message)
        set noshowmode
    " Display window title in window bar (terminal have to allow it)
        set title
    " Display path to current file in window bar
        set titlestring=%<%F%=
    " Maximum jump when scrolling horizontally
        set sidescroll=1
    " Always show at least 5 columns on the left/right side of cursor
        set sidescrolloff=0
    " Always show at least 1 line above/below the cursor
        set scrolloff=9
    " Use old regexp engine (on new one tags highlighting was running deadly slow)
        " set regexpengine=0
        " set regexpengine=1
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
        set showbreak=↳
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
    " Color 100th column
        set colorcolumn=100
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
    Plug 'kevinhwang91/rnvimr', { 'branch': 'main' }
    Plug 'dstein64/nvim-scrollview',  { 'branch': 'main' }
    Plug 'Yggdroot/indentLine'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'jamespwilliams/bat.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'JazzCore/ctrlp-cmatcher'
    Plug 'jasoncodes/ctrlp-modified.vim'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'dunckr/js_alternate.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'wellle/context.vim'
    Plug 'dominikduda/vim_timebox'

    " Go to snapshot command provider
        Plug 'tapayne88/vim-jest-snapshot'
    " Spell checker
        Plug 'kamykn/spelunker.vim'
    " Additional window movements
        Plug 'andymass/vim-tradewinds'
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
        Plug 'mattn/vim-gist'
    " Gist-vim dependency
        Plug 'mattn/webapi-vim'
    " Navigation and information for yaml files (current node path, jump to parent, jump to key)
        Plug 'lmeijvogel/vim-yaml-helper'
    " Flash yanked area
        Plug 'haya14busa/vim-operator-flashy'
    " Vim-operator-flashy dependency
        Plug 'kana/vim-operator-user'
    " Asynchronous lint engine
        Plug 'w0rp/ale'
    " Color parentheses based on nest depth
        Plug 'kien/rainbow_parentheses.vim'
    " Live markdown preview
        Plug 'shime/vim-livedown'
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

" R support ************************************
    Plug 'jalvesaq/Nvim-R'
    Plug 'gaalcaras/ncm-R'
" <!!!!!!!!**************!!!!!!!!>

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
        Plug 'dominikduda/vimux', { 'branch': 'master' }
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
    Plug 'dominikduda/vim_current_word', { 'branch': 'master' }
    Plug 'dominikduda/vim_yank_with_context'
    Plug 'xolox/vim-misc'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'tpope/vim-surround'
    Plug 'majutsushi/tagbar'
" <!!!!!!!!**************!!!!!!!!>

" SYNTAX ************************************
    " Set different syntax type in part of file (for example SQL embeded in ruby file)
        Plug 'joker1007/vim-ruby-heredoc-syntax'
    " CLIPS syntax
        Plug 'vim-scripts/clips.vim'
    " jsx syntax
        Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
        Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" <!!!!!!!!**************!!!!!!!!>

" GIT INTEGRATION ************************************
      Plug 'airblade/vim-gitgutter'
      " Extension to vim-fugitive open files on github and more
          Plug 'tpope/vim-rhubarb'
      Plug 'tpope/vim-fugitive'
" <!!!!!!!!**************!!!!!!!!>

" SMART SEARCH ************************************
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
" <!!!!!!!!**************!!!!!!!!>

" RAILS ************************************
    " Enable 'bundle' in vim and more
        Plug 'tpope/vim-bundler'
    " Add rails-releated shortcuts to vim
        Plug 'tpope/vim-rails', { 'for': 'ruby' }
    " Vim-rails shortcuts everywhere!
        Plug 'tpope/vim-rake'
" <!!!!!!!!**************!!!!!!!!>

" AUTOCOMPLETE AND SNIPPETS ************************************
    " Add words found in tmux panes to auto completion list
        Plug 'wellle/tmux-complete.vim'
    " Port of Damians snippets for VScode
        Plug 'dominikduda/vim_es7_javascript_react_snippets'
    " Intelligent js complete source
        " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    " Confrim autocompletion with tab
        Plug 'ervandew/supertab'
    " Snippets for various languages pack
        Plug 'honza/vim-snippets'
    " Snippet engine
        Plug 'SirVer/ultisnips'
" <!!!!!!!!**************!!!!!!!!>
call plug#end()
filetype plugin indent on

" NOT SURE OR TOO LAZY TO CHECK ************************************
    set wildignore+=*/tmp/*,*.so,*.swp,*.zipo
    set omnifunc=syntaxcomplete#Complete
    set t_Co=256
    colorscheme dante_modified
" <!!!!!!!!**************!!!!!!!!>

" NVIM-SCROLLVIEW CONFIG ************************************
    highlight ScrollView ctermfg=NONE ctermbg=107
    let g:scrollview_column = 1
" <!!!!!!!!**************!!!!!!!!>

" INDENT-BLANKLINE.NVIM CONFIG ************************************
    let g:indentLine_char = '⁝'
    let g:indent_blankline_char = '⁝'
" <!!!!!!!!**************!!!!!!!!>

" CONTEXT.VIM CONFIG ************************************
    let g:context_max_join_parts = 2
    let g:context_max_per_indent = 1
    hi ContextLogo guifg=#b3b1b3 guibg=guisp=#0a0a0a gui=NONE ctermfg=232 ctermbg=232 cterm=NONE
    let g:context_highlight_border = 'LineNr'
    let g:context_highlight_normal = 'Normal'
    let g:context_highlight_tag    = 'ContextLogo'
    let g:context_border_char = '⁝'
    let g:context_add_autocmds = 0
    let g:context_add_mappings = 0
    let g:context_max_per_indent = 1
    let g:context_max_height = 8
    autocmd BufAdd       * call context#update('BufAdd')
    autocmd BufEnter     * call context#update('BufEnter')
    autocmd WinEnter     * call context#update('BufEnter')
    autocmd WinNew     * call context#update('BufEnter')
    autocmd VimEnter     * ContextActivate
    autocmd VimResized   * call context#update('VimResized')
    autocmd CursorHold  * call context#update('CursorHold')
    function Xxx()
      call context#enable('window')
      call context#update('CursorHold')
    endfunction
    autocmd CursorHold * call Xxx()
    " autocmd CursorMoved * ContextDisableWindow
    set maxmempattern=2500
" <!!!!!!!!**************!!!!!!!!>
"
function Yyy()
  let s:line_count = line('$')
  if $line_count > N << N TODO
    " use leader-b mode << Also TODO
  endif
  let s:line_count = line('$')
endfunction

" VIM-JEST-SNAPSHOT CONFIG ************************************
    command! SnapshotGo call snapshot#show()
" <!!!!!!!!**************!!!!!!!!>

" NVIM-R CONFIG ************************************
    " Arbitrary var
        let g:r_setup_finished = 0
    let g:rout_follow_colorscheme = 1
    let g:Rout_more_colors = 1
" <!!!!!!!!**************!!!!!!!!>

" SPELUNKER CONFIG ************************************
    nmap zs Zg
    nmap za ZL
    nmap zc Zl
    " Override highlight setting.
        highlight SpelunkerSpellBad cterm=underline
        highlight SpelunkerComplexOrCompoundWord cterm=underline
    " Disable default autogroup
        let g:spelunker_disable_auto_group = 1
" <!!!!!!!!**************!!!!!!!!>

" VIM-TRADEWINDS CONFIG ************************************
    let g:tradewinds_no_maps = 1
    nmap <C-w>h <plug>(tradewinds-h)
    nmap <C-w>j <plug>(tradewinds-j)
    nmap <C-w>k <plug>(tradewinds-k)
    nmap <C-w>l <plug>(tradewinds-l)
" <!!!!!!!!**************!!!!!!!!>

" VIM-BOOKMARKS CONFIG ************************************
    let g:bookmark_center = 1
    let g:bookmark_save_per_working_dir = 0
    let g:bookmark_manage_per_buffer = 0
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
    autocmd BufEnter * :call BookmarkMapKeys()
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
    let g:matchup_matchparen_timeout = 100
    let g:matchup_matchparen_insert_timeout = 50
    let g:matchup_matchparen_offscreen = {'method': ''}
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
      \ ".git",
      \ "client/package.json",
      \ "client/package-lock.json",
      \ "client/coverage",
      \ "coverage",
      \ "public",
      \ "gem_licenses"
      \ ]
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_project_root = ['package.json', '.git']
  let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
  let g:gutentags_ctags_extra_args = [
        \ '--tag-relative=yes',
        \ '--fields=+ailmnS',
        \ ]
" <!!!!!!!!**************!!!!!!!!>

" VIM-GETTING-THINGS-DOWN CONFIG ************************************
    let g:gtdown_cycle_states = ['TODO', 'WIP', 'DONE', 'WAIT', 'CANCELLED']
    let g:gtdown_default_fold_level = 0
    let g:gtdown_show_progress = 1
    let g:gtdown_fold_list_items = 0
    command! TODO :e ~/TODO.md
    augroup gtDown
        " Cycle through TODO keywords
            autocmd BufReadPre TODO.md nmap <buffer> <silent> <leader>s :call getting_things_down#cycle_status()<CR>
        " Toggle TODO tasks
            autocmd BufReadPre TODO.md nnoremap <buffer> <silent> <leader>t :call getting_things_down#toggle_task()<CR>
            autocmd BufReadPre TODO.md vnoremap <buffer> <silent> <leader>t :call getting_things_down#toggle_task()<CR>
        " Custom folding logic
            autocmd BufReadPost TODO.md setlocal foldmethod=marker
            autocmd BufReadPost TODO.md setlocal foldmarker=PROJECT_TODO:,PROJECT_TODO_END
            autocmd BufReadPost TODO.md setlocal foldnestmax=1
            autocmd BufReadPost TODO.md syntax match Type "PROJECT_TODO:"
            autocmd BufReadPost TODO.md syntax match Type "PROJECT_TODO_END"
            autocmd BufReadPre TODO.md nnoremap <buffer> <silent> <leader>t :call getting_things_down#toggle_task()<CR>
    augroup END
" <!!!!!!!!**************!!!!!!!!>

" RNVIMR CONFIG ************************************
  " Because it opened file into context floating window
    map <leader>1 :ContextDisable<CR>:RnvimrToggle<CR>
  " Make Ranger replace Netrw and be the file explorer
    let g:rnvimr_enable_ex = 1
  let g:rnvimr_enable_picker = 1
" <!!!!!!!!**************!!!!!!!!>

" GIST-VIM CONFIG ************************************
    let g:gist_open_browser_after_post = 1
    let g:gist_show_privates = 1
    let g:gist_post_private = 1
    let g:gist_update_on_write = 1
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
    let g:vim_current_word#enabled = 1
    hi CurrentWord ctermbg=NONE ctermbg=52
    hi CurrentWordTwins ctermbg=53
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
    " highlight Flashy ctermbg=NONE cterm=reverse
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

" VIM-DEBUGSTRING CONFIG ************************************
    vnoremap <Leader>ds y:AddDebugStringExpr('<C-r>"')<Enter>==
" <!!!!!!!!**************!!!!!!!!>

" VIM-EXPAND-REGION CONFIG ************************************
    " Press v in visual mode to expand region (first press will select word which cursor is currently on)
        vmap v <Plug>(expand_region_expand)
" <!!!!!!!!**************!!!!!!!!>

" ALE CONFIG ************************************
"
    let g:ale_virtualtext_cursor = 1
    let g:ale_virtualtext_prefix = '◀ '
    let g:ale_virtualtext_delay = 110
    let g:ale_fixers = {}
    let g:ale_fixers['r'] = ['styler']
    let g:ale_fixers['ruby'] = ['rubocop']
    let g:ale_fixers['java'] = ['google_java_format']
    let g:ale_r_lintr_options = '
          \ with_defaults(
          \  object_usage_linter = NULL,
          \  line_length_linter = line_length_linter(100),
          \  camel_case_linter = NULL,
          \  snake_case_linter = snake_case_linter
          \ )'
    " let g:ale_fixers['javascript'] = ['importjs', 'eslint']
    " let g:ale_fixers['javascript.jsx'] = ['importjs', 'eslint']
    let g:ale_fixers['javascript'] = ['eslint']
    let g:ale_fixers['javascript.jsx'] = ['eslint']
    let g:ale_type_map = {'eslint': {'E': 'ES'}}
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    autocmd InsertLeave * ALELint
    let g:ale_set_highlights = 0
    let g:ale_sign_error = '!!'
    let g:ale_sign_warning = ':('
    let g:ale_sign_style_error = ':('
    let g:ale_lint_delay = 400
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed =  1
    let g:ale_use_global_executables = 1
    let g:ale_linters = {
          \  'java': ['google-java-format'],
          \  'r': ['lintr'],
          \  'ruby': ['rubocop'],
          \  'javascript': ['eslint']
          \ }
    " Jump betwen lint errors
        nmap <silent> [l <Plug>(ale_previous_wrap)
        nmap <silent> ]l <Plug>(ale_next_wrap)
    nmap <leader>l :ALEFix<CR>:call timer_start(500, {-> execute('call spelunker#check()')}, { 'repeat': 0 })<CR> :echo 'Fixing ur file'<CR>

  hi ALESignCustom ctermfg=248 ctermbg=57
  hi NoUnderlineDiagnostic cterm=NONE
  hi! link ALEError ALESignCustom
  hi! link ALEErrorSign ALESignCustom
  hi! link ALEWarningSign ALESignCustom
  hi! link ALEInfoSign ALESignCustom
  hi! link ALEStyleErrorSign ALESignCustom
  hi! link ALEStyleWarningSign ALESignCustom


  "TODO:  THESE ARENT ALE SPECIFIC ANYMORE NEED TO MOVE.
  sign define DiagnosticSignError text=:( texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignWarn text=:| texthl=DiagnosticSignWarn linehl= numhl=
  sign define DiagnosticSignInfo text=:) texthl=DiagnosticSignInfo linehl= numhl=
  sign define DiagnosticSignHint text=:] texthl=DiagnosticSignHint linehl= numhl=

  hi! link DiagnosticError ALESignCustom
  hi! link DiagnosticWarn ALESignCustom
  hi! link DiagnosticInfo ALESignCustom
  hi! link DiagnosticHint ALESignCustom
  hi! link DiagnosticOk ALESignCustom
  " hi! link DiagnosticVirtualTextError ALESignCustom
  " hi! link DiagnosticVirtualTextWarn ALESignCustom
  " hi! link DiagnosticVirtualTextInfo ALESignCustom
  " hi! link DiagnosticVirtualTextHint ALESignCustom
  " hi! link DiagnosticVirtualTextOk ALESignCustom
  hi! link DiagnosticUnderlineError NoUnderlineDiagnostic
  hi! link DiagnosticUnderlineWarn NoUnderlineDiagnostic
  hi! link DiagnosticUnderlineInfo NoUnderlineDiagnostic
  hi! link DiagnosticUnderlineHint NoUnderlineDiagnostic
  hi! link DiagnosticUnderlineOk NoUnderlineDiagnostic
  " hi! link DiagnosticFloatingError ALESignCustom
  " hi! link DiagnosticFloatingWarn ALESignCustom
  " hi! link DiagnosticFloatingInfo ALESignCustom
  " hi! link DiagnosticFloatingHint ALESignCustom
  " hi! link DiagnosticFloatingOk ALESignCustom
  hi! link DiagnosticSignError ALESignCustom
  hi! link DiagnosticSignWarn ALESignCustom
  hi! link DiagnosticSignInfo ALESignCustom
  hi! link DiagnosticSignHint ALESignCustom
  hi! link DiagnosticSignOk ALESignCustom
  hi! link DiagnosticDeprecated ALESignCustom
  hi! link DiagnosticUnnecessary ALESignCustom
" <!!!!!!!!**************!!!!!!!!>

" RAINBOW-PARENTHESES CONFIG ************************************
    autocmd VimEnter * RainbowParenthesesActivate
    autocmd BufReadPost * RainbowParenthesesLoadRound
    autocmd BufReadPost * RainbowParenthesesLoadSquare
    autocmd BufReadPost * RainbowParenthesesLoadBraces
    autocmd BufReadPost *.js RainbowParenthesesToggleAll
    let g:rbpt_colorpairs = [
                          \ ['129', 'RoyalBlue3'],
                          \ ['118', 'firebrick3'],
                          \ ['32', 'RoyalBlue3'],
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

" ULTISNIPS CONFIG ************************************
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
    " Show only files from current working dir in mru mode
        let g:ctrlp_mruf_relative = 1
        let g:ctrlp_mruf_exclude = '\.git/.*'
    let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
    let g:ctrlp_by_filename = 0
" <!!!!!!!!**************!!!!!!!!>

" FZF CONFIG ************************************
    " Search projectwide
        nnoremap , :Rg<CR>
    " Search selected text project wide
        vnoremap , y:Rg<Space><C-r>"<CR>

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

" VIM-TEST CONFIG ************************************
    let test#enabled_runners = ["javascript#jest", "ruby#rspec"]
    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    nmap <silent> <leader>a :TestSuite<CR>
    let test#strategy = 'vimux'
    let g:test#preserve_screen = 1
    let g:test#echo_command = 0
    let g:VimuxUseNearest = v:false
    let g:VimuxRunnerType = "pane"
    " Index of tmux pane to run tests in
        let g:VimuxRunnerIndex = $VIMUX_RUNNER_PANE_INDEX
" <!!!!!!!!**************!!!!!!!!>

" FUGITIVE CONFIG ************************************
    nmap <leader>g :Gstatus<CR>j
    function! RemapJAndK()
      nmap <buffer> j <C-N>zb
      nmap <buffer> k <C-P>zb
    endfunction
    function! HandleGitCommitStart()
      startinsert
    endfunction
    autocmd FileType fugitive call RemapJAndK()
    autocmd FileType gitcommit call HandleGitCommitStart()
    autocmd FileType gitcommit setlocal colorcolumn=72
    set diffopt+=vertical
" <!!!!!!!!**************!!!!!!!!>

" VIM-CLOSETAG CONFIG ************************************
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
" <!!!!!!!!**************!!!!!!!!>

" PROJECT SPECIFIC ************************************
    if $CURRENT_PROJECT_NAME == 'CATALYST'
        autocmd FileType javascript setlocal colorcolumn=101
        autocmd FileType javascript.jsx setlocal colorcolumn=101
        autocmd FileType ruby setlocal colorcolumn=121
        let g:deoplete#enable_ignore_case = 1
        let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'ruby': ['rubocop'],
        \}
        let g:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['eslint']}
        let g:rbpt_max = 0
    endif
    if $CURRENT_PROJECT_NAME == 'TH'
        " function! MoveCursor()
        "   call cursor(1, 1)
        " endfunction
        function! HandleGitCommitStart()
          call feedkeys("/branch \<CR>wyeggi\<Space>[]\<ESC>P", 'tx')
          call feedkeys("0i", 't')
        endfunction
        autocmd FileType ruby setlocal colorcolumn=121
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
    inoremap zz <Esc>dawi
    imap <C-Backspace> <Esc>dawi
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
      " Take most characters literally in incsearch
          map / /\V
          map ? ?\V
      " Search react component usages
          noremap <leader>u lbvey:Ag! --ignore node_modules --ignore coverage --ignore tests '<<C-r>0\b'<CR>
      " Jumps to definition of javascript thing under cursor and persists current inc search value
          noremap gd :let @t = @/<CR>*ggn/from<CR>$hgfggn:let @/ = @t<CR>
      " Display special_characters, show eol only in visual mode
          function! ShowEOL(...)
            let g:eol_enabled_xxx = get(a:, 1, 0)
            if mode() == "v" || mode() == "V" || mode() == "\<C-V>" || g:eol_enabled_xxx
              set listchars=nbsp:•,tab:➤-,eol:↲
            else
              set listchars=nbsp:•,tab:➤-
            endif
          endfunction
          autocmd CursorMoved,CursorHold * call ShowEOL()
          autocmd InsertEnter * call ShowEOL(0)
          nnoremap v :call ShowEOL(1)<CR>v
          nnoremap V :call ShowEOL(1)<CR>V
          nnoremap <C-q> :call ShowEOL(1)<CR><C-q>
    " Show quickfix window at the very bottom
        autocmd QuickFixCmdPost wincmd J
    " Auto align splits
        autocmd VimResized * wincmd =
    " Show current file bound in 2 colums
        function! ToggleScrollBind()
          if exists("g:scroll_bind_endabled") && g:scroll_bind_endabled
            let g:scroll_bind_endabled = 0
            :set noscrollbind
            :wincmd w
            :set noscrollbind
            :q!
            :wincmd w
            echo 'Scroll binding disabled'
          else
            let g:scroll_bind_endabled = 1
            :vs
            call feedkeys("\<C-f>\<C-e>\<C-e>", 'tx')
            :set scrollbind
            :wincmd w
            call feedkeys("gg", 'tx')
            :set scrollbind
            echo 'Created split scroll bounded to current one'
          endif
        endfunction
        nmap <leader>b :call ToggleScrollBind()<CR>
    " Search projectwide
        " nnoremap , :Ag!<Space>-Q<Space>--ignore node_modules --ignore coverage<Space>''<Left>
    " Search selected text project wide (+ possibility to pass path)
        " vnoremap , y:Ag!<Space>-Q<Space>--ignore node_modules --ignore coverage<Space>'<C-r>"'<Space>
    " Squashing commits helpers
        command! SquashCommits call feedkeys("ggjV}:s/pick/squash\<CR>:wq\<CR>", 'tx')
        command! -nargs=1 NameSquashedCommit call feedkeys("/Please enter the commit message for<CR>kdggO\<Esc>xi<args>\<ESC>:wq\<CR>", 'tx')
    function! EatWhiteSpace()
        let c = nr2char(getchar(0))
        return (c =~ '\s') ? '' : c
    endfunction
    " js jest test abbrevs
      autocmd BufEnter *.test.js iab <buffer> cwrs const { component, wrapper } = renderShallowWrapper()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> cwrd const { component, wrapper } = renderWrapper()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> crs const { component } = renderShallowWrapper()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> wrs const { wrapper } = renderShallowWrapper()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> crd const { component } = renderWrapper()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> wrd const { wrapper } = renderWrapper()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> com component<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> ex expect(<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> te toEqual(<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> mrv mockReturnValue(<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> mi mockImplementation(<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> mib mockImplementation(() => {})<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> thbc toHaveBeenCalled()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> thbct toHaveBeenCalledTimes(<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> thbcw toHaveBeenCalledWith(<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> jso jest.spyOn(<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> jfn jest.fn()<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.test.js iab <buffer> sst setState(<c-r>=EatWhiteSpace()<cr>
    " js generic abbrevs
      autocmd BufEnter *.js,*.jsx iab <buffer> dbg debugger<c-r>=EatWhiteSpace()<cr>
      autocmd BufEnter *.js,*.jsx inoremap <A-=> ()<space>=><space>{}
    " ruby generic abbrevs
      autocmd BufEnter *.rb iab dbg binding.remote_pry
      autocmd BufEnter *.rb iab msg Rails.logger.info "#{}"
      autocmd BufEnter *.rb iab org organization
      autocmd BufEnter *.rb inoremap <A-Bslash> <Space><Bar><Bar>=<Space>
      inoremap <A-.> <C-]>
    " Statusline config
      set statusline=
      set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
      set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
      set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
      set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
      set statusline+=%#Visual#       " colour
      set statusline+=%{&paste?'\ PASTE\ ':''}
      set statusline+=%{&spell?'\ SPELL\ ':''}
      set statusline+=%#CursorIM#     " colour
      set statusline+=%R                        " readonly flag
      set statusline+=%M                        " modified [+] flag
      set statusline+=%#Cursor#               " colour
      set statusline+=%#CursorLine#     " colour
      set statusline+=\ %F\                   " short file name
      set statusline+=%=                          " right align
      set statusline+=%#CursorLine#   " colour
      set statusline+=\ %Y\                   " file type
      set statusline+=%#CursorIM#     " colour
      set statusline+=\ %-2c\         " line + column
      set statusline+=%{vim_timebox#time_left()}
" <!!!!!!!!**************!!!!!!!!>

" CUSTOM WINDOW SPACE MANAGEMENT ************************************
  function! s:is_floating(id) abort
      let l:cfg = nvim_win_get_config(a:id)
      return !empty(l:cfg.relative) || l:cfg.external
  endfunction

  function! s:special_cols_width()
    let numberwidth = max([&numberwidth, strlen(line('$'))+1])
    let numwidth = (&number || &relativenumber)? numberwidth : 0
    let foldwidth = &foldcolumn

    if &signcolumn == 'yes'
      let signwidth = 2
    elseif &signcolumn == 'auto'
      let signs = execute(printf('sign place buffer=%d', bufnr('')))
      let signs = split(signs, "\n")
      let signwidth = len(signs)>2? 2: 0
    else
      let signwidth = 0
    endif
    return numwidth + foldwidth + signwidth
  endfunction

  function! s:optimize_win_width()
    " Skip the function if running from floating window (fzf was breaking)
    if s:is_floating(0)
      return
    end

    let s:buf_name = expand('%:t')
    let s:longest_line_length = max(map(range(1, line('$')), "col([v:val, '$'])"))
    let s:special_cols_width = s:special_cols_width()
    let s:used_win_width = s:special_cols_width + s:longest_line_length
    let s:total_win_width=winwidth(0)
    let s:current_split_width = winwidth('%')
    let s:resize_to = s:used_win_width - 1
    let s:whole_vim_width = &columns
    let s:max_single_window_width_percent = 0.6
    let w:width_optimized_to = s:resize_to

    " Skip resizing if window would be resized over allowed threshold
    let s:max_allowed_win_width = s:whole_vim_width * s:max_single_window_width_percent
    if (s:resize_to > s:max_allowed_win_width)
      let s:resize_to = float2nr(s:max_allowed_win_width)
    endif

    if (s:used_win_width != s:total_win_width)
      execute "vertical resize " . s:resize_to
      :ContextUpdate
    endif
  endfunction

  autocmd WinEnter * call s:optimize_win_width()
  autocmd WinNew * call s:optimize_win_width()
  autocmd BufReadPost * call s:optimize_win_width()
  autocmd InsertLeave * call s:optimize_win_width()
" <!!!!!!!!**************!!!!!!!!>

" EXPERIMENTAL
  autocmd BufReadPost * syntax sync fromstart
  autocmd BufReadPost *.md :setlocal foldlevel=20
  autocmd BufReadPost TODO.md :setlocal foldlevel=0

  if exists("b:current_syntax")
    finish
  endif

  let b:current_syntax = "todo"
  setlocal cole=1
