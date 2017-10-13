" Alias to save file with sudo
" cmap w!! w !sudo tee > /dev/null %
command W :w !sudo tee > /dev/null %

" FUNCTIONS

function! SignColumnToggle()
    if &signcolumn == "yes"
        set signcolumn=no
    else
        set signcolumn=yes
    endif
endfunction

function! WinPerform(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinPerform(<q-args>)

function! OnlyAndNerdtree()
    let currentWindowNo = win_getid()

    windo if win_getid() != currentWindowNo && &filetype != 'nerdtree' | close | endif
endfunction

command! Only call OnlyAndNerdtree()
