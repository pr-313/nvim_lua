function! IsEdgeWindowSelected(direction)
    let l:curwindow = winnr()
    exec "wincmd ".a:direction
    let l:result = l:curwindow == winnr()

    if (!l:result)
        " Go back to the previous window
        exec l:curwindow."wincmd w"
    endif

    return l:result
endfunction

function! GetAction(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:actions = ['vertical resize -', 'resize +', 'resize -', 'vertical resize +']
    return get(l:actions, index(l:keys, a:direction))
endfunction

function! GetOpposite(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:opposites = ['l', 'k', 'j', 'h']
    return get(l:opposites, index(l:keys, a:direction))
endfunction

function! TmuxResize(direction, amount)
    " v >
    if (a:direction == 'j' || a:direction == 'l')
        if IsEdgeWindowSelected(a:direction)
            let l:opposite = GetOpposite(a:direction)
            let l:curwindow = winnr()
            exec 'wincmd '.l:opposite
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    " < ^
    elseif (a:direction == 'h' || a:direction == 'k')
        let l:opposite = GetOpposite(a:direction)
        if IsEdgeWindowSelected(l:opposite)
            let l:curwindow = winnr()
            exec 'wincmd '.a:direction
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    endif

    let l:action = GetAction(a:direction)
    exec l:action.a:amount
endfunction

command! -bang FoldInc setlocal foldmethod=marker | setlocal foldmarker=include_hdl_start,include_hdl_stop | setlocal foldlevel=0 | setlocal foldmethod=manual
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
command! -bang LLL :call SourceConfig()
command! -bang Path :let @+ = expand("%:p")
command! -bang Conf :tabnew ~/.config/nvim/init.vim
command! -bang FoldV setlocal foldmethod=syntax | setlocal foldlevel=0 | setlocal foldmethod=manual
command! -bang LetmeWrite setlocal cpoptions-=W

let g:verilog_disable_indent_lst= "all"
let g:verilog_syntax_fold_lst = "class,function,task,module"

if exists("loaded_matchit")
      let b:match_ignorecase=0
        let b:match_words=
            \ '\<begin\>:\<end\>,' .
            \ '\<randcase\>\|\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
            \ '\<module\>:\<endmodule\>,' .
            \ '\<function\>:\<endfunction\>,' .
            \ '\(`ifdef\|`ifndef\)\>:`else\>:`endif\>,' .
            \ '\<task\>:\<endtask\>,' .
            \ '\<specify\>:\<endspecify\>,' .
            \ '\<include_hdl_start\>:\<include_hdl_stop\>'
    endif
