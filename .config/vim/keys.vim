" KEYS. Available ctrls for later use: <C-N>
" unusable: CTRL-[, CTRL-H, CTRL-M
" see `:help keycodes` and `:help map-which-keys`

" Make p in Visual mode replace the selected text with the "" register.
vnoremap    p           <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" mouse paste without auto indenting
nnoremap    \R          :r! cat<CR>

" Search keys
nnoremap    *           *N
nnoremap    <M-/>       /\c
nnoremap    \<Space>    /\t\+ \+\\| \+\t\+\\|\s\+$/<CR>
nnoremap    \\          /\<\><Left><Left>
nnoremap <silent>   \/  :nohlsearch<CR>

" General movement keys
noremap     <C-E>       <End>

" Selection
nnoremap    <M-v>       (V)

" Input keys
inoremap    <C-A>       <Home>
inoremap    <C-E>       <End>
inoremap    <C-J>       <Down>
inoremap    <C-K>       <Up>
inoremap    <C-L>       <Right>

" Windows/Tabs
nnoremap    <C-W>a      :tabnew<Space>
nnoremap    <C-W>e      :e<CR>
nnoremap    <C-W>Q      :qa<CR>
nnoremap    <C-W>u      <C-W>t<C-W>l
nnoremap    <C-W><Tab>  :tabnew<CR>
nnoremap    <C-W>x      :tabclose<CR>

" HUD keys
nnoremap    <C-S>       :wa<CR>
nnoremap    <C-X>       :close<CR>
nnoremap    <C-J>       :BLines<CR>
nnoremap    <C-K>       :FZFMru<CR>
nnoremap    <C-P>       :FZF<CR>
nnoremap    <C-G>       :echo expand('%:p')<CR>
nnoremap    <C-L>       :GitGutterAll<CR><C-L>
nnoremap    <C-F>       :call ToggleLeft()<CR>
nnoremap    <C-N>       :NERDTreeFind<CR>
nnoremap    \n          :NERDTreeToggle<CR>
nnoremap    \u          :UndotreeToggle<CR>
nnoremap    ga          <C-A>
nnoremap    gx          <C-X>
nnoremap    \m          :Maps<CR>

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
nnoremap    <F5>        :VdebugRun<CR>

nnoremap    \k          :call LanguageClient_textDocument_hover()<CR>
nnoremap    <C-]>       :call LanguageClient_textDocument_definition()<CR>
nnoremap    <C-\>       :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap    <S-F6>      :call LanguageClient_textDocument_rename()<CR>

nnoremap    \r          :HTTPClientDoRequest<CR><C-W>W

" DBext keys
nnoremap    \sx         :DBExecSQLUnderCursor<CR>

