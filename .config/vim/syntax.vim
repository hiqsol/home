" my additional highlighting
hi      MyUnwantedChars ctermbg=red   guibg=red
match   MyUnwantedChars /\t\+ \+\| \+\t\+\|\s\+$/

" GUI colors
hi      ColorColumn     ctermbg=234
hi      SignColumn      ctermbg=16
hi      Search          ctermbg=166   ctermfg=white
hi link QuickFixLine    Search
hi      StatusLine      ctermbg=gray  ctermfg=black
hi      Folded          ctermbg=234   ctermfg=darkcyan
" hi    CursorLine      ctermbg=darkgray
hi      TabLine         ctermfg=black ctermbg=white cterm=NONE
hi      TabLineFill     ctermfg=black ctermbg=white cterm=NONE
hi      TabLineSel      ctermfg=white ctermbg=blue  cterm=NONE

hi      Pmenu           ctermbg=white ctermfg=black

hi      ALEWarningSign  ctermbg=235 ctermfg=gray

" vimdiff colors
hi      DiffAdd          ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse        gui=reverse
hi      DiffChange       ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse        gui=reverse
hi      DiffDelete       ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse        gui=reverse
hi      DiffText         ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse        gui=reverse

" GitGutter colors
hi      GitGutterAdd          ctermbg=darkgreen
hi      GitGutterChange       ctermbg=darkblue
hi      GitGutterDelete       ctermbg=brown
hi      GitGutterChangeDelete ctermbg=brown

" markdown colors
hi def link markdownCode                String
hi def link markdownUrl                 Function
hi def link markdownGreedyId            Operator
hi def link markdownHeadingDelimiter    htmlH1

" HTML colors
hi      htmlLink        ctermfg=green

" programming languages syntax colors
hi      Normal          ctermfg=252
hi      Comment         ctermfg=red
    hi  phpDocTags      ctermfg=darkcyan
    hi  phpDocParam     ctermfg=green
hi      Constant        ctermfg=darkmagenta
    hi  Boolean         ctermfg=magenta
    hi  Number          ctermfg=magenta
    hi  Float           ctermfg=magenta
    hi  SpecialChar     ctermfg=red
    hi  Character       ctermfg=yellow
    hi  String          ctermfg=yellow
hi      Identifier      ctermfg=white
    hi  Function        ctermfg=cyan
hi      Statement       ctermfg=darkcyan
    hi  Conditional     ctermfg=darkcyan
    hi  Repeat          ctermfg=darkcyan
    hi  Label           ctermfg=darkcyan
    hi  Operator        ctermfg=white
    hi  Keyword         ctermfg=darkcyan
    hi  Exception       ctermfg=cyan
hi      PreProc         ctermfg=darkcyan
    hi  Include         ctermfg=darkcyan
    hi  Define          ctermfg=darkcyan
    hi  Macro           ctermfg=darkcyan
    hi  PreCondit       ctermfg=darkcyan
hi      Type            ctermfg=green
    hi  StorageClass    ctermfg=darkgreen
    hi  Structure       ctermfg=darkgreen
    hi  Typedef         ctermfg=darkgreen
hi      Special         ctermfg=white
    hi  Tag             ctermfg=red
    hi  Delimiter       ctermfg=darkred
    hi  SpecialComment  ctermfg=red
    hi  Debug           ctermfg=red
hi      Ignore          ctermfg=darkgray
hi      Error           ctermbg=red
hi      Todo            ctermbg=darkred ctermfg=white
hi      LineNr          ctermfg=darkgray

"augroup DimInactiveWindows
    "autocmd!
    "autocmd WinEnter * hi CursorLine ctermbg=none
    "autocmd WinLeave * hi CursorLine ctermbg=gray
"augroup END
