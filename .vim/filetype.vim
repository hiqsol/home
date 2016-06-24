" for crontab editing
au! FileType crontab setlocal bkc=yes

"au! Syntax pgsql runtime! /home/sol/.vim/my_pgsql.vim

au! BufNewFile,BufRead *.phl,*.pht,.php_cs      set filetype=php
au! BufNewFile,BufRead *.sql,*.SQL              set filetype=pgsql
au! BufNewFile,BufRead *.tpl,*.tmpl,*.xml.dist  set filetype=xml
au! BufNewFile,BufRead *.md                     set filetype=markdown

