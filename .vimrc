" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'bling/vim-airline'
Plugin 'mkitt/tabline.vim'
Plugin 'jistr/vim-nerdtree-tabs'
call vundle#end()
filetype plugin indent off

" GUI settings
colorscheme pablo
set guifont=Terminus\ 13

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
set nonumber
set cursorline
set scrolloff=2
set background=dark
set showtabline=2       " always show tabline

let mysyntaxfile    = "~/.mysyntax.vim"
let myfiletypefile  = "~/.myfiletype.vim"
let vimpager_passthrough = 1 " for vimpager

" my keys
map         <F9>        /\t\+ \+\\| \+\t\+\\|\s\+$/<CR>
map         <C-N>       :NERDTreeTabsToggle<CR>
nnoremap    <C-X>       :tabnext<CR>
nnoremap    <C-T>       :tabnew<SPACE>

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

