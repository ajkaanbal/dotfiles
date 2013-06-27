" pathogen plugins support
call pathogen#infect()
call pathogen#helptags()

"# enable powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
"# Only two spaces for html files
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType css  :setlocal sw=2 ts=2 sts=2




"#Navigate btween buffers
nnoremap bh :bfirst<CR>
nnoremap bj :bnext<CR>
nnoremap bk :bprevious<CR>
nnoremap bl :blast<CR>
nnoremap bn :bnext<Space>
nnoremap bd :bdelete<CR>

nnoremap <S-Up> :bprevious<CR>
nnoremap <S-Down> :bnext<CR>


"Some settings based on
"https://github.com/jackfranklin/dotfiles/blob/master/vim/.vimrc

" status bar
set statusline=%F%m%r%h%w "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=%=
set statusline+=\ [%l\/%L:\%v] "line number and column number 

" Clear last searching highlight
nnoremap <S-l> :let @/ = ""<cr>

" auto load files if vim detects they have changed outside vim
set autoread

" fix slight delay after pressing ESC then O
" " http://ksjoberg.com/vim-esckeys.html
" " set noesckeys
set timeout timeoutlen=1000 ttimeoutlen=100

set nocompatible

"more commands and search history
set history=10000

"tabs for spaces
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"always show the status line
set laststatus=2


"Show search matches as I type
set showmatch
set incsearch
set hlsearch "highlight all search result

"make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" Prevent Vim from clobbering the scrollback buffer. See
" " http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

"Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set udir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in  insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

" enable syntax highlight
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

set tw=79

" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()



" :W to save, :Q to quit (should be default)
command! W w
command! Q q

" ~~~ MAPPINGS BELOW ~~~
" " Make j/k move to next visual line instead of physical line
" " http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Use the same symbols as TextMate for tabstops and EOLs.
set listchars=tab:▸\ ,eol:¬

" Use the `par` program for formatting paragraphs.
"set formatprg=par\ -w79eqr

" Have vim automatically format text as you type.
"set formatoptions+=t


" Enable python syntax highlighting (from the ``vim-python`` plugin.)
let python_highlight_all = 1

"Show line numbers
set number

"Folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set foldminlines=4

"use emacs-style tab completiton when selecting files, etc
set wildmode=longest,list

"make taba completion for files/(buffers act like bash
set wildmenu

"leader key
let mapleader=","

" ignore git, npm modules and jekyll _site
set wildignore+=*.o,*.obj,.git,node_modules,_site

"navigate between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <S-Right> <C-w>l
map <S-Left> <C-w>h

" control P
map <leader>t :CtrlP<cr>
map <leader>cf :CtrlPClearCache<cr>

" navigating tabs
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

"vim NERDTree key mappings:
autocmd vimenter * if !argc() | NERDTree | endif
nnoremap <F2> :NERDTreeToggle<CR>

" Remove all trailing whitespace:
map <C-R>s :%s/\s\+$//e<CR>
"
" " Convert all tabs appropriately:
map <C-R>t :set expandtab<CR>:%retab!<CR>

" allow unsaved background buffers and remember marks/undo for them
set hidden
nnoremap <S-u> :UndotreeToggle<cr>

"Pretty json
au FileType json setlocal equalprg=python\ -m\ json.tool

"nginx conf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif


"# Set a colorscheme with backgroun transparent
set t_Co=256
colorscheme torte
highlight Normal ctermbg=none 

"#right margin
set colorcolumn=80
highlight ColorColumn ctermbg=246 ctermfg=white guibg=#592929
highlight OverLength ctermbg=246 ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
