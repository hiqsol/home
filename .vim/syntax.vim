" my additional highlighting
hi      MyUnwantedChars ctermbg=red   guibg=red
match   MyUnwantedChars /\t\+ \+\| \+\t\+\|\s\+$/

" GUI colors
hi      Search          ctermbg=magenta ctermfg=white
hi      StatusLine      ctermbg=gray  ctermfg=black
" hi    CursorLine      ctermbg=darkgray
hi      TabLine         ctermfg=black ctermbg=white cterm=NONE
hi      TabLineFill     ctermfg=black ctermbg=white cterm=NONE
hi      TabLineSel      ctermfg=white ctermbg=blue  cterm=NONE

" vimdiff colors
hi      DiffChange      ctermbg=yellow
hi      DiffText        ctermbg=red

" GitGutter colors
hi      GitGutterAdd          ctermbg=darkgreen
hi      GitGutterChange       ctermbg=darkblue
hi      GitGutterDelete       ctermbg=yellow
hi      GitGutterChangeDelete ctermbg=yellow

" markdown colors
hi def link markdownCode                String
hi def link markdownUrl                 Function
hi def link markdownGreedyId            Operator
hi def link markdownHeadingDelimiter    htmlH1

" HTML colors
hi      htmlLink        ctermfg=green

" programming languages syntax colors
hi      Normal          ctermfg=white
hi      Comment         ctermfg=red
    hi  phpDocTags      ctermfg=darkcyan
    hi  phpDocParam     ctermfg=darkgreen
hi      Constant        ctermfg=brown
    hi  Boolean         ctermfg=magenta
    hi  Number          ctermfg=magenta
    hi  Float           ctermfg=magenta
    hi  Character       ctermfg=yellow
    hi  SpecialChar     ctermfg=red
    hi  String          ctermfg=yellow
hi      Identifier      ctermfg=white
    hi  Function        ctermfg=cyan
hi      Statement       ctermfg=darkcyan
    hi  Conditional     ctermfg=cyan
    hi  Repeat          ctermfg=darkcyan
    hi  Label           ctermfg=darkcyan
    hi  Operator        ctermfg=gray
    hi  Keyword         ctermfg=gray
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
    hi  Delimiter       ctermfg=gray
    hi  SpecialComment  ctermfg=red
    hi  Debug           ctermfg=red
hi      Ignore          ctermfg=darkgray
hi      Error           ctermbg=red
hi      Todo            ctermbg=darkred ctermfg=white
hi      LineNr          ctermfg=darkgray

