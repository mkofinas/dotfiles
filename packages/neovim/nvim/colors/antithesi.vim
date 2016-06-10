set background=dark " enable for dark terminals

highlight Normal ctermfg=white ctermbg=234

" set cursorline
" highlight CursorLine cterm=bold cterm=bold ctermbg=darkred ctermfg=3
" highlight CursorColumn cterm=bold cterm=bold ctermbg=darkred ctermfg=3

" Highlight comments
highlight Comment term=bold cterm=bold ctermfg=1

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
