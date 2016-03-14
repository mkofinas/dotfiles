set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ****************************** Vundle SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe' "https://github.com/Valloric/YouCompleteMe
Plugin 'jiangmiao/auto-pairs' "https://github.com/jiangmiao/auto-pairs
Plugin 'Yggdroot/indentLine' "https://github.com/Yggdroot/indentLine
Plugin 'scrooloose/nerdcommenter' "https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdtree' "https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/syntastic' "https://github.com/scrooloose/syntastic
" Requires 'exuberant-ctags'
Plugin 'majutsushi/tagbar' "https://github.com/majutsushi/tagbar
Plugin 'bling/vim-airline' "https://github.com/bling/vim-airline
Plugin 'altercation/vim-colors-solarized' "https://github.com/altercation/vim-colors-solarized
Plugin 'flazz/vim-colorschemes' "https://github.com/flazz/vim-colorschemes
Plugin 'tpope/vim-fugitive' "https://github.com/tpope/vim-fugitive
Plugin 'taketwo/vim-ros' "https://github.com/taketwo/vim-ros
Plugin 'mhinz/vim-startify' "https://github.com/mhinz/vim-startify
Plugin 'ntpeters/vim-better-whitespace' "https://github.com/ntpeters/vim-better-whitespace
" Requires 'clang-format-3.4'
Plugin 'rhysd/vim-clang-format' "https://github.com/rhysd/vim-clang-format
Plugin 'octol/vim-cpp-enhanced-highlight' "https://github.com/octol/vim-cpp-enhanced-highlight
Plugin 'SirVer/ultisnips' "https://github.com/SirVer/ultisnips
Plugin 'mkofinas/vim-snippets' "https://github.com/mkofinas/vim-snippets
Plugin 'davidhalter/jedi-vim' "https://github.com/davidhalter/jedi-vim
Plugin 'airblade/vim-gitgutter' "https://github.com/airblade/vim-gitgutter
Plugin 'ctrlpvim/ctrlp.vim' "https://github.com/ctrlpvim/ctrlp.vim
Plugin 'sjl/gundo.vim' "https://github.com/sjl/gundo.vim
Plugin 'tpope/vim-surround' "https://github.com/tpope/vim-surround
Plugin 'Valloric/MatchTagAlways' "https://github.com/Valloric/MatchTagAlways
Plugin 'easymotion/vim-easymotion' "https://github.com/easymotion/vim-easymotion
Plugin 'Shougo/vimproc.vim' "https://github.com/Shougo/vimproc.vim
Plugin 'Shougo/vimshell.vim' "https://github.com/Shougo/vimshell.vim
Plugin 'LaTeX-Box-Team/LaTeX-Box' "https://github.com/LaTeX-Box-Team/LaTeX-Box
Plugin 'ryanoasis/vim-webdevicons' "https://github.com/ryanoasis/vim-devicons
Plugin 'junegunn/vim-easy-align' "https://github.com/junegunn/vim-easy-align
Plugin 'JuliaLang/julia-vim' "https://github.com/JuliaLang/julia-vim
Plugin 'godlygeek/tabular' "https://github.com/godlygeek/tabular
Plugin 'suan/vim-instant-markdown' "https://github.com/suan/vim-instant-markdown

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** General SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on
syntax enable

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
" Better command-line completion
set wildmode=longest,list
set wildmenu " completion with menu

set fileformat=unix " file mode is unix
set fileformats=unix,dos,mac " detects unix, dos, mac file formats in that order
set viminfo='20,\"500 " remember copy registers after quitting in the .viminfo
" file -- 20 jump links, regs up to 500 lines'

set hidden " allows making buffers hidden even with unsaved changes
set history=1000 " remember more commands and search history
set undolevels=1000 " use many levels of undo

set autoread " auto read when a file is changed from the outside

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set mouse=a " Enable use of the mouse for all modes
set mousemodel=popup_setpos " Right-click on selection should bring up a menu


" Filetype Indentation Mode
filetype plugin indent on

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
"set completeopt=menu,menuone,longest
set completeopt=menu,preview " this is the default
set switchbuf=useopen,usetab


" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_bash = 1
" let g:is_posix = 1

" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
" let mapleader = ","
" let g:mapleader = ","

set wildignore+=*.pyc
set wildignore+=*.o
set wildignore+=*~

autocmd InsertLeave * match ExtraWhitespace /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** Folding SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=indent
set foldlevelstart=99 " all folds open by default

" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" **************************** Clipboard SETTINGS **************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif


" Determines the maximum number of items to show in the popup menu.
" Zero is take as much as possible.
set pumheight=6

