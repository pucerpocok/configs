""""""""""""""""""""""""""""""
"
" install vundle with this command:
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" plugin update with:
"   :VundleUpdate
"
""""""""""""""""""""""""""""""

" disable old vi stuff
set nocompatible

" required for vundle (vim plugin manager)
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dylanaraps/wal.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'roxma/nvim-yarp'
"Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'ryanoasis/vim-devicons'

" has some problem: https://github.com/vim-syntastic/syntastic/issues/1391#issuecomment-97310854
" Plugin 'Xuyuanp/nerdtree-git-plugin'

"#########################
" examples
"#########################
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()

" turn back filetype recognition
filetype plugin indent on
syntax on

set t_Co=256

" vim airline theme
"let g:airline_theme='gardener'
" set guifont=Liberation\ Mono\ for\ Powerline\ 10
set guifont=Font\ Awesome\ 16
" set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
" set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"
"let g:airline_left_sep='XXX'


" case insensitive search
:set ignorecase
" highlight search results
:set hlsearch
" english spellcheck
:map <F6> :setlocal spell! spelllang=en_us<CR>

" hungarian spellcheck
":map <F5> :setlocal spell! spelllang=hu_HU<CR>

imap <F7> <c-g>u<Esc>[s1z=`]a<c-g>u

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

:map <silent> <A-y> <C-w><
:map <silent> <A-u> <C-W>-
:map <silent> <A-i> <C-W>+
:map <silent> <A-o> <C-w>>

" tab to spaces
:set tabstop=4 shiftwidth=4 expandtab

:set number
:set relativenumber
:set so=10
:map <F12> :call ToggleNumbers()<CR>
function! ToggleNumbers()
    let &relativenumber=1-&relativenumber
    let &number=1-&number
endfunc

" :colorscheme delek
" :colorscheme wal
:hi Search cterm=NONE ctermfg=grey ctermbg=blue
:hi SpellBad cterm=NONE ctermfg=grey ctermbg=blue
" not working, should set the line colour
":hi CursorLine     guibg=Yellow gui=none
":hi CursorLine      cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" set cursorline
map <F2> :set cursorline!<CR>
":hi CursorLine      cterm=NONE

" autocmd InsertEnter * highlight CursorLine guibg=white guifg=white
" autocmd InsertLeave * highlight CursorLine guibg=yellow guifg=white
" sets the colour of the current line to yellow
:hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow
" sets the colour of all the lines to magenta
:hi LineNr         ctermfg=DarkMagenta guifg=#2b506e guibg=#000000

autocmd Filetype * match Error /\s\+$/
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.groovy set filetype=groovy
autocmd BufNewFile,BufReadPost *.gvy set filetype=groovy

:setlocal foldmethod=indent
:set foldlevelstart=20
:nnoremap <space> za

:set pastetoggle=<F3>

" Check .git/tags for ctags file.
fun! FindTagsFileInGitDir(file)
  let path = fnamemodify(a:file, ':p:h')
  while path != '/'
    let fname = path . '/.git/tags'
    if filereadable(fname)
      silent! exec 'set tags+=' . fname
    endif
    let path = fnamemodify(path, ':h')
  endwhile
endfun

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

augroup CtagsGroup
  autocmd!
  autocmd BufRead * call FindTagsFileInGitDir(expand("<afile>"))
augroup END

:set tags=./tags;/
" Alt-right/left to navigate forward/backward in the tags stack
:map <A-Left> <C-T>
:map <A-Right> <C-]>
:map <A-h> <C-T>
:map <A-l> <C-]>
":map <t> :! echo alma>/tmp/sdfsdf

" shortcut to switch tab
:map <A-s> <C-w><C-w>

:nnoremap ; :q<return>

:colorscheme wal

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\.swp$']
" let g:NERDTreeWinPos = "right"
autocmd VimEnter * NERDTreeFind | wincmd p
let NERDTreeMouseMode=2
"set mouse=a

map <C-n> :NERDTreeToggle<CR>
map <C-m> :call ToggleMouse()<CR>


set colorcolumn=80
:map <F10> :call ToggleColumn()<CR>
function! ToggleColumn()
    if &colorcolumn == '80'
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunc

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"let g:deoplete#enable_at_startup = 1


let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

