" INSTALL PLUGINS {{{
  if has("nvim")
    call plug#begin('$HOME/.config/nvim/plugged')
  elseif
    call plug#begin('~/.vim/plugged')
  endif

  " BASICS {{{
  Plug 'tpope/vim-commentary'               " Toggle comments shortcut: gcc
  Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Auto switch between relative and absolute line numbers
  " }}}

  " GIT INTEGRATION {{{
  Plug 'tpope/vim-fugitive'             " Git Integration. Type :Gstatus, among others
  Plug 'tpope/vim-rhubarb'              " Make Fugitive's Gbrowse go to Github
  Plug 'airblade/vim-gitgutter'         " Show git changes in gutter next to line numbers
  " }}}

  " SEARCH & NAVIGATION {{{
  Plug 'tpope/vim-vinegar'              " Press the minus (-) key to navigate up directories, use netrw
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'               " Fuzzy Finder
  Plug 'pbrisbin/vim-mkdir'             " Automatically create missing paths when you you create a new file
  Plug 'tpope/vim-eunuch'               " Unix Helpers from Vim. :Rename, :Delete, :Mkdir, etc
  Plug 'christoomey/vim-tmux-navigator' " Use Ctrl-hjkl to navigate both vim and tmux
  Plug 'rizzatti/dash.vim'              " Search Dash documentation directly from Vim
  " }}}

  " AUTOCOMPLETION {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " VSCode Language Server Protocol autocompletion, etc
  Plug 'vim-syntastic/syntastic'        " Syntax Checker
  " Plug 'ludovicchabant/vim-gutentags'   " Automatically runs ctags upon save
  Plug 'majutsushi/tagbar'              " Displays ctags in sidebar on right
  " }}}

  " TESTING {{{
  Plug 'janko-m/vim-test'               " Execute tests using keyboard shortcuts
  Plug 'christoomey/vim-tmux-runner'    " Run tests from vim-test in a tmux pane
  " }}}

  " LANGUAGE SPECIFIC {{{
  Plug 'ngmy/vim-rubocop'                 " Rubocop is a code formatter / linter for ruby
  Plug 'rhysd/vim-crystal'                " Crystal syntax highlighting
  Plug 'pangloss/vim-javascript'          " Javascript syntax highlighting
  Plug 'MaxMEllon/vim-jsx-pretty'         " JSX / React syntax highlighting
  Plug 'tpope/vim-endwise'                " Auto insert 'end' in Ruby, Elixir, vimscript, etc
  Plug 'ap/vim-css-color'                 " Highlight Colors in CSS
  Plug 'stephpy/vim-yaml'                 " Better YAML Syntax Highlighting
  Plug 'plasticboy/vim-markdown'          " Better markdown support
  Plug 'slim-template/vim-slim'           " Slim template syntax highlighting
  Plug 'dag/vim-fish'                     " Syntax highlighting for fish shell scripts
  " }}}

  " LANGUAGES I'M NOT USING RIGHT NOW {{{
  " Plug 'andys8/vim-elm-syntax'
  Plug 'elixir-editors/vim-elixir'        " Elixir syntax highlighting
  " Plug 'mhinz/vim-mix-format'             " Integrate the elixir formatter
  " }}}

  " WRITING {{{
  " Plug 'vimwiki/vimwiki'
  Plug 'junegunn/goyo.vim'              " Distraction Free Writing Mode
  Plug 'itspriddle/vim-marked'          " Preview Markdown Files in Marked 2
  Plug 'https://github.com/alok/notational-fzf-vim'
  Plug 'jkramer/vim-checkbox'
  " }}}

  " THEMES {{{
  Plug 'dracula/vim', { 'as': 'dracula' }  " Dark Theme
  Plug 'rakr/vim-one'                      " Light Theme
  Plug 'lifepillar/vim-solarized8'         " Solarized Theme
  " }}}
  call plug#end()

" }}}

