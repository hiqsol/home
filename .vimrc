" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'        " The NerdTree
Plugin 'jistr/vim-nerdtree-tabs'    " keeps NerdTree in left window all the time
Plugin 'mkitt/tabline.vim'          " shows tab number, filename and [+]
"Plugin 'bling/vim-airline'         " better status line
"Plugin 'everzet/phpfolding.vim'    " folding of php code
Plugin 'majutsushi/tagbar'          " right window with tags
Plugin 'airblade/vim-gitgutter'     " shows git +/-/~
Plugin 'scrooloose/syntastic'       " checks for syntax errors on saving
Plugin 'tpope/vim-fugitive'         " git integration
call vundle#end()
filetype plugin indent off

" GUI settings
colorscheme pablo
set guifont=Terminus\ 13
set background=dark

" Space formatting
set tabstop=4
set shiftwidth=4
set expandtab

" Other
set bs=2                " allow backspacing over everything in insert mode
set noai                " always set NO autoindenting
set nobackup            " don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store >50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set nonumber            " don't show line numbers
set cursorline          " show cursor line
set scrolloff=2         " keep 2 lines before scroll
set showtabline=2       " always show tabline

let mysyntaxfile    = "~/.mysyntax.vim"
let myfiletypefile  = "~/.myfiletype.vim"
let vimpager_passthrough = 1 " for vimpager

" my keys
map         <F7>        :tabprev<CR>
map         <F8>        :tabnext<CR>
map         <F9>        /\t\+ \+\\| \+\t\+\\|\s\+$/<CR>
map         <C-N>       :NERDTreeTabsToggle<CR>
nnoremap    <C-T>       :TagbarToggle<CR>
nnoremap    <C-F>       :GitGutterToggle<CR>
map         <F5>        :set foldmethod=marker<CR>:set foldmarker=\/**,*\/<CR>
" testing
nnoremap    *           *N

"  " tmux fix http://superuser.com/questions/237751
"  map <Esc>[B <Down>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" highlight unwanted chars
hi      MyUnwantedChars ctermbg=red guibg=red
match   MyUnwantedChars /\t\+ \+\| \+\t\+\|\s\+$/

" highlight vim elements
hi      StatusLine ctermbg=grey ctermfg=black
" hi      CursorLine ctermbg=DarkGrey

" tab colors
hi TabLine      ctermfg=Black  ctermbg=White cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=White cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=Blue  cterm=NONE

" for crontab editing
au FileType crontab setlocal bkc=yes

