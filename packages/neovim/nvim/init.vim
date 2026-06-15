" Neovim Configuration
" ----------------------------
" 1. XDG Specification
" 2. Disable netrw
" 3. Plugin Manager: Vim-Plug
" 4. Neovim Settings
" 5. Custom Mappings
" 6. Plugin Settings
" 7. Colorscheme
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
" Disable netrw (advised for nvim-tree) {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
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
" Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
" Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lua/plenary.nvim'
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'windwp/nvim-autopairs'  " Replaces 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips' | Plug 'mkofinas/vim-snippets'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim', {'branch': 'release'}
Plug 'saghen/blink.cmp', { 'tag': 'v1.*' }
Plug 'saghen/blink.compat', { 'tag': 'v2.*' }
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'neovim/nvim-lspconfig'
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrations {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'npm install'}
Plug 'rhysd/vim-grammarous', { 'for': 'tex' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
" Plug 'taketwo/vim-ros'
Plug 'rhysd/vim-clang-format', { 'do': 'sudo apt install clang-format-3.4', 'for': ['cpp', 'c'] }
" Plug 'Vimjas/vim-python-pep8-indent'
Plug 'stevearc/conform.nvim'
Plug 'nvim-treesitter/nvim-treesitter',  { 'branch': 'main' , 'do': ':TSUpdate'}
Plug 'mbbill/undotree', { 'for': 'tidal' }
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvim-tree/nvim-tree.lua'  " Replaces 'scrooloose/nerdtree' and 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhinz/vim-startify'
Plug 'nvim-lualine/lualine.nvim'  " Replaces 'vim-airline/vim-airline' and 'vim-airline/vim-airline-themes'
" Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'tidalcycles/vim-tidal'
Plug 'olimorris/codecompanion.nvim', {'tag': 'v19.15.0'}
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
" 3}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Display {{{3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ellisonleao/gruvbox.nvim'   " NOTE: Replaces 'morhetz/gruvbox'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'JuliaLang/julia-vim', { 'for': 'julia' }
Plug 'nvim-tree/nvim-web-devicons'  " Replaces 'ryanoasis/vim-devicons'
Plug 'OXY2DEV/markview.nvim'
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
" nvim-tree.lua {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NvimTree with Ctrl+n
map <C-n> :NvimTreeToggle<CR>

" Find the current file in NvimTree
nmap <leader>f :NvimTreeFindFile<CR>

lua << END
require('nvim-tree').setup({
  filters = {
    dotfiles = false,
  },
})
END
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lualine.nvim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require('lualine').setup({
  options = {
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = { 'mode' },                            -- airline_detect_paste (shows PASTE automatically)
    lualine_b = {
      'branch',
      'diff',
      { 'diagnostics', sources = { 'nvim_lsp' } },
    },
    lualine_c = {
      { 'filename' },

    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      { function() return string.format(' %d/%d', vim.fn.line('.'), vim.fn.line('$')) end },
      { function() return string.format(' %d', vim.fn.col('.')) end },
    },
  },
  tabline = {                                          -- airline#extensions#tabline#enabled = 1
    lualine_a = { 'buffers' },
    lualine_z = { 'tabs' },
  },
  extensions = { 'nvim-tree', 'fugitive', 'quickfix' },
})
END
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
        \ "Standard" : "C++03",
        \ "PointerAlignment" : "Left",
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
" nvim-autopairs {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:AutoPairsMapSpace = 0
lua << EOF
require("nvim-autopairs").setup {}
EOF
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
" Vim-Grammarous {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:grammarous#jar_url = 'https://languagetool.org/download/archive/LanguageTool-5.9.zip'
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-lspconfig {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
vim.lsp.config('pyright', {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
  },
})
vim.lsp.enable('pyright')

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  }
})
vim.lsp.enable('ruff')

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local map = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, { buffer = args.buf, silent = true })
    end
    map('gd',         vim.lsp.buf.definition)
    map('gr',         vim.lsp.buf.references)
    map('K',          vim.lsp.buf.hover)
    map('<leader>rn', vim.lsp.buf.rename)
    map('<leader>ca', vim.lsp.buf.code_action)
    map('[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
    map(']d', function() vim.diagnostic.jump({ count =  1, float = true }) end)
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN]  = '',
    },
  },
})
EOF

hi! link DiagnosticSignError ErrorMsg
hi! link DiagnosticSignWarn WarningMsg
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-treesitter {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'bash', 'json', 'toml', 'yaml', 'markdown', 'c', 'cpp' },
  callback = function(args)
    -- highlighting
    vim.treesitter.start()
    -- folds (optional)
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent-blankline.nvim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("ibl").setup()
EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" codecompanion.nvim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("codecompanion").setup({
  adapters = {
    acp = {
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            CLAUDE_CODE_OAUTH_TOKEN = os.getenv("CLAUDE_CODE_OAUTH_TOKEN"),
          },
        })
      end,
    },
  },
})

EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markview.nvim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("markview").setup({
  preview = {
    filetypes = { "markdown", "codecompanion" },
    ignore_buftypes = {},
  },
})
EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" blink.cmp {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
-- Register the UltiSnips source through blink.compat's nvim-cmp shim
require('cmp_nvim_ultisnips').setup({})
require('blink.cmp').setup({
  keymap = {
    preset = 'default',
    ['<CR>'] = { 'accept', 'fallback' },
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    menu = { border = "rounded" },
    documentation = {
      auto_show = false,
    },
  },
  sources = {
    default = { 'lsp', 'path', 'ultisnips', 'buffer' },
    providers = {
      ultisnips = {
        name = 'ultisnips',
        module = 'blink.compat.source',
      },
    },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning"
  }
})
EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noice.nvim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  views = {
    cmdline_popup = {
      border = { style = "rounded" },
    },
    popupmenu = {
      border = { style = "rounded" },
    },
  },
})
EOF
" 2}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" conform.nvim {{{2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("conform").setup({
  formatters_by_ft = {
    python = {
      "ruff_fix",
      "ruff_format",
      "ruff_organize_imports",
    },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
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

lua << EOF
require("gruvbox").setup({
  contrast = "hard",
  overrides = {
    ExtraWhitespace = { link = "GruvboxRed" },
    ErrorMsg        = { link = "GruvboxRedSign" },
    WarningMsg      = { link = "GruvboxYellowSign" },
  },
})
vim.cmd("colorscheme gruvbox")
EOF
" 1}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:foldmethod=marker:foldlevel=0:foldenable