" BASIC SETTINGS {{{
  set ruler                         " Show line and column number
  set encoding=utf-8                " UTF-8 Encoding on the screen
  set fileencoding=utf-8            " UTF-8 Encoding when you write to disk
  filetype plugin indent on         " Detect file types, load their plugin files, and their indent files
  set showmatch                     " When you insert a bracket, highlight the matching one
  set laststatus=2                  " Always show the status bar
  set cursorline                    " Highlight current line
  highlight  CursorLine ctermbg=Yellow ctermfg=None
  set wildmenu                      " : command line completion
  set lazyredraw                    " redraw only when we need to.
  set mouse=a                       " Enable mouse support
  set shell=zsh                     " Use zsh shell when running commands
  set visualbell                    " Use a visual bell instead of beeping
  set noerrorbells                  " Don't beep on errors
" }}}

" WHITESPACE {{{
  set nowrap                        " don't wrap lines
  set tabstop=2                     " a tab is two spaces
  set shiftwidth=2                  " an autoindent (with <<) is two spaces
  set expandtab                     " use spaces, not tabs
  set list                          " Show invisible characters
  set backspace=indent,eol,start    " backspace through everything in insert mode
  set autoindent                    " Auto-indent
  set wrap linebreak                " Wrap long lines

  set listchars=""                  " Reset the listchars
  set listchars=tab:▸\              " Show tabs and eol symbols
  set listchars+=extends:>          " The character to show in the last column when wrap is
                                    " off and the line continues beyond the right of the screen
  set listchars+=precedes:<         " The character to show in the last column when wrap is
                                    " off and the line continues beyond the right of the screen


  au FileType elm setl sw=4 sts=4 et
  au BufNewFile,BufRead *.es6 set filetype=javascript
" }}}

" SPELL CHECK {{{

  " Spell-check Markdown files and Git commit messages
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
  " autocmd FileType vimwiki setlocal spell
  " autocmd FileType vimwiki.markdown setlocal spell

  autocmd FileType markdown setlocal complete+=kspell
  autocmd FileType gitcommit setlocal complete+=kspell
  " autocmd FileType vimwiki setlocal complete+=kspell
  " autocmd FileType vimwiki.markdown setlocal complete+=kspell

" }}}

" LINE NUMBERS {{{
  set number                        " Show Line Numbers
  set relativenumber                " Make line numbers relative to current line SLOW?
  set numberwidth=5                 " Width of line numbers
  " Ctrl-n to toggle between relative and absolute line numbers
  nnoremap <silent> <C-n> :set relativenumber!<cr>
" }}}

" FOLDING {{{
  set foldmethod=syntax            " Make folding based on syntax
  set foldlevelstart=99            " Fold by default starting at 99 levels deep
  autocmd FileType haml setlocal foldmethod=indent " Use indentation to set folding in HAML
" }}}

" STATUS LINE {{{
  function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endfunction

  set statusline=
  set statusline+=%#PmenuSel#
  set statusline+=%#LineNr#
  set statusline+=\ %f
  set statusline+=%m
  set statusline+=%=
  set statusline+=%#CursorColumn#
  set statusline+=\ %y
  set statusline+=\ %p%%
  set statusline+=\ %l:%c
  set statusline+=\ 
" }}}

" PERSIST CURSOR POSITION {{{
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
" }}}

" COLORSCHEME {{{
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors

  let g:one_allow_italics = 1
  " Make comments and html arguments italic
  " And remove underline in tab bar.
  function! UseItalicCharacters()
    hi Comment gui=italic cterm=italic
    hi htmlArg gui=italic cterm=italic
    hi Type    gui=italic cterm=italic
  endfunction

  function! ColorSchemeDark()
    set background=dark
    colorscheme dracula
    call UseItalicCharacters()
  endfunction

  function! ColorSchemeLight()
    set background=light
    colorscheme solarized8_high
    
    call UseItalicCharacters()
  endfunction

  function! SetColorScheme(...)
    if has("macunix") || has("gui_vimr")
      " dark mode enabled?
      if system("defaults read -g AppleInterfaceStyle") =~ 'Dark'
        call ColorSchemeDark()
      else
        call ColorSchemeLight()
      endif
    endif
  endfunction

  if (empty($TMUX))
    if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif
  call SetColorScheme()
