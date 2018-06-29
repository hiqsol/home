" Alias to save file with sudo
" cmap w!! w !sudo tee > /dev/null %
command W :w !sudo tee > /dev/null %

" FUNCTIONS

function! ToggleLeft()
    if exists(':NERDTreeClose')
        NERDTreeClose
    endif
    call SignColumnToggle()
endfunction

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

function! RunVdebug()
    call plug#load('vdebug')
    python debugger.run()
endfunction

command! VdebugRun call RunVdebug()

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:get_namespace(lines)
    let s:full = split(join(a:lines), " ")[0]
    let s:name = split(s:full, "\\")[-1]
    return s:name . "\nuse " . s:full . ";\n"
endfunction

inoremap <expr> <C-]> fzf#complete({
  \ 'source':   'cat ./namespaces.txt',
  \ 'reducer':  function('<sid>get_namespace'),
  \ 'down':     20})
