call pathogen#infect()
syntax on
filetype plugin indent on
set smartindent
set tabstop=4 
set shiftwidth=4 
set expandtab 
set autoindent
set cindent
set nu

"Folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-o> :NERDTreeToggle<CR>

set hidden
nnoremap <S-u> :UndotreeToggle<cr>
nnoremap <C-h> :bp<cr>
nnoremap <C-l> :bn<cr>

"Pretty json
au FileType json setlocal equalprg=python\ -m\ json.tool