" }}}

" TABS {{{
  set showtabline=2                 " Always show tab bar
" }}}

" COMMON KEYBOARD SHORTCUTS {{{

  " Set the leader key to the space bar
  let mapleader="\<SPACE>"

  " Reload config = leader shift R
  nmap <Leader>R :source $MYVIMRC<CR> 

  " Override common mistakes in command mode
  cnoreabbrev E e
  cnoreabbrev Tabe tabe
  cnoreabbrev W w
  cnoreabbrev WQ wq
  cnoreabbrev Wq wq
  cnoreabbrev WA wa
  cnoreabbrev Wa wa
  cnoreabbrev ack Ag
  cnoreabbrev Ack Ag
  cnoreabbrev ACk Ag
" }}}

" INDENT LINE {{{
let g:indentLine_char = '¦'
" See themes for colors
" }}}

" CLIPBOARD / PASTE BUFFER {{{

  set clipboard=unnamed             " Setup Pastebuffer to use OS X Clipboard
  " leader p pastes
  nnoremap <leader>p :r!pbpaste<cr>
" }}}

" SEARCHING {{{
  set hlsearch                      " highlight matches
  set incsearch                     " incremental searching
  set ignorecase                    " searches are case insensitive...
  set smartcase                     " ... unless they contain at least one capital letter

  " Ctrl-h to clear search
  map <C-h> :nohl<cr>

  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    if !exists(":Ag")
      command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
      nnoremap \ :Ag<SPACE>
    endif
  endif
" }}}

" FILE IGNORE {{{
  " Disable output and VCS files
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.swp,*.so,*.zip

  " Disable archive files
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

  " Ignore bundler and sass cache
  set wildignore+=*.scssc,*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

  " Disable temp and backup files
  set wildignore+=*/tmp/*,*.swp,*~,._*,.DS_Store

  " Disable package manager directories
  set wildignore+=*/node_modules/*,*/bower_components/*,*/elm-stuff/*

  " Disable build directories
  set wildignore+=*/generated/*,*/_site/*
" }}}

" BACKUP FILES {{{
  " Move backup files, (.swp, etc) to /tmp directory
  set backup
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set backupskip=/tmp/*,/private/tmp/*
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  " set writebackup
" }}}

" CRYSTAL {{{
let g:crystal_auto_format = 1
" }}}

" FUGITIVE (GIT) {{{
  set diffopt+=vertical                " Use vertical split diff
  nnoremap <Leader>g :Gstatus<CR>
" }}}

" GIT GUTTER {{{
  let g:gitgutter_realtime = 0         " Turn off git-gutter real-time to make it faster
  let g:gitgutter_eager = 0            " Turn off git-gutter eager loading to make it faster
" }}}

" FZF (FUZZY FILE SEARCH) {{{
  " <leader>o to fuzzy find all files in project
  nnoremap <silent> <leader>o :Files<CR>
  " <leader>o to fuzzy find all current buffers
  nnoremap <silent> <leader>b :Buffers<CR>
  " <leader>o to fuzzy find recently opened files in project
  nnoremap <silent> <leader>m :History<CR>
  " Open fzf into a modal popup window
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" }}}

" Ruby Customization {{{
" :CnvertHashrockets converts {:foo => 'bar'} to {foo: 'bar'}
command! -range=% ConvertHashrockets silent execute <line1>.','.<line2>.'s/:\(\w\+\)\s*=>\s*/\1: /g'
" }}}

" Elm-Vim {{{
  " let g:elm_setup_keybindings = 0
  " nnoremap <buffer> <Leader>e <Plug>(elm-show-docs)
" }}}

