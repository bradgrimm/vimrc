set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'neomake/neomake'

filetype plugin indent on

" Assume a terminal with 256 colors.
" set termguicolors
set t_Co=256

" Run neomake each time we write.
autocmd! BufWritePost * Neomake

" Caching helps ctrlp boot faster.
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" disable git-gutter signs
let g:gitgutter_signs = 0

" Use our pylint.rc
let g:syntastic_python_pylint_args = '--rcfile=/home/bgrimm/dev/hv/pylint.rc' 

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" html does 2 spaces.
autocmd Filetype html setlocal ts=2 sts=2 sw=2


" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Don't wrap lines "
set nowrap

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Improved searching + highlighting
set incsearch
set ignorecase
set smartcase
set hlsearch

let mapleader = "\<Space>"

" Clear formatting.
nmap <Leader>q :nohlsearch<CR> :SyntasticReset<CR> :GitGutterSignsDisable<CR>
nmap <Leader><s-q> :nohlsearch<CR> :SyntasticReset<CR> :GitGutterSignsDisable<CR> :set nonu<CR>

" Quicker file opening.
nmap <Leader>o :CtrlPBuffer<CR>
nmap <Leader>p :CtrlP<CR>

" Toggle git, syntax
nmap <Leader>a :GitGutterSignsToggle<CR>
nmap <Leader>s :SyntasticCheck<CR>

" Run tests.
nmap <Leader>f :Pytest function<CR>
nmap <Leader><s-f> :Pytest file<CR>
nmap <Leader>e :Pytest method<CR>
nmap <Leader><s-e> :Pytest class<CR>
nmap <Leader>x :Pytest function --pdb<CR>
nmap <Leader><s-x> :Pytest file --pdb<CR>
nmap <Leader>j :Pytest next<CR>
nmap <Leader>v :Pytest fails<CR>
nmap <Leader><s-v> :Pytest session<CR>

" Show syntax error in status bar.
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Spelling.  Should we bind?
" setlocal spell spelllang=en_us

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <c-w>E :SyntasticCheck<CR> 
"nnoremap <c-w>S :SyntasticToggleMode<CR>
highlight SyntasticError guibg=#2f0000

set clipboard=unnamed
