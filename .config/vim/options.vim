" Indending
set autoindent
set smartindent
set tabstop=4                   " number of spaces that a <Tab> in the file counts for
set softtabstop=-1              " number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=0                " number of spaces to use for each step of (auto)indent
set expandtab                   " use the appropriate number of spaces to insert a <Tab>
set smarttab
set bs=2                        " allow backspacing over everything in insert mode
set textwidth=160

" save, undo & backup
set autowrite
set undofile                    " allows undo after reopen file
set undodir=~/.vim/undo
set nobackup                    " don't keep a backup file
set viminfo='20,\"50            " read/write a .viminfo file, don't store >50 lines of registers
set history=999                 " keep given lines of command line history
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
set diffopt+=vertical           " allows vertical diff

" Search
set path+=**                    " `:find` down into subfolders
set wildmenu                    " command-line completion with menu
set wildmode=longest:full,full
set hlsearch                    " highlight search

if has('gui_running')
    source gui.vim
endif