" TAGBAR {{{
  " Toggle ctags bar using Leader-c
  map <Leader>c :TagbarToggle<CR>

  " " Sort by appearance in source code
  let g:tagbar_sort = 0

  let g:tagbar_type_elm = {
    \ 'kinds' : [
    \ 'f:function:0:0',
    \ 'm:modules:0:0',
    \ 'i:imports:1:0',
    \ 't:types:1:0',
    \ 'a:type aliases:0:0',
    \ 'c:type constructors:0:0',
    \ 'p:ports:0:0',
    \ 's:functions:0:0',
    \ ]
    \}
" }}}

" Syntastic {{{
" Add syntax checking status info to statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" GOYO {{{
" Customize default height/width of Goyo distraction free UI
let g:goyo_width = '100'
let g:goyo_height = '90%'
" }}}

" Markdown {{{
" g:vim_markdown_conceal = 2
" au FileType markdown setl conceallevel=1
let g:vim_markdown_conceal_code_blocks = 0
" }}}

" VIM WIKI {{{
" let g:vimwiki_list = [{'path': '~/Documents/Wiki/',
"                     \ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_global_ext = 0
" let g:vimwiki_filetypes = ['markdown']
" map <Leader>tt <Plug>VimwikiToggleListItem
" nmap -- <Plug>VimwikiRemoveHeaderLevel
" }}}

" notational-fzf-vim {{{
let g:nv_search_paths = ['~/Documents/Notes']
" <space>n to search/create a notes
nnoremap <leader>n :NV<CR>                
" ctrl-n to create a new note from the search menu
let g:nv_create_note_key = 'ctrl-n'
let g:nv_default_extension = '.md'
let g:nv_ignore_pattern = ['*.json', '*.dict', '.cache/*', 'i/*', '*.jpg', '*.jpeg', '*.png']
" }}}

" COC.vim {{{
let g:coc_global_extensions = ["coc-css"]

" Disable in plain markdown, git commits, etc filetypes
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType vimwiki let b:coc_suggest_disable = 1
autocmd FileType vimwiki.markdown let b:coc_suggest_disable = 1
autocmd FileType gitcommit let b:coc_suggest_disable = 1

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" DASH.vim {{{
nmap <silent> <leader>d <Plug>DashSearch

let g:dash_map = {
    \ 'javascript' : ['javascript', 'jquery', 'jqueryui', 'lodash', 'react'],
    \ 'jsx' : ['react', 'javascript', 'lodash'],
    \ 'sass' : ['css', 'sass', 'bourbon', 'susy'],
    \ 'haml' : ['haml', 'ruby', 'rails', 'ruby-on-rails'],
    \ 'slim' : ['slim', 'ruby', 'rails', 'ruby-on-rails'],
    \ 'elixir' : ['elixir', 'ecto', 'phoenix'],
    \ 'eelixir' : ['phoenix_html', 'phoenix', 'elixir'],
    \ 'crystal' : ['crystal']
    \ }
" }}}

" VIM-TEST {{{
  " Leader-s to run test(s) near cursor
  nmap <silent> <leader>s :TestNearest<CR>
  " Leader-t to run all tests in file
  nmap <silent> <leader>t :TestFile<CR>
  " Leader-T to run entire suite
  nmap <silent> <leader>T :TestSuite<CR>
  " Leader-l to run last test
  nmap <silent> <leader>l :TestLast<CR>

  if exists('$TMUX')
    let test#strategy = "vtr" " Run tests in tmux pane
    " let test#strategy = "neovim" " Run tests in integrated terminal
  elseif has("nvim")
    let test#strategy = "neovim" " Run tests in integrated terminal
  else
    let test#strategy = "basic"
  endif

  let test#ruby#rspec#options = {
    \ 'file':    '--format documentation'
  \}

  let g:test#preserve_screen = 1

  " CTRL-o to exit terminal insert mode
  if has('nvim')
    tmap <C-o> <C-\><C-n>
  endif
" }}}

" Vim Mix Format (Elixir) {{{
" let g:mix_format_on_save = 1
" }}}

" SOURCE LOCAL OVERRIDES {{{
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

call SourceIfExists("~/.config/nvim/local.vim")

" }}}

" vim:fileencoding=utf-8:foldmethod=marker:foldlevel=0
