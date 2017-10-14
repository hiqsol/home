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

" Input keys
inoremap    <C-E>       <End>

" HUD keys
nnoremap    <C-S>       :update<CR>sdfsd
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

