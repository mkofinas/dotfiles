" Neovim Configuration
" ----------------------------------
" 1. Load Plugin Manager and Plugins
" 2. Set Custom Preferences
" 3. Set Custom Mappings
" 4. Configure Plugins Settings
" ----------------------------------
" Author(s):
" - Miltiadis Kofinas <mkofinas@gmail.com>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager: Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Download Vim-Plug and Install Plugins {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/bundle')

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'benekastah/neomake'
Plug 'majutsushi/tagbar', { 'do': 'sudo apt-get install exuberant-ctags' }
Plug 'taketwo/vim-ros'
Plug 'rhysd/vim-clang-format', { 'do': 'sudo apt-get install clang-format-3.4', 'for': ['cpp', 'c'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'SirVer/ultisnips' | Plug 'mkofinas/vim-snippets'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrations {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown', 'do': 'sudo npm -g install instant-markdown-d' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Display {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'chriskempson/base16-vim'
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' }
Plug 'JuliaLang/julia-vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c'] }
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'xml'] }
Plug 'ryanoasis/vim-devicons'
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call plug#end() " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General {{{
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

set clipboard+=unnamedplus
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion {{{
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
set completeopt=menuone,longest,preview
" Determines the maximum number of items to show in the popup menu.
" Zero is take as much as possible.
set pumheight=6
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set nobackup " No backup (*~) files
set noswapfile " No swap (*.swp) files

" Maximum width of text that is being inserted.
set textwidth=80

let g:load_doxygen_syntax=1
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation {{{
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
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search/Replace {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab " Insert/Remove spaces according to shiftwidth
set magic " Change the way backslashes are used in search patterns

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set hlsearch " Highlight matched phrases
set incsearch " Highlight as I type the search string
set gdefault " This makes search/replace global by default
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.launch set filetype=xml
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.glsl set filetype=cpp
autocmd BufNewFile,BufRead *.*.glsl set filetype=cpp
autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh

let g:tex_flavor='latex'
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellchecking {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType tex setlocal spell
autocmd FileType tex setlocal spelllang=el,en

let g:tex_comment_nospell=1
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title " Show file name as window title
set showcmd " Show typed command in the last line
set number " Display absolute line number for the current line on the left
set relativenumber " Display relative line numbers on the left
set noshowmode " Don't show Vim modes in the last line
set laststatus=2 " Always show the statusline

set scrolloff=1 " 1 line above/below cursor when scrolling

set list listchars=tab:▸-,trail:─,extends:>
set fillchars=vert:│
set colorcolumn=81,121
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings {{{
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
nnoremap <space> i<space><Esc>
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
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages Support {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.4'
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']
let NERDTreeShowHidden=1

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'none')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', 'none')
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Airline {{{
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

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" Enable powerline symbols
let g:airline_powerline_fonts = 1

let g:airline_theme = 'base16_atelierforest'
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_color_term = 239
let g:indentLine_bufNameExclude = ['NERD_tree.*']
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_complete_in_comments_and_strings  = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0 "Don't ask for confirmation every time
let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'
" Stop YCM from performing diagnostics
let g:ycm_show_diagnostics_ui = 0
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Startify {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_dir = "~/.config/nvim/sessions"
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
let g:startify_bookmarks = ['~/.config/nvim/init.vim', '~/.vimrc', '~/.bashrc', '~/.zshrc', '~/.tmux.conf']
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Clang-Format {{{
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
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leave space after comment
let NERDSpaceDelims = 1
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost,BufEnter * Neomake
autocmd! QuitPre * let g:neomake_verbose = 0

let g:neomake_error_sign = { 'text': ' ', 'texthl': 'ErrorMsg' }
let g:neomake_warning_sign = { 'text': ' 😠','texthl': 'WarningMsg' }

let g:neomake_c_enabled_makers = ['clang']
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_sh_enabled_makers = ['shellcheck']

let g:neomake_list_height = 3
let g:neomake_open_list = 2

" TODO: Search for header files for C-family languages (like Syntastic)
" let g:syntastic_c_include_dirs = ['../../../include', '../../include', '../include', 'include']
" let g:syntastic_c_check_header = 1
" let g:syntastic_cpp_include_dirs = ['../../../include', '../../include', '../include', 'include']
" let g:syntastic_cpp_check_header = 1
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

let g:tagbar_left = 1
let g:tagbar_vertical = 10
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips {{{
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
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ******************************* Jedi SETTINGS ****************************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:jedi#auto_initialization=0
let g:jedi#completions_enabled = 0
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Cpp-Enhanced-Highlight {{{
let g:cpp_class_scope_highlight = 1
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gundo_width = 40
let g:gundo_right = 1

nnoremap <C-G> :GundoToggle<CR>
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MatchTagAlways {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mta_use_matchparen_group = 0
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Fugitive {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gbrowse<CR>
nnoremap <silent> <leader>gl :Glog<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX-Box {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LaTeXBox_output_type='' "Let latexmkrc choose the type
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Devicons {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['bash'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zsh'] = ''
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Gitgutter {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '
let g:gitgutter_sign_removed_first_line = ' '
let g:gitgutter_sign_modified_removed = ' '
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Instant-Markdown {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Tmux-Navigator {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down> :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

let g:tmux_navigator_save_on_switch = 1
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Better-Whitespace {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * StripWhitespace
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'tex']
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
colorscheme base16-atelierforest
highlight VertSplit guifg=#5ab738 guibg=#1b1918 gui=none
highlight ErrorMsg guifg=#df5320 guibg=#2c2421 gui=none
highlight WarningMsg guifg=#d5911a guibg=#2c2421 gui=none
highlight ExtraWhitespace guibg=#ff0000
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0:foldenable
