" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mylocalfile     = "~/.vim/local.vim"
let mysyntaxfile    = "~/.vim/syntax.vim"
let myfiletypefile  = "~/.vim/filetype.vim"

source ~/.vim/plugins.vim
source ~/.vim/options.vim
source ~/.vim/keys.vim
source ~/.vim/functions.vim

if filereadable(glob(mylocalfile))
    execute 'source' mylocalfile
endif

syntax on
