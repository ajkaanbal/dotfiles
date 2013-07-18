scriptencoding utf-8
" pathogen plugins support
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

"# enable powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"# Only two spaces for html files
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType css  :setlocal sw=2 ts=2 sts=2

"#Navigate btween buffers
nnoremap bh :bfirst<CR>
nnoremap bj :bnext<CR>
nnoremap bk :bprevious<CR>
nnoremap bl :blast<CR>
nnoremap bn :bnext<Space>
nnoremap bd :bdelete!<CR>


nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

"# Split on right by default
set splitright

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

"Configureder>w :w!<cr> b ackspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

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
set list 
set listchars=tab:▸\ ,eol:¬,trail:·,precedes:«,extends:»,nbsp:$

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
set wildignore+=*.o,*.obj,.git,node_modules,_site,*.pyc

"navigate between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <M-S-Right> <C-w>l
map <M-S-Left> <C-w>h
map <M-S-Up> <C-w>k
map <M-S-Down> <C-w>j

map <C-S-Right> :tabprev<CR>
map <C-S-Left>  :tabnext<CR>
map <C-S-Up>    :tabfirst<CR>
map <C-S-Down>  :tablast<CR>

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

"# Fast saving
nmap <leader>w :w!<cr>

"#
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

"# Set a colorscheme with backgroun transparent
set t_Co=256
colorscheme torte
"# Pemenu colors
hi Pmenu ctermfg=255 ctermbg=233
hi PmenuSel ctermbg=24 ctermfg=255
hi PmenuSbar ctermbg=233
hi PmenuThumb ctermbg=238

hi Normal ctermbg=none 
"# color options to listchars
hi NonText ctermfg=darkgrey guifg=darkgrey
hi clear SpecialKey
hi link SpecialKey NonText

"enable all function in all mode."
let g:user_zen_mode='a'    

"#right margin
set colorcolumn=80
highlight ColorColumn ctermbg=235 ctermfg=white guibg=#592929
highlight OverLength ctermbg=246 ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"# Change to paste mode to avoid akward indentation
set pastetoggle=<F12>

"#
set noshowmode

"# Vim-session setting
:let g:session_autosave = 'no'

"# Ruby 
" ruby path if you are using RVM
let g:ruby_path = system('rvm current')

"# Unite
" Start insert.
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
let g:unite_winheight = 12

" Prompt choices.
let g:unite_prompt = '» '

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.
    "
    nmap <buffer> <ESC>      <Plug>(unite_exit)
endfunction"}}}

nnoremap <leader>lf :<C-u>Unite file_rec/async:!<cr>
nnoremap <leader>lb :<C-u>Unite buffer<cr>
nnoremap <leader>lr :<C-u>Unite file_mru<CR>
nnoremap <silent> <leader>la :<C-u>Unite buffer file_mru bookmark<CR>

