" Set the leader key to space
let mapleader=" "

" Basic settings
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " Number of spaces tabs count for
set shiftwidth=4                " Number of spaces to use for autoindent
set autoindent                  " Enable auto-indenting
set smartindent                 " Smart indenting
set wrap                        " Wrap long lines
set clipboard=unnamedplus       " Use system clipboard

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" File tree plugin
Plug 'preservim/nerdtree'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting and Python development
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'

" Linting and formatting
Plug 'dense-analysis/ale'

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Terminal integration
Plug 'voldikss/vim-floaterm'

" End of plugin list
call plug#end()

" Enable NERDTree
nmap <leader>e :NERDTreeToggle<CR>

" Automatically close NERDTree if it's the only open buffer
autocmd bufenter * if (winnr('$') == 1 && &filetype == 'nerdtree') | q | endif

" Key mappings for Buildozer and Python execution
nmap <leader>r :w<CR>:FloatermNew --autoclose=2 python3 %<CR>
nmap <leader>b :w<CR>:FloatermNew --autoclose=2 buildozer android debug<CR>

" Copy to the system clipboard
vnoremap <C-c> "+y

" Paste from the system clipboard
nnoremap <C-v> "+p


" Key mapping to open a split terminal window for running code
nmap <leader>t :vsp term://bash<CR>i

" Configure Jedi-Vim for Python autocompletion
let g:jedi#completions_enabled = 1
let g:jedi#auto_initialization = 1

" ALE for linting and fixing
let g:ale_linters = {
\   'python': ['flake8', 'mypy', 'pylint'],
\}
let g:ale_fixers = {
\   'python': ['autopep8', 'yapf', 'black'],
\}
let g:ale_python_auto_pipenv = 1
let g:ale_fix_on_save = 1

" Fuzzy Finder with fzf
nnoremap <leader>p :Files<CR>

" Set terminal split direction and size
let g:floaterm_position='bottom'
let g:floaterm_height=0.3

" Airline theme
let g:airline_theme='dark'

" Set some colorscheme (choose your preference)
colorscheme desert

