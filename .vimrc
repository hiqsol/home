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
Plugin 'majutsushi/tagbar'              " right window with tags
Plugin 'airblade/vim-gitgutter'         " shows git +/-/~
Plugin 'scrooloose/syntastic'           " checks for syntax errors on saving
Plugin 'tpope/vim-fugitive'             " git integration
Plugin 'tpope/vim-unimpaired'           " pairs of handy bracket mappings
Plugin 'tpope/vim-surround'             " manipulate surroundings in pairs
Plugin 'tpope/vim-repeat'               " enable repeating with '.' for plugins
"Plugin 'xolox/vim-misc'                " required by vim-easytags
"Plugin 'xolox/vim-easytags'            " create/update ctags
Plugin 'kien/ctrlp.vim'                 " CtrlP
Plugin 'joonty/vdebug'                  " xdebug
"Plugin 'vim-scripts/LargeFile'         " better large files support
"Plugin 'Yggdroot/indentLine'           " show indent levels
Plugin 'rkitover/vimpager'              " Vimpager

" SYNTAX highlighting
Plugin 'StanAngeloff/php.vim'           " better syntax highlighting for PHP
Plugin 'hiqsol/vim-markdown'            " better syntax highlighting for Markdown
Plugin 'hiqsol/pgsql.vim'               " better syntax highlighting for PostgreSQL

" PHP
Plugin 'everzet/phpfolding.vim'         " folding of php code
Plugin 'PDV--phpDocumentor-for-Vim'     " phpdoc generator
"Plugin 'joonty/vim-phpqa'              " show code coverage
"
call vundle#end()
filetype plugin on
"filetype plugin indent off

" GUI settings
colorscheme pablo
set guifont="Monospace 11"
set background=dark

" Indending
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set bs=2                " allow backspacing over everything in insert mode

" fix backspace
set t_kb=
fixdel

" Other
set undofile            " allows undo after reopen file
set undodir=/home/sol/.vim/undo
set nobackup            " don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store >50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set relativenumber      " show relative line numbers
set nonumber            " don't show absolute line
set cursorline          " show cursor line
set scrolloff=2         " keep 2 lines before scroll
set sidescrolloff=5     " keep 2 lines before scroll
set showtabline=2       " always show tabline
set laststatus=2        " always show status line
set path+=**            " `:find` down into subfolders
set wildmenu            " command-line completion with menu
set wildmode=longest:full,full

let mysyntaxfile    = "~/.vim/syntax.vim"
let myfiletypefile  = "~/.vim/filetype.vim"
let vimpager_passthrough = 1 " for vimpager
let g:nerdtree_tabs_open_on_console_startup = 0
let g:gitgutter_realtime = 0
let NERDTreeShowHidden = 1 " show dotfiles
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']
let g:indentLine_color_term = 7
let g:indentLine_char = '·' " ''  '︙'
let g:markdown_fenced_languages = ['php', 'python', 'sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'yaml', 'yml=yaml', 'xml']

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" my keys
map         <F9>        /\t\+ \+\\| \+\t\+\\|\s\+$/<CR>
map         <C-N>       :NERDTreeTabsToggle<CR>
map         \f          :NERDTreeFind<CR>
map         \g          :echo expand('%:p')<CR>
" nnoremap    <C-T>       :TagbarToggle<CR>
nnoremap    <C-F>       :Windo set relativenumber!<CR>:GitGutterToggle<CR>:NERDTreeTabsToggle<CR>
" map         <F5>        :set foldmethod=marker<CR>:set foldmarker=\/**,*\/<CR>
map         <C-\>       "9yiw:CtrlP<CR><C-\>r9
inoremap    <C-J>       <ESC>:call PhpDocSingle()<CR>i
nnoremap    <C-J>       :call PhpDocSingle()<CR>
vnoremap    <C-J>       :call PhpDocRange()<CR>

" testing
nnoremap    *           *N

"  " tmux fix http://superuser.com/questions/237751
"  map <Esc>[B <Down>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

function! WinPerform(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinPerform(<q-args>)
