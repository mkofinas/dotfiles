" Neovim Configuration
" ----------------------------
" 1. XDG Specification
" 1. Plugin Manager: Vim-Plug
" 2. Neovim Settings
" 3. Custom Mappings
" 4. Plugin Settings
" 5. Colorscheme
" ----------------------------
" Author(s):
" - Miltiadis Kofinas <mkofinas@gmail.com>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XDG Specification {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = expand('$HOME/.config')
endif
" 1}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager: Vim-Plug {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Download Vim-Plug and Install Plugins {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List of Plugins {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle')

" NOTE: The plugin categories, as well as their organization are loosely based
" on Vim-Awesome (http://vimawesome.com/). However, the plugins listed as
" 'Other', 'Language' or 'Uncategorized' at Vim-Awesome are split in the
" remaining categories, according to the author's judgement.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'justinmk/vim-sneak'
" Plug 'godlygeek/tabular'
" Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
" Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips' | Plug 'mkofinas/vim-snippets'
" function! MoveFzfConfig(arg)
  " !./install --all --no-update-rc
  " !mkdir -p $XDG_CONFIG_HOME/fzf
  " !mv $HOME/.fzf.bash $XDG_CONFIG_HOME/fzf/fzf.bash
  " !mv $HOME/.fzf.zsh $XDG_CONFIG_HOME/fzf/fzf.zsh
