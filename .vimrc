" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'       " The Nerd Commenter
Plugin 'scrooloose/nerdtree'            " The Nerd Tree
Plugin 'jistr/vim-nerdtree-tabs'        " keeps NerdTree in left window all the time
Plugin 'Xuyuanp/nerdtree-git-plugin'    " git status flags in nerdtree
Plugin 'mkitt/tabline.vim'              " shows tab number, filename and [+]
"Plugin 'bling/vim-airline'             " better status line
Plugin 'everzet/phpfolding.vim'         " folding of php code
Plugin 'majutsushi/tagbar'              " right window with tags
Plugin 'airblade/vim-gitgutter'         " shows git +/-/~
Plugin 'scrooloose/syntastic'           " checks for syntax errors on saving
Plugin 'tpope/vim-fugitive'             " git integration
Plugin 'tpope/vim-surround'             " manipulate surroundings in pairs
Plugin 'tpope/vim-repeat'               " enable repeating with '.' for plugins
"Plugin 'xolox/vim-misc'                " required by vim-easytags
"Plugin 'xolox/vim-easytags'            " create/update ctags
Plugin 'kien/ctrlp.vim'                 " CtrlP
Plugin 'joonty/vdebug'                  " xdebug
Plugin 'StanAngeloff/php.vim'           " better PHP syntax
"Plugin 'vim-scripts/LargeFile'         " better large files support
"Plugin 'Yggdroot/indentLine'           " show indent levels
call vundle#end()
filetype plugin on
"filetype plugin indent off

" GUI settings
colorscheme pablo
set guifont=Monospace\ 12
set background=dark

" Indending
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Other
set bs=2                " allow backspacing over everything in insert mode
set nobackup            " don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store >50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set nonumber            " don't show line numbers
set cursorline          " show cursor line
set scrolloff=2         " keep 2 lines before scroll
set sidescrolloff=5     " keep 2 lines before scroll
set showtabline=2       " always show tabline
set wildmenu            " command-line completion with menu

let mysyntaxfile    = "~/.vim/mysyntax.vim"
let myfiletypefile  = "~/.vim/myfiletype.vim"
let vimpager_passthrough = 1 " for vimpager
let g:nerdtree_tabs_open_on_console_startup = 0
let g:gitgutter_realtime = 0
let NERDTreeShowHidden = 1 " show dotfiles
let g:indentLine_color_term = 7
let g:indentLine_char = '·' " ''  '︙'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" my keys
map         <F9>        /\t\+ \+\\| \+\t\+\\|\s\+$/<CR>
map         <C-N>       :NERDTreeTabsToggle<CR>
" nnoremap    <C-T>       :TagbarToggle<CR>
nnoremap    <C-F>       :GitGutterToggle<CR>
" map         <F5>        :set foldmethod=marker<CR>:set foldmarker=\/**,*\/<CR>
map         <C-\>       "9yiw:CtrlP<CR><C-\>r9

" testing
nnoremap    *           *N

"  " tmux fix http://superuser.com/questions/237751
"  map <Esc>[B <Down>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Highlighting
hi      MyUnwantedChars ctermbg=red   guibg=red
match   MyUnwantedChars /\t\+ \+\| \+\t\+\|\s\+$/
hi      StatusLine      ctermbg=grey  ctermfg=black
" hi    CursorLine      ctermbg=DarkGrey
hi      TabLine         ctermfg=Black ctermbg=White cterm=NONE
hi      TabLineFill     ctermfg=Black ctermbg=White cterm=NONE
hi      TabLineSel      ctermfg=White ctermbg=Blue  cterm=NONE

" for crontab editing
au FileType crontab setlocal bkc=yes

