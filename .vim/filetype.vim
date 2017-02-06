" for crontab editing
au! FileType crontab setlocal bkc=yes

"au! Syntax pgsql runtime! /home/sol/.vim/my_pgsql.vim

au! BufNewFile,BufRead *.phl,*.pht,.php_cs      set filetype=php
au! BufNewFile,BufRead *.sql,*.SQL              set filetype=pgsql
au! BufNewFile,BufRead *.tpl,*.tmpl,*.xml.dist  set filetype=xml
au! BufNewFile,BufRead *.md                     set filetype=markdown
au! BufNewFile,BufRead composer.lock            set filetype=json

autocmd FileType php let b:syntastic_php_phpmd_args =
    \ @% . ' text /home/sol/.vim/phpmd.xml'
