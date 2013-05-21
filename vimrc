call pathogen#infect()
syntax on

" Automatically load all ftdetect files from our plugins.
filetype off
filetype plugin indent on
filetype on

" Code completion.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" Set a colorscheme.
colorscheme torte

" Underline the cursor line (to make spotting movement easier).
"set cul


" Folding settings (we use indentation by default).
set fdm=indent
set foldminlines=4


" Have vim insert line breaks automatically to preserve standard unix
" " formatting rules.
set tw=79

" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Use the same symbols as TextMate for tabstops and EOLs.
set listchars=tab:▸\ ,eol:¬

" Highlight all search results.
set hls

" Use the `par` program for formatting paragraphs.
set formatprg=par\ -w79eqr

" Have vim automatically format text as you type.
set formatoptions+=t


" Enable python syntax highlighting (from the ``vim-python`` plugin.)
let python_highlight_all = 1

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

"vim NERDTree key mappings:
autocmd vimenter * if !argc() | NERDTree | endif
map <F2> :NERDTreeToggle<CR>


" Remove all trailing whitespace:
map <C-R>s :%s/\s\+$//e<CR>
"
" " Convert all tabs appropriately:
map <C-R>t :set expandtab<CR>:%retab!<CR>

set hidden
nnoremap <S-u> :UndotreeToggle<cr>
nnoremap <C-h> :bp<cr>
nnoremap <C-l> :bn<cr>

"Pretty json
au FileType json setlocal equalprg=python\ -m\ json.tool

"nginx conf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
