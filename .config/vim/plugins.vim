" PLUG installation
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
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'rkitover/vimpager'              " Vimpager
Plug 'valloric/listtoggle'            " toggles display of quickfix and location list
Plug 'ervandew/supertab'              " <Tab> for completion
Plug 'mbbill/undotree'                " undo history visualizer

" NerdTree
Plug 'jistr/vim-nerdtree-tabs',     { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind'] }
Plug 'scrooloose/nerdtree',         { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeTabsToggle', 'NERDTreeFind'] }

" Snippets
Plug 'SirVer/ultisnips'               " snippet runner
Plug 'honza/vim-snippets'             " snippets library

" Prompts plugins
Plug 'edkolev/promptline.vim'

" Git plugins
Plug 'airblade/vim-gitgutter'         " shows git diff in signs column
Plug 'tpope/vim-fugitive'             " git integration

" Programming plugins
Plug 'aquach/vim-http-client'         " another REST client
Plug 'diepm/vim-rest-console'         " REST client
Plug 'foosoft/vim-argwrap'            " wrap and unwrap arguments
Plug 'joonty/vdebug',                       {'on': 'VdebugRun'}
Plug 'majutsushi/tagbar'              " right window with tags
Plug 'michaeljsmith/vim-indent-object' " move identation level
Plug 'scrooloose/nerdcommenter'       " commenting shortcuts
Plug 'scrooloose/syntastic'           " checks for syntax errors on saving
Plug 'autozimu/LanguageClient-neovim',      {'do': ':UpdateRemotePlugins'}
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
"Plug 'kien/ctrlp.vim'                " substituted with FZF
"Plug 'roxma/python-support.nvim'     " configured manually

call plug#end()

" Plugin options
let g:vimpager_passthrough = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']
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
let g:SuperTabNoCompleteAfter = ['^', '\s', '"', "'", ',', '.', ':']
