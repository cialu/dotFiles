"" General config
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced config
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" lightline
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" commentary
Plug 'tpope/vim-commentary'

" vim-surround
Plug 'tpope/vim-surround'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
