" PLUG installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Editing plugins
Plug 'foosoft/vim-argwrap'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" HUD plugins
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf',                            {'dir': '~/.config/fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'
Plug 'pbogut/fzf-mru.vim'
Plug 'valloric/listtoggle'
Plug 'scrooloose/nerdtree',                     {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" Shell helpers
Plug 'edkolev/promptline.vim'
Plug 'rkitover/vimpager'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'Xuyuanp/nerdtree-git-plugin',             {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" REST
Plug 'aquach/vim-http-client'
Plug 'diepm/vim-rest-console'

" DB
" Plug 'tpope/vim-dadbod'
Plug 'vim-scripts/dbext.vim'

" Programming plugins
Plug 'autozimu/LanguageClient-neovim',          {'do': ':UpdateRemotePlugins'}
Plug 'joonty/vdebug',                           {'on': 'VdebugRun'}
Plug 'majutsushi/tagbar'
Plug 'michaeljsmith/vim-indent-object'
Plug 'roxma/nvim-completion-manager'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'

" PHP plugins
Plug 'alvan/vim-php-manual'
Plug 'everzet/phpfolding.vim'
Plug 'StanAngeloff/php.vim'
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plug 'roxma/LanguageServer-php-neovim',         {'do': 'composer install && composer run-script parse-stubs'}

" Syntax highlighting plugins
Plug 'elzr/vim-json'
Plug 'hiqsol/pgsql.vim'
Plug 'hiqsol/vim-markdown'
Plug 'lumiliet/vim-twig'

" Snippets
Plug 'SirVer/ultisnips'               " snippet runner
Plug 'honza/vim-snippets'             " snippets library

" Rejected plugins
"Plug 'vim-scripts/LargeFile'         " better large files support, didn't help
"Plug 'Yggdroot/indentLine'           " show indent levels, slows down inteface
"Plug 'mkitt/tabline.vim'             " shows tab number, filename and [+], substituted with vim-airline
"Plug 'joonty/vim-phpqa'              " show code coverage
"Plug 'kien/ctrlp.vim'                " substituted with FZF
"Plug 'roxma/python-support.nvim'     " doesn't help, seems to make worse
"Plug 'jistr/vim-nerdtree-tabs',      " no need with FZF
"Plug 'scrooloose/syntastic'          " substituted with ALE

call plug#end()

" Plugin options
let g:vimpager_passthrough = 1
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
let g:ale_sign_warning = '⇒ '
let g:airline#extensions#ale#enabled = 1

" Vdebug
let g:vdebug_options = {
\   'timeout': 60,
\   'path_maps': {
\       "/app": "/home/sol/prj/ahnames/sol-dev-hipanel.ahnames.com"
\   }
\}

" UltiSnips
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" shumphrey/fugitive-gitlab.vim
let g:fugitive_gitlab_domains = ['https://git.hiqdev.com']

" DBext
let g:dbext_default_prompt_for_parameters=0
