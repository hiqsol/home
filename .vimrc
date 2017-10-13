" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" PLUG
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Editing plugins
Plug 'tpope/vim-repeat'               " enable repeating with '.' for plugins
Plug 'tpope/vim-surround'             " manipulate surroundings in pairs
Plug 'tpope/vim-unimpaired'           " pairs of handy bracket mappings
Plug 'jiangmiao/auto-pairs'           " brackets, parens, quotes

" HUD plugins
Plug 'bling/vim-airline'              " better status line
Plug 'jistr/vim-nerdtree-tabs'        " keeps NerdTree in left window all the time
Plug 'kien/ctrlp.vim'                 " CtrlP
Plug 'rkitover/vimpager'              " Vimpager
Plug 'scrooloose/nerdtree'            " The Nerd Tree
Plug 'valloric/listtoggle'            " toggles display of quickfix and location list
Plug 'ervandew/supertab'              " <Tab> for completion

" Prompts plugins
Plug 'edkolev/promptline.vim'

" Git plugins
Plug 'airblade/vim-gitgutter'         " shows git diff in signs column
Plug 'tpope/vim-fugitive'             " git integration
Plug 'Xuyuanp/nerdtree-git-plugin'    " git status flags in nerdtree

" Programming plugins
Plug 'aquach/vim-http-client'         " another REST client
Plug 'diepm/vim-rest-console'         " REST client
Plug 'foosoft/vim-argwrap'            " wrap and unwrap arguments
Plug 'joonty/vdebug'                  " debugger
Plug 'majutsushi/tagbar'              " right window with tags
Plug 'michaeljsmith/vim-indent-object' " move identation level
Plug 'scrooloose/nerdcommenter'       " commenting shortcuts
Plug 'scrooloose/syntastic'           " checks for syntax errors on saving
Plug 'autozimu/LanguageClient-neovim',      {'do': ':UpdateRemotePlugins'}
Plug 'roxma/python-support.nvim'
Plug 'roxma/nvim-completion-manager'

" Syntax highlighting plugins
Plug 'elzr/vim-json'                  " JSON
Plug 'hiqsol/pgsql.vim'               " PostgreSQL
Plug 'hiqsol/vim-markdown'            " Markdown
Plug 'lumiliet/vim-twig'              " TWIG

" PHP plugins
Plug 'alvan/vim-php-manual'           " PHP manual
Plug 'everzet/phpfolding.vim'         " folding of PHP code
Plug 'StanAngeloff/php.vim'           " better syntax highlighting for PHP
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim' " PHPdoc generator
Plug 'roxma/LanguageServer-php-neovim',         {'do': 'composer install && composer run-script parse-stubs'}

" Rejected plugins
"Plug 'vim-scripts/LargeFile'         " better large files support
"Plug 'Yggdroot/indentLine'           " show indent levels, slows down inteface
"Plug 'mkitt/tabline.vim'             " shows tab number, filename and [+], substituted with vim-airline
"Plug 'joonty/vim-phpqa'              " show code coverage

call plug#end()

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
set textwidth=120

" Keyboard options, remove later if ok
" set t_kb=
" if ! has('nvim')
"     fixdel
" endif

" save, undo & backup
set autowrite
set undofile                    " allows undo after reopen file
set undodir=/home/sol/.vim/undo
set nobackup                    " don't keep a backup file
set viminfo='20,\"50            " read/write a .viminfo file, don't store >50 lines of registers
set history=99                  " keep 50 lines of command line history
set hidden                      " required for operations modifying multiple buffers like rename

" HUD
set ruler                       " show the cursor position all the time
set norelativenumber            " don't show relative line numbers
set nonumber                    " don't show absolute line
set cursorline                  " show cursor line
set showtabline=2               " always show tabline
set laststatus=2                " always show status line
set scrolloff=2                 " keep 2 lines before scroll
set sidescrolloff=5             " keep 5 columns before horizontal scroll
set signcolumn=yes              " always show sign column
set diffopt+=vertical           " allows vertical diff

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
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:LanguageClient_autoStart = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:SuperTabDefaultCompletionType = '<C-N>'

source ~/.vim/shell_prompt.vim

" KEYS. Available ctrls for later use: <C-N>
" unusable: CTRL-[, CTRL-H, CTRL-M
" see `:help keycodes` and `:help map-which-keys`

" Make p in Visual mode replace the selected text with the "" register.
vnoremap    p           <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" mouse paste without auto indenting
nnoremap    \R          :r! cat<CR>

" Search keys
nnoremap    *           *N
nnoremap    \<Space>    /\t\+ \+\\| \+\t\+\\|\s\+$/<CR>

" HUD keys
nnoremap    <C-S>       :update<CR>
nnoremap    <C-X>       :close<CR>
nnoremap    <C-W>a      :tabnew<Space>
nnoremap    <C-W>e      :e<CR>
nnoremap    <C-W>Q      :qa<CR>
nnoremap    <C-W>o      :Only<CR>
nnoremap    <C-W>u      <C-W>t<C-W>l
nnoremap    <C-W><Tab>  :tabnew<CR>
nnoremap    <C-W>x      :tabclose<CR>
nnoremap    <C-P>       :CtrlP<CR>
nnoremap    <C-K>       :CtrlPMRU<CR>
nnoremap    \N          :NERDTreeTabsClose<CR>:SyntasticReset<CR>:call SignColumnToggle()<CR>
nnoremap    \n          :NERDTreeTabsToggle<CR>
nnoremap    \f          :NERDTreeFind<CR>:NERDTreeTabsOpen<CR>
nnoremap    \g          :echo expand('%:p')<CR>

" Fugitive keys
nnoremap    gl          :Glog<CR>
nnoremap    gb          :Gblame<CR>
nnoremap    gd          :Gdiff<CR>
nnoremap    ge          :Gedit<CR>
nnoremap    gs          :Gstatus<CR>
nnoremap    gc          :Gcommit --verbose<CR>
nnoremap    gh          :Gpush<CR>
nnoremap    gw          :Gwrite<CR>
nnoremap    gr          :Gread<CR>

" Programming keys
nnoremap    \cd         :call PhpDocSingle()<CR>
vnoremap    \cd         :call PhpDocRange()<CR>
nnoremap    \T          :TagbarToggle<CR>
nnoremap    \w          :ArgWrap<CR>

nnoremap    \k          :call LanguageClient_textDocument_hover()<CR>
nnoremap    <C-]>       :call LanguageClient_textDocument_definition()<CR>
nnoremap    <C-\>       :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap    <F2>        :call LanguageClient_textDocument_rename()<CR>

nnoremap    \e          :HTTPClientDoRequest<CR><C-W>W

" Alias to save file with sudo
" cmap w!! w !sudo tee > /dev/null %
command W :w !sudo tee > /dev/null %

" FUNCTIONS

function! SignColumnToggle()
    if &signcolumn == "yes"
        set signcolumn=no
    else
        set signcolumn=yes
    endif
endfunction

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

syntax on
