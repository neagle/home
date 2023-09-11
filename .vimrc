"                  _
"  ___  __ _  __ _| | ___
" / _ \/ _` |/ _` | |/ _ \
"|  __/ (_| | (_| | |  __/
" \___|\__,_|\__, |_|\___|
"            |___/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-plug

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tpope/vim-sensible'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


set noswapfile

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" set autochdir

nnoremap ,cd :cd %:p:h<CR>

" Automatically reload .vimrc when changed
autocmd! bufwritepost .vimrc source %

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo
set undofile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap leader character to comma - easier to reach than \ (the default)
let mapleader = ","

set ruler " show the cursor position all the time
set number " show line numbers

" UTF-8 Encoding
set encoding=utf-8

" Keep 3 lines from previous page when scrolling
set scrolloff=3

" Displays the current mode (i.e. -- INSERT --, -- VISUAL --, etc.)
set showmode

" Clear search results with leader + space
nnoremap <leader><space> :noh<cr>

" Easily edit the .vimrc file
nmap <leader>v :vsplit $MYVIMRC<CR>

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows, Splits, and Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Map new file explorer splits to <leader>s + <direction>
nnoremap <leader>sk :Hex!<cr>
nnoremap <leader>sl :Vex!<cr>
nnoremap <leader>sj :Hex<cr>
nnoremap <leader>sh :Vex<cr>