" Customize GUI interface
"set guioptions-=m " Turn off GUI menu bar
"set guioptions-=T " Turn off GUI toolbar (icons)
"set guioptions-=r " Turn off GUI right scrollbar
"set guioptions-=L " Turn off GUI left scrollbar

" set vim to 256 colors to work with terminals
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ****************************** Editor SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent " smart auto indenting
set copyindent " copy the previous indentation on autoindenting

" set cindent " smart indenting for c-like code
" set cino=b1,g0,N-s,t0,(0,W4 " see :h cinoptions-values

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" cursor keys cross line boundaries
" set whichwrap+=<,>,h,l
set whichwrap+=h,l

set smarttab " smart tab handling for indenting
set magic " change the way backslashes are used in search patterns

set nobackup " no backup~ files.
"set noswapfile " no .swp files.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab " turn a tab into spaces
set shiftround " makes indenting a multiple of shiftwidth

" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
set textwidth=80

let g:load_doxygen_syntax=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ****************************** Search SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nohlsearch " do not highlight searched-for phrases
"set hlsearch " the opposite, use :noh to stop highlighting
set incsearch " ...but do highlight-as-I-type the search string
set gdefault " this makes search/replace global by default
if v:version >= 704
  " The new Vim regex engine is currently slooooow as hell which makes syntax
  " highlighting slow, which introduces typing latency.
  " Consider removing this in the future when the new regex engine becomes
  " faster.
  set regexpengine=1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ************************** Spellchecking SETTINGS ************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set spell checking for certain filetypes
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType tex setlocal spell
autocmd FileType tex setlocal spelllang=el,en

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** Filetype SETTINGS **************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" add custom filetypes
autocmd BufNewFile,BufRead *.launch set filetype=xml " this is probably handled by vim-ros plugin
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.glsl set filetype=cpp
autocmd BufNewFile,BufRead *.*.glsl set filetype=cpp

autocmd FileType tex filetype plugin on
let g:tex_comment_nospell=1
let g:tex_flavor='latex'
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ****************************** CUSTOM MAPPINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader>v brings up .vimrc
" <leader>V reloads it and makes all changes active (file has to be saved first)
noremap <leader><leader>v :e! $MYVIMRC<CR>
noremap <silent> <leader><leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" map control-backspace to delete the previous word, works only in gvim
imap <C-BS> <C-W>

" Bind Ctrl+<movement> keys to move around the windows,
" instead of using Ctrl+w + <movement>
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k

" Use Shift+<Left, Right> keys to move through buffers.
nmap <silent> <S-Right> :bnext<CR>
nmap <silent> <S-Left> :bprevious<CR>

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** Display SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set scrolloff=2 " 2 lines above/below cursor when scrollin
set showmatch " show matching bracket (briefly jump)
set matchtime=2 " reduces matching paren blink time from the 5[00]ms def
set ttimeoutlen=50 " remove delay detween insert and normal mode
" set title " show file in titlebar
set showcmd " show typed command in status bar
set number " Display absolute line numbers on the left
set relativenumber

set noshowmode " don't show vim's insert mode
set laststatus=2 " the statusline is now always shown

" show whitespace in cpph files
set list listchars=tab:▸-,trail:_,extends:>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" **************************************************************************** "
" ********************************** PLUGINS ********************************* "
" **************************************************************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** NERDTree SETTINGS **************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

" Open NERDTree when vim starts up
" autocmd vimenter * NERDTree

"let NERDTreeDirArrows=0 " Use + ~ chars for directories
"let NERDTreeMinimalUI=1 " Remove excess information bars
"let NERDTreeShowBookmarks=1 " Show Bookmarks

let g:NERDTreeWinSize=30

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** Airline SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '¦'
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1

if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" change default colors for airline
let g:airline_theme = 'kolor'

" enable powerline symbols, needs powerline fonts installed
let g:airline_powerline_fonts = 1

" change default font for gvim to enable powerline symbols
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Plus\ Font\ Awesome\ Plus\ Octicons\ Plus\ Pomicons\ 10
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" **************************** indentLine SETTINGS *************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" indentLine settings
" change default indent character for indentLine
" let g:indentLine_char = '┊'
" disable indentLine plugin on startup
" let g:indentLine_enabled = 0
let g:indentLine_color_term = 239

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ************************** YouCompleteMe SETTINGS ************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_complete_in_comments_and_strings  = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0 "Don't ask for confirmation every time
let g:ycm_global_ycm_extra_conf='~/.dotfiles/.ycm_extra_conf.py'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** Startify SETTINGS **************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_session_dir = "~/.vim/sessions"
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
let g:startify_bookmarks = ['~/.vimrc', '~/.bashrc']
nnoremap <F1> :Startify<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *************************** Clang-format SETTINGS ************************** "
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ************************** NERDCommenter SETTINGS ************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leave space after comment
" let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** Syntastic SETTINGS *************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_error_symbol = ' '
let g:syntastic_style_error_symbol = ' '
let g:syntastic_warning_symbol = ' '
let g:syntastic_style_warning_symbol = ' '

