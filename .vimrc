" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Editing plugins
Plugin 'tpope/vim-unimpaired'           " pairs of handy bracket mappings
Plugin 'tpope/vim-surround'             " manipulate surroundings in pairs
Plugin 'tpope/vim-repeat'               " enable repeating with '.' for plugins

" HUD plugins
Plugin 'scrooloose/nerdtree'            " The Nerd Tree
Plugin 'jistr/vim-nerdtree-tabs'        " keeps NerdTree in left window all the time
Plugin 'mkitt/tabline.vim'              " shows tab number, filename and [+]
Plugin 'valloric/listtoggle'            " toggles display of quickfix and location list

" Git plugins
Plugin 'tpope/vim-fugitive'             " git integration
Plugin 'Xuyuanp/nerdtree-git-plugin'    " git status flags in nerdtree
Plugin 'airblade/vim-gitgutter'         " shows git diff in signs column

" Programming plugins
Plugin 'joonty/vdebug'                  " debugger
Plugin 'scrooloose/nerdcommenter'       " commenting shortcuts
Plugin 'scrooloose/syntastic'           " checks for syntax errors on saving
Plugin 'majutsushi/tagbar'              " right window with tags
Plugin 'foosoft/vim-argwrap'            " wrap and unwrap arguments
Plugin 'michaeljsmith/vim-indent-object' " move identation level
Plugin 'diepm/vim-rest-console'         " REST client
Plugin 'aquach/vim-http-client'         " another REST client

" CTAGS automation
"Plugin 'xolox/vim-misc'                " required by vim-easytags
"Plugin 'xolox/vim-easytags'            " create/update ctags

" Syntax highlighting plugins
Plugin 'hiqsol/vim-markdown'            " better Markdown
Plugin 'hiqsol/pgsql.vim'               " better PostgreSQL
Plugin 'elzr/vim-json'                  " better JSON

" PHP plugins
Plugin 'StanAngeloff/php.vim'           " better syntax highlighting for PHP
Plugin 'everzet/phpfolding.vim'         " folding of PHP code
Plugin 'PDV--phpDocumentor-for-Vim'     " PHPdoc generator
Plugin 'alvan/vim-php-manual'           " PHP manual
"Plugin 'joonty/vim-phpqa'              " show code coverage

" Other plugins
Plugin 'kien/ctrlp.vim'                 " CtrlP
Plugin 'rkitover/vimpager'              " Vimpager
"Plugin 'bling/vim-airline'             " better status line
"Plugin 'vim-scripts/LargeFile'         " better large files support
"Plugin 'Yggdroot/indentLine'           " show indent levels

call vundle#end()
filetype plugin on
"filetype plugin indent off

" GUI settings
colorscheme pablo
set guifont="Monospace 11"
set background=dark

" Indending
set autoindent
set smartindent
set tabstop=4                   " number of spaces that a <Tab> in the file counts for
set softtabstop=-1              " number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=0                " number of spaces to use for each step of (auto)indent
set expandtab                   " use the appropriate number of spaces to insert a <Tab>
set smarttab
set bs=2                        " allow backspacing over everything in insert mode

" Keyboard
set t_kb=
fixdel

" save, undo & backup
set autowrite
set undofile                    " allows undo after reopen file
set undodir=/home/sol/.vim/undo
set nobackup                    " don't keep a backup file
set viminfo='20,\"50            " read/write a .viminfo file, don't store >50 lines of registers
set history=99                  " keep 50 lines of command line history

" HUD
set ruler                       " show the cursor position all the time
set relativenumber              " show relative line numbers
set nonumber                    " don't show absolute line
set cursorline                  " show cursor line
set showtabline=2               " always show tabline
set laststatus=2                " always show status line
set scrolloff=2                 " keep 2 lines before scroll
set sidescrolloff=5             " keep 5 columns before horizontal scroll

" Search
set path+=**                    " `:find` down into subfolders
set wildmenu                    " command-line completion with menu
set wildmode=longest:full,full
set hlsearch                    " highlight search

let mysyntaxfile    = "~/.vim/syntax.vim"
let myfiletypefile  = "~/.vim/filetype.vim"

" Plugin options
let vimpager_passthrough = 1 " for vimpager
let g:nerdtree_tabs_open_on_console_startup = 0
" let g:gitgutter_realtime = 0
let NERDTreeShowHidden = 1 " show dotfiles
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']
let g:indentLine_color_term = 7
let g:indentLine_char = '·' " ''  '︙'
let g:markdown_fenced_languages = ['php', 'python', 'sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'yaml', 'yml=yaml', 'xml']
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0

syntax on

" KEYS. Available ctrls for later use: <C-Y>, <C-J>, <C-E>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap    p           <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" mouse paste without auto indenting
nnoremap    \R          :r! cat<CR>

" Search keys
nnoremap    *           *N
nnoremap    \<Space>    /\t\+ \+\\| \+\t\+\\|\s\+$/<CR>

" HUD keys
nnoremap    <C-S>       :update<CR>
nnoremap    <C-N>       :NERDTreeTabsToggle<CR>
"nnoremap    <C-F>       :NERDTreeTabsClose<CR>:SyntasticReset<CR>:Windo set relativenumber!<CR>:GitGutterToggle<CR>
nnoremap    \f          :NERDTreeFind<CR>:NERDTreeTabsOpen<CR>
nnoremap    \g          :echo expand('%:p')<CR>
nnoremap    <C-W>o      :Only<CR>

" Fugitive keys
nnoremap    gl          :Glog<CR>
nnoremap    gb          :Gblame<CR>
nnoremap    gd          :Gdiff<CR>
nnoremap    ge          :Gedit<CR>

" Programming keys
nnoremap    \d          :call PhpDocSingle()<CR>
vnoremap    \d          :call PhpDocRange()<CR>
nnoremap    \T          :TagbarToggle<CR>
nnoremap    \w          :ArgWrap<CR>
map         gp          <C-P><C-\>w

" Alias to save file with sudo
" cmap w!! w !sudo tee > /dev/null %
command W :w !sudo tee > /dev/null %

" FUNCTIONS

function! WinPerform(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinPerform(<q-args>)

function! OnlyAndNerdtree()
    let currentWindowNo = win_getid()

    windo if win_getid() != currentWindowNo && &filetype != 'nerdtree' | close | endif
endfunction

command! Only call OnlyAndNerdtree()
