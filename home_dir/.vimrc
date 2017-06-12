" case insensitive search
:set ignorecase
" highlight search results
:set hlsearch
" english spellcheck
:map <F6> :setlocal spell! spelllang=en_us<CR>

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" tab to spaces
:set tabstop=4 shiftwidth=4 expandtab