" endfunction
" Plug 'junegunn/fzf', { 'dir': '~/.local/opt/fzf', 'do': function('MoveFzfConfig') }
" Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'
" Plug 'github/copilot.vim', {'branch': 'release'}
Plug 'Exafunction/windsurf.vim', { 'branch': 'main' }
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrations {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dense-analysis/ale'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'rhysd/vim-grammarous', { 'for': 'tex' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
" Plug 'taketwo/vim-ros'
Plug 'rhysd/vim-clang-format', { 'do': 'sudo apt-get install clang-format-3.4', 'for': ['cpp', 'c'] }
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'python-mode/python-mode'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mbbill/undotree', { 'for': 'tidal' }
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'sjl/gundo.vim'
" Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'tidalcycles/vim-tidal'
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Display {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'morhetz/gruvbox'
" Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'JuliaLang/julia-vim'
Plug 'cespare/vim-toml'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c'] }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'ryanss/vim-hackernews'
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call plug#end() " required
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim Settings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileformat=unix
set fileformats=unix,dos,mac " Detect unix, dos, mac file formats in that order

set history=1000 " Remember more commands and search history
set undolevels=1000 " Use many levels of undo

set switchbuf=useopen,usetab
set hidden " A buffer becomes hidden when it is abandoned

set ttimeout
set ttimeoutlen=50 " Remove delay detween insert and normal mode

" Make sure that shell scripts are highlighted as bash scripts and not
" sh scripts
let g:is_bash=1

let mapleader=","
let g:mapleader=","

set modeline
set modelines=1

set lazyredraw

set foldmethod=indent
set nofoldenable

au FileType vim setlocal fo-=o

set clipboard+=unnamedplus
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you type the first tab, it will complete as much as possible, the second
" and subsequent tabs will provide a list and cycle through completion options
set wildmenu
set wildmode=longest:list,full

set wildignore+=*.pyc
set wildignore+=*.o
set wildignore+=*~
" The 'longest' option makes completion insert the longest prefix of all
" the possible matches

set wildignorecase

set completeopt=menuone,longest,preview
" Determines the maximum number of items to show in the popup menu.
" Zero is take as much as possible.
set pumheight=6

set mouse=a
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set nobackup " No backup (*~) files
set noswapfile " No swap (*.swp) files

" Maximum width of text that is being inserted.
set textwidth=88

let g:load_doxygen_syntax=1

set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on.
set autoindent
set smartindent " smart auto indenting
set copyindent " Copy the previous indentation on autoindenting

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab " Turn a tab into spaces
set shiftround " Round indent to multiple of shiftwidth

" Set C/C++ indentation values. See :help cinoptions-values
set cino=>1s,g1,h1,N-s,t0,(0,W4
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search/Replace {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab " Insert/Remove spaces according to shiftwidth
set magic " Change the way backslashes are used in search patterns

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set hlsearch " Highlight matched phrases
set incsearch " Highlight as I type the search string
set gdefault " This makes search/replace global by default
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellchecking {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title " Show file name as window title
set showcmd " Show typed command in the last line
set number " Display absolute line number for the current line on the left
set relativenumber " Display relative line numbers on the left
set noshowmode " Don't show Vim modes in the last line
set laststatus=2 " Always show the statusline

set scrolloff=1 " 1 line above/below cursor when scrolling

set nowrap " Don't automatically wrap long lines

set list listchars=extends:⍈,precedes:⍇,tab:>-
set fillchars=vert:│
set colorcolumn=+1

set synmaxcol=250
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages Support {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:python_host_prog = '/usr/bin/python2.7'
" let g:python3_host_prog = '/usr/bin/python3.4'
" let g:python_host_prog = '/home/miltos/.virtualenvs/neovim-python2/bin/python2.7'
" let g:python3_host_prog = '/home/miltos/.virtualenvs/neovim-python3/bin/python3.6'
let g:python_host_prog = expand('$HOME/.local/pyenv/versions/neovim-python2/bin/python')
let g:python3_host_prog = expand('$HOME/.local/pyenv/versions/neovim-python3/bin/python')
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit init.vim
noremap <leader><leader>v :e! $MYVIMRC<CR>
" Source init.vim and make all changes active (file has to be saved first)
noremap <silent> <leader><leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

" Use Shift+<Left, Right> keys to move through buffers.
nmap <silent> <S-Right> :bnext<CR>
nmap <silent> <S-Left> :bprevious<CR>

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

" Select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" Reselect last paste
xnoremap p pgvy

" Enter Normal mode without the Escape button
inoremap jk <Esc>

" Insert space without entering insert mode
nnoremap <space> i<space><Esc>l
" Insert newline without entering insert mode
nnoremap <CR> o<Esc>

" Vertical split
noremap <Leader>v :vsplit<CR>

" Copy the entire current buffer to clipboard
map <Leader>A gg"+yG

" Quit current window
noremap <Leader>qq :q!<CR>
" Quit all windows
noremap <Leader>QQ :qa!<CR>

" Move to the end of line
nnoremap <leader>' $
" Move to the start of line
nnoremap <leader>a ^

" Move lines and blocks of code up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" 1}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']
let NERDTreeShowHidden=1

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Airline {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = '|'
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline#extensions#ale#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" Enable powerline symbols
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview=1
let g:airline_theme = 'gruvbox'
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Startify {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_dir = "~/.config/nvim/sessions"
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
let g:startify_bookmarks = ['~/.config/nvim/init.vim', '~/.vimrc', '~/.bashrc', '~/.zshrc', '~/.config/tmux.conf']
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Clang-Format {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#command = "clang-format-3.4"
let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
        \ "NamespaceIndentation" : "None",
        \ "AccessModifierOffset" : -1,
        \ "AllowShortIfStatementsOnASingleLine" : "false",
        \ "AllowShortLoopsOnASingleLine" : "false",
        \ "AlwaysBreakTemplateDeclarations" : "true",
        \ "ConstructorInitializerIndentWidth" : 2,
        \ "ColumnLimit" : 80,
        \ "BreakBeforeBraces" : "Allman",
        \ "Standard" : "C++03"}
        \ "PointerAlignment" : "Left"
        \ "IndentWidth" : 2,
        \ "MaxEmptyLinesToKeep" : 1,
        \ "ContinuationIndentWidth" : 4,
        \ "AlignAfterOpenBracket" : "Align",
        \ "BreakBeforeBinaryOperators" : "None"}
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leave space after comment
let NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#', 'leftAlt': '#' }
\ }
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

hi! link ALEErrorSign ErrorMsg
hi! link ALEWarningSign WarningMsg

" let g:ale_fixers = {}
" let g:ale_fixers.python = ['black']
" let g:ale_fixers = {'python': ['isort']}
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

let g:tagbar_width = 60
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-`>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "private-snippets"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="doxygen"
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Cpp-Enhanced-Highlight {{{2
let g:cpp_class_scope_highlight = 1
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gundo_width = 40
let g:gundo_right = 1

nnoremap <C-G> :GundoToggle<CR>
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Fugitive {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gbrowse<CR>
nnoremap <silent> <leader>gl :Glog<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX-Box {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LaTeXBox_output_type='' "Let latexmkrc choose the type
let g:LatexBox_latexmk_options="-r ${XDG_CONFIG_HOME:-${HOME}/.config}/latex/.latexmkrc"
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vimtex_syntax_conceal_default = 0
let g:vimtex_syntax_conceal_disable = 0
let g:vimtex_syntax_conceal = {
\ 'accents': 1,
\ 'ligatures': 1,
\ 'cites': 1,
\ 'fancy': 1,
\ 'greek': 1,
\ 'math_bounds': 0,
\ 'math_delimiters': 1,
\ 'math_fracs': 1,
\ 'math_super_sub': 0,
\ 'math_symbols': 0,
\ 'sections': 0,
\ 'styles': 1,
\}
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Devicons {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bash'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zsh'] = ''
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Gitgutter {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '
let g:gitgutter_sign_removed_first_line = ' '
let g:gitgutter_sign_modified_removed = ' '
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Instant-Markdown {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 1
let g:instant_markdown_mathjax = 1
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Tmux-Navigator {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down> :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

let g:tmux_navigator_save_on_switch = 1
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Better-Whitespace {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'tex']
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Multiple-Cursors {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<leader>m'
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" a.vim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:alternateSearchPath = 'reg:#\<src\>#include#,reg:#\<include\>#src#'
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf.vim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND='ag -g ""'
inoremap <C-P> <Esc>:FZF<CR>
noremap <C-P> :FZF<CR>
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo & Limelight {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-vim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#completions_enabled = 0
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-Mode {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_syntax_print_as_function = 1
let g:pymode_lint = 0
let g:pymode_lint_ignore = ["E501", "W391", ]
let g:quickfixsigns_protect_sign_rx = '^neomake_'
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-pairs {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsMapSpace = 0
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copilot {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:copilot_filetypes = {
      \ 'markdown': 1,
      \ 'yaml': 1,
      \ 'tex': 1,
      \ }
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copilot {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:copilot_filetypes = {
      \ 'markdown': 1,
      \ 'yaml': 1,
      \ }
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treesitter {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set termguicolors

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
hi! link ExtraWhitespace GruvboxRed
hi! link ErrorMsg GruvboxRedSign
hi! link WarningMsg GruvboxYellowSign
" 1}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent-blankline.nvim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("ibl").setup()
EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" vim:foldmethod=marker:foldlevel=0:foldenable
