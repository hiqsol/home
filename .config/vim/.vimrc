" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mysyntaxfile    = "~/.vim/syntax.vim"
let myfiletypefile  = "~/.vim/filetype.vim"

source ~/.vim/plugins.vim
source ~/.vim/options.vim
source ~/.vim/promptline.vim
source ~/.vim/keys.vim
source ~/.vim/functions.vim

syntax on
