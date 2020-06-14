" Alias to save file with sudo
" cmap w!! w !sudo tee > /dev/null %

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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

function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTreeToggle
    endif
endfunction

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

function! s:add_namespace(lines)
    let s:full = split(join(a:lines), " ")[0]
    let s:name = split(s:full, "\\")[-1]

    call s:append_use(0, s:full)
    " call composer#namespace#use(0, s:full)

    return s:name
endfunction

function! s:append_use(sort, ...) abort
  let class = get(a:000, 0, '')
  let alias = get(a:000, 1, '')
  let sort = !empty(a:sort)

  if !empty(composer#namespace#using(empty(alias) ? class : alias))
    echohl WarningMsg
    echomsg 'Use statement for ' . class . ' already exists'
    echohl None
    return
  endif

  call s:append_use_only(class, alias)

  if sort
    call composer#namespace#sort_uses()
  endif

  return ''
endfunction

function! s:append_use_only(class, alias)
    let line = 'use ' . a:class
    if !empty(a:alias)
        let line .= ' as ' . a:alias
    endif
    let line .= ';'

    let pos = search('^use\_s\_[[:alnum:][:blank:]\\,_]\+;', 'nwbe')
    if pos > 0
        call append(pos, line)
        return ''
    endif

    let pos = search('^\s*namespace\_s\_[[:alnum:]\\_]\+;', 'nwbe')
    if pos > 0
        call append(pos+1, '')
        call append(pos+1, line)
        return ''
    endif

    let pos = search('<?\%(php\)\?', 'nwbe')
    if pos > 0
        call append(pos, '')
        call append(pos, line)
        return ''
    endif

    call append(line('.'), line)
    return ''
endfunction

function! ShowDbextSettings()
    let name='g:dbext_default_profile_' . g:dbext_default_profile
    execute 'echo g:dbext_default_profile . '' -> '' . ' . name
endfunction

function! CompletePhpClass()
    return fzf#complete({
        \ 'source':   '/home/sol/bin/listGreppedClasses.php',
        \ 'reducer':  function('s:add_namespace'),
        \ 'down':     20})
endfunction