let g:syntastic_c_include_dirs = ['../../../include', '../../include', '../include', 'include']
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_include_dirs = ['../../../include', '../../include', '../include', 'include']
let g:syntastic_cpp_check_header = 1

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'

" Stop YCM from performing diagnostics
let g:ycm_show_diagnostics_ui = 0

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python Coding Standards
let g:syntastic_python_checkers = ['pep8', 'flake8']
let g:syntastic_python_python_exec = '/usr/bin/python2/'

let g:syntastic_cpp_checkers = ['clang_check', 'gcc']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ****************************** Tagbar SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toogle TagBar with <F8>
nmap <F8> :TagbarToggle<CR>

let g:tagbar_left = 1
let g:tagbar_vertical = 10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" **************************** UltiSnips SETTINGS **************************** "
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ******************************* Jedi SETTINGS ****************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:jedi#auto_initialization=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ************************** C++ Highlight SETTINGS ************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:cpp_class_scope_highlight = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ****************************** CtrlP SETTINGS ****************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_max_height = 30

" let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ****************************** Gundo SETTINGS ****************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gundo_width = 40
let g:gundo_right = 1

nnoremap <C-G> :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ************************** MatchTagAlways SETTINGS ************************* "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mta_use_matchparen_group = 0
nnoremap <leader>tj :MtaJumpToOtherTag<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** Fugitive SETTINGS **************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***************************** VimProc SETTINGS ***************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimshell_prompt=$USER."@".hostname().": "
let g:vimshell_editor_command='vim'
" let g:vimshell_right_prompt='getcwd()'
let g:vimshell_user_prompt='fnamemodify(getcwd(), ":~")'
let g:vimshell_vimshrc_path='~/.vim/vimshell/.vimshrc'

nnoremap <leader>vs :VimShell<CR>
nnoremap <leader>vss :VimShell -split<CR>
nnoremap <leader>vsp :VimShellInteractive ipython<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" **************************** LaTeX-Box SETTINGS **************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LaTeXBox_output_type='' "Let latexmkrc choose the type

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *************************** Vim-Devicons SETTINGS ************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bash'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zsh'] = ''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ************************** Vim-Gitgutter SETTINGS ************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '
let g:gitgutter_sign_removed_first_line = ' '
let g:gitgutter_sign_modified_removed = ' '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *************************** Colorscheme SETTINGS *************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" These settings should remain at the end of the file if you want to override
" fixed colorscheme settings
set background=dark " enable for dark terminals

highlight Normal ctermfg=white ctermbg=234

" set cursorline
" highlight CursorLine cterm=bold cterm=bold ctermbg=darkred ctermfg=3
" highlight CursorColumn cterm=bold cterm=bold ctermbg=darkred ctermfg=3

if has('gui_running')
  colorscheme solarized
endif

" Highlight comments
highlight Comment term=bold cterm=bold ctermfg=1

set colorcolumn=81,121 " Highlight the columns after the textwidth
highlight colorcolumn ctermbg=4

" Highlight Functions
highlight Function term=bold cterm=bold ctermfg=39
" Highlight Visual Mode
highlight Visual term=bold cterm=bold ctermfg=240
"
highlight Type term=bold cterm=bold ctermfg=136
" Highlight strings
highlight String term=bold cterm=bold ctermfg=132
" Highlight preprocessor commands
highlight PreProc term=bold cterm=bold ctermfg=218
" Highlight constants. Also works with C++ STL and BOOST.
highlight Constant term=bold cterm=bold ctermfg=35
"
highlight Special term=bold cterm=bold ctermfg=178
" Highlight trailing whitespaces
highlight ExtraWhitespace term=bold cterm=bold ctermbg=160

highlight Pmenu term=bold cterm=bold ctermfg=26
highlight Identifier term=bold cterm=bold

highlight Conditional term=bold cterm=bold ctermfg=136

" Highlight statements (for, if etc.)
highlight Statement term=bold cterm=bold

" Highlight errors and style errors
highlight SpellBad term=bold cterm=bold ctermbg=124
highlight SpellCap term=bold cterm=bold ctermbg=208

"
highlight LineNr ctermfg=150 ctermbg=235

" Syntastic Highlight Settings
highlight SyntasticErrorSign ctermfg=232 ctermbg=160
highlight SyntasticWarningSign ctermfg=235 ctermbg=220
highlight SyntasticStyleErrorSign ctermfg=226 ctermbg=88
highlight SyntasticStyleWarningSign ctermfg=208 ctermbg=235
