let g:tex_conceal = ""
let g:tex_comment_nospell=1

setlocal spell
setlocal spelllang=el,en

function! GetTeXEnv()
    let pos = getpos('.')
    let win = winsaveview()
    let env = ''
    let carry_on = 1
    let search_ops = 'bWc'
    let b_start = line('.')
    while carry_on
        keepjumps let b_start = search('\\begin{',search_ops)
        let search_ops = 'bW'
        " Only accept a match at the cursor position on the
        " first cycle, otherwise we wouldn't go anywhere!
        let env = matchstr(getline('.'),'\\begin{\zs.\{-}\ze}')
        let env_esc = escape(env,'*')
        keepjumps let b_end = search('\\end{\s*' . env_esc . '\s*}','Wn')
        if b_start == 0
            " finished searching; stop
            let carry_on = 0
        elseif b_end > b_start && b_end < pos[1]
            " not inside this env; carry on
            let env = ''
        elseif b_end > b_start && b_end >= pos[1] && b_start <= pos[1]
            " found it; stop
            let carry_on = 0
        endif
    endwhile
    call setpos('.',pos)
    call winrestview(win)
    return env
endfunction

function! TeXEquals()
  if GetTeXEnv() != ''
    return 120
  else
    return 80
  endif
endfunction

autocmd InsertEnter *.tex let &textwidth=TeXEquals()
autocmd InsertLeave *.tex setlocal textwidth=80
