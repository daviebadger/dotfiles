" *********
" Structure
" *********
"
" * Plug Manager
"
"   * Appearance
"   * Filesystem
"
" * Basics
"
"   * Line
"   * Tab
"
"     * Global
"     * Local
"
"   * Theme
"   * Whitespace
"   * Window
"
" * Plugins
"
"   * Airline
"   * NERDTree

" Plug Manager
" ============

call plug#begin('~/.vim/plugged')

" Appearance
" ----------

Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'

" Filesystem
" ----------

Plug 'scrooloose/nerdtree'

call plug#end()

" Basics
" ======

" Line
" ----

set number
set colorcolumn=80

" Tab
" ---

" Global
" ^^^^^^

set expandtab  " Tab to spaces.
set smarttab   " Spaces like tab.

set softtabstop=4  " Keep source tab size, but visually convert to my tab size.
set shiftwidth=4   " Indendation size.
set tabstop=4      " Tab size.

" Local
" ^^^^^

autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype js setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype rst setlocal tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Theme
" -----

colorscheme badwolf

" Whitespace
" ----------

" Highlight whitespace at the end of line.

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Window
" ------

set splitbelow
set splitright

" Plugins
" =======

" Airline
" -------

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" NERDTree
" --------

" Open NERDTree if no file specified.

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree if directory specified.

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close Neovim if last open window would be NERDTree.

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
