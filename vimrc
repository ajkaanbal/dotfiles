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
nnoremap <silent> bh :bfirst<CR>
nnoremap <silent> bj :bnext<CR>
nnoremap <silent> bk :bprevious<CR>
nnoremap <silent> bl :blast<CR>
nnoremap <silent> bn :bnext<Space>
nnoremap <silent> bd :bdelete<CR>


" redraw instead of insert/delete
set ttyfast

nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

"# Split on right by default
set splitright

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
set copyindent

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

" avoid common mistakes
cmap Q q
cmap WQ wq
cmap Wq wq
cmap wQ wq
cmap w1 w!


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

" enable autocompletion menu
set wildmenu
set wildmode=list:longest:full

set wildignore+=*.o,*.obj,*.pyc
set wildignore+=.git
set wildignore+=*.dvi,*.pdf
set wildignore+=*.jpg,*.png,*.tiff
set wildignore+=.coverage,coverage.xml,nosetests.xml,.noseids

"" tells VIM where to search for autocompletion
""  . : current file
""  w : files in other windows
""  b : files in loaded buffers, not in a window
""  t : the `tags` file
""  i : current and included files
set complete=.,w,b,t,i
"
" " autocompletion visualization
set completeopt=menuone,longest,preview

"leader key
let mapleader=","


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
nmap <Leader>w :silent! update<CR>

"#
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

"# Set a colorscheme with backgroun transparent
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid
"set bg=dark
"# Pemenu colors
hi Pmenu ctermfg=255 ctermbg=233
hi PmenuSel ctermbg=255 ctermfg=24
hi PmenuSbar ctermbg=233
hi PmenuThumb ctermbg=238

hi Normal ctermbg=none
hi Comment ctermfg=242
"# color options to listchars
hi NonText ctermfg=darkgrey guifg=darkgrey ctermbg=none
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

" NERDCommenter
let g:NERDCommentWholeLinesInVMode = 1

"# Unite

call unite#custom#source('file_rec/async', 'ignore_pattern', '\(libs\|node_modules\)')
let g:unite_source_file_rec_max_cache_files = 9000


call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_split_rule = 'botright'
" Start insert.
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
let g:unite_winheight = 12

" Prompt choices.
let g:unite_prompt = '» '

"# Unite help
" Execute help.
nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
" " Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.
    "
    nmap <buffer> <ESC>      <Plug>(unite_exit)
endfunction"}}}

nnoremap <leader>f :<C-u>Unite file_rec/async:!<cr>
nnoremap <leader>b :<C-u>Unite buffer<cr>
nnoremap <leader>r :<C-u>Unite file_mru<CR>
nnoremap <leader>o :<C-u>Unite outline<CR>
nnoremap <silent> <leader>la :<C-u>Unite buffer file_mru bookmark<CR>

"# jsbeautify
noremap <leader>jsb :call JsBeautify()<cr>

"#
inoremap kj <esc>

"# Ultisnips 
let g:UltiSnipsSnippetsDir='~/.vim/ajksnippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ajksnippets"]
let g:UltiSnipsEditSplit="vertical"
"#
"set previewwindow
set winfixheight
"nnoremap <leader>vi :<c-u>e $MYVIMRC<cr>

" preview window... to get it to open vert right, or horiz as desired
function PreviewTag()
  "by MW
  set previewheight=25
  exe "silent! pclose"
  "if &previewwindow " don't do this in the preview window
  "  return
  "endif
  exe 'pedit ' . expand('~/.vimrc')
  " if any non False arg, open in simple horiz window so simply return
  " otherwise, make it vertical
  exe "silent! wincmd P"
  if &previewwindow " if we really get there...
    if has("folding")
      silent! .foldopen " don't want a closed fold
    endif
    wincmd L " move preview window to the left
    "wincmd p " back to caller
    if !&previewwindow " got back
      wincmd _
      " make caller full size (I use minibufexplorer and for some reason
      " the window is altered by the preview window split and manipulation
      " so wincmd _ sets it back... your mileage may vary
    endif
  endif
endfunction

nnoremap <leader>vi :call PreviewTag()<cr>




"#
" Airline: {{{
" 
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_fugitive_prefix = '  '
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ' '

 let g:airline_enable_bufferline=1
 let g:airline_enable_unite=1
"
"let g:airline_section_c=bufferline
let g:airline_theme='solarized'
"let g:airline_exclude_preview = 1

" }}}
"
let g:bufferline_echo = 0
