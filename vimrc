"----------------------------------------------------------------------------
" ajkaanbal .vimrc
"----------------------------------------------------------------------------


"---------------------------------------------------------------------------
" Initialize: "{{{

" No 'vi' compatible commands.
set nocompatible

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundleLazy 'Shougo/unite-help', { 'autoload' : {
      \ 'unite_sources' : 'help'
      \ }}
NeoBundleLazy 'Shougo/unite-outline', { 'autoload': {
      \ 'unite_sources': 'outline'
      \  }}
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'bling/vim-airline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/emmet-vim/'
NeoBundleLazy 'othree/html5.vim', {
\ 'autoload' : {
\   'filetypes': ['html','htmldjango']
\ }}
NeoBundleLazy 'gregsexton/MatchTag', {
\ 'autoload' : {
\   'filetypes': ['html', 'htmldjango']
\ }}
NeoBundle 'xolox/vim-session', {'depends': 'xolox/vim-misc'}
NeoBundleLazy 'moll/vim-bbye', {
      \ 'autoload': {
      \   'commands': 'Bdelete'
      \}}
NeoBundleLazy 'marijnh/tern_for_vim', {
      \ 'autoload' : {
      \      'filetypes' : 'javascript',
      \ },
      \ 'build' : {
      \      'unix': 'npm install',
      \}}
NeoBundleLazy 'itchyny/thumbnail.vim', {
      \ 'autoload' : {
      \   'commands' : 'Thumbnail'
      \ }}
NeoBundleLazy 'othree/vim-javascript-syntax', { 'autoload' : {
      \ 'filetypes' : 'javascript',
      \ }}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', { 'autoload': {
      \ 'filetypes': 'javascript'}}
NeoBundleLazy 'elzr/vim-json', { 'autoload': {
      \ 'filetypes': 'json' }}
NeoBundleLazy 'chrisbra/color_highlight', {
\ 'autoload' : {
\   'filetypes': 'css'
\ }}
NeoBundleLazy 'guns/xterm-color-table.vim.git', {
      \ 'autoload': {
      \   'commands': 'XtermColorTable'
      \ }}
NeoBundleLazy 'klen/python-mode', {
\ 'autoload' : {
\   'filetypes': 'python'
\ }}

NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'kshenoy/vim-signature'
" from vim.org
NeoBundleLazy 'matchit.zip', { 'autoload' : {
      \ 'mappings' : ['%', 'g%']
      \ }}
let bundle = neobundle#get('matchit.zip')
function! bundle.hooks.on_post_source(bundle)
    silent! execute 'doautocmd Filetype' &filetype
endfunction

NeoBundleLazy 'django.vim', {
\ 'autoload' : {
\   'filetypes': ['htmldjango','django']
\ }}

"Neobundle configuration
call neobundle#config('neosnippet', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'insert' : 1,
      \   'filetypes' : 'snippet',
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }})

call neobundle#config('vimfiler', {
      \ 'lazy' : 1,
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \    'commands' : [
      \                  { 'name' : 'VimFiler',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'VimFilerExplorer',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'Edit',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'Write',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  'Read', 'Source'],
      \    'mappings' : ['<Plug>(vimfiler_switch)'],
      \    'explorer' : 1,
      \ }
      \ })
"local plugins vim
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

filetype plugin indent on
set lazyredraw
set ttyfast

" Enable syntax color.
syntax enable

" Installation check.
NeoBundleCheck
" }}}


"---------------------------------------------------------------------------
" Encoding:"{{{

" The automatic recognition of the character code.
" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.
set encoding=utf8

" Default fileformat.
set fileformat=unix
" " Automatic recognition of a new line.
set fileformats=unix,dos,mac
"}}}


"---------------------------------------------------------------------------
" Search:"{{{

"" Ignore the case of normal letters.
set ignorecase

" If the search pattern contains upper case characters, override ignorecase
" option.
set smartcase

" Enable incremental search.
set incsearch

" Don't highlight search result.
set hlsearch

" Searches wrap around the end of the file.
set wrapscan

" Clear last searching highlight
nnoremap <S-l> :let @/ = ""<cr>
"}}}


"---------------------------------------------------------------------------
" Edit: "{{{

" Smart insert tab setting.
set smarttab

" Exchange tab to spaces.
set expandtab

" Substitute <Tab> with blanks.
set tabstop=4

" Spaces instead <Tab>.
set softtabstop=4

" Autoindent width.
set shiftwidth=4

" Round indent by shiftwidth.
set shiftround

" Enable modeline.
set modeline

" Use clipboard register.
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

" Disable auto wrap.
autocmd MyAutoCmd FileType *
      \ if &l:textwidth != 70 && &filetype !=# 'help' |
      \    setlocal textwidth=0 |
      \ endif

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Highlight parenthesis.
set showmatch

" Highlight when CursorMoved.
set cpoptions-=m
set matchtime=3

" Highlight <>.
set matchpairs+=<:>

" Display another buffer when current buffer isn't saved.
set hidden

" Auto reload if file is changed.
set autoread

" Ignore case on insert completion.
set infercase

" Enable folding.
set foldenable
set foldmethod=indent
set foldlevelstart=20



set fillchars=vert:\|
set commentstring=%s

" Use grep.
set grepprg=grep\ -inH

" Exclude = from isfilename.
set isfname-==

" Reload .vimrc automatically.
autocmd MyAutoCmd BufWritePost vimrc source $MYVIMRC

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=1000

" No swap files, no backups.
set nobackup
set nowritebackup
set noswapfile

" Enable virtualedit in visual block mode.
set virtualedit=block

" Set keyword help.
set keywordprg=:help

" Check timestamp more for 'autoread'.
autocmd MyAutoCmd WinEnter * checktime

" Disable paste.
autocmd MyAutoCmd InsertLeave *
      \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Update diff.
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/
autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

"}}}


"---------------------------------------------------------------------------
"" View:"{{{

" Show line number.
set number

" Show <TAB> and <CR>
set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:%

" Do not wrap long line.
set nowrap

" Wrap conditions.
set whichwrap+=h,l,<,>,[,],b,s,~

" Always display statusline.
set laststatus=2

" Height of command line.
set cmdheight=1

" show command on STAtusline.
set showcmd

" Not show mode.
set noshowmode

" Show title.
set title

" Title length.
set titlelen=79

" Set statusline.
let &statusline="%F%m%r%h%w" "fullpath and status modified sign
     \ . "%y" "filetype
     \ . "%="
     \ . "[%l\/%L:\%v]" "line number and column number

function! s:get_twitter_len()
  return &filetype !=# 'int-earthquake' || mode() !=# 'i' ? '' :
        \ '(rest:' . (140 - len(substitute(vimshell#get_cur_text(),'.','x','g'))) . ')'
endfunction

" Turn down a long line appointed in 'breakat'
set linebreak
set showbreak=>\
set breakat=\ \ ;:,!?

" Do not display greetings message at the time of Vim start.
set shortmess=aTI

" Disable bell.
set t_vb=
set novisualbell

" Display candidate supplement.
set nowildmenu
set wildmode=list:longest,full

" Increase history amount.
set history=500

" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag

" Can supplement a tag in a command-line.
set wildoptions=tagfile

" Enable spell check.
set spelllang=en_us

" Completion setting.
set completeopt=menuone,longest,preview

" tells VIM where to search for autocompletion
"  . : current file
"  w : files in other windows
"  b : files in loaded buffers, not in a window
"  t : the `tags` file
"  i : current and included files
set complete=.,w,b,t,i

" Set popup menu max height.
set pumheight=20

" Report changes.
set report=0

" Maintain a current line at the time of movement as much as possible.
set nostartofline

" Splitting a WINdow will put the new window below the current one.
set splitbelow

" Splitting a window will put the new window right the current one.
set splitright

" Set minimal width for current window.
set winwidth=30

" Set minimal height for current window.
set winheight=1

" Set maximam maximam command line window.
set cmdwinheight=5

" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=8
set helpheight=12

" Don't redraw while macro executing.
"set lazyredraw

" When a line is long, do not omit it in @.
set display=lastline

" Display an invisible letter with hex format.
set display+=uhex

" Disable automatically insert comment.
autocmd MyAutoCmd FileType *
      \ setl formatoptions-=ro | setl formatoptions+=mM

if v:version >= 703
  " For conceal.
  set conceallevel=2 concealcursor=iv

  set colorcolumn=79
endif

" View setting.
set viewdir=~/.vim/view viewoptions-=options viewoptions+=slash,unix

"}}}


"---------------------------------------------------------------------------
" Syntax:"{{{
"
" Enable smart indent.
set autoindent smartindent

augroup MyAutoCmd

  " Auto reload VimScript.
  autocmd BufWritePost,FileWritePost *.vim if &autoread
        \ | source <afile> | echo 'source ' . bufname('%') | endif

  " Close help and git window by pressing q.
  autocmd FileType help,git-status,git-log,qf,J6uil_say,vimconsole,
        \gitcommit,quickrun,qfreplace,ref,vcs-commit,vcs-status
        \ nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>
  autocmd FileType * if (&readonly || !&modifiable) && !hasmapto('q', 'n')
        \ | nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>| endif

  autocmd FileType gitcommit,qfreplace setlocal nofoldenable

  autocmd FileType ref nnoremap <buffer> <TAB> <C-w>w

  " Enable omni completion.
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
  else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  endif
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  "Fold methods
  autocmd FileType python setlocal foldmethod=indent
  autocmd MyAutoCmd FileType javascript setlocal foldmethod=indent
  autocmd FileType vim setlocal foldmethod=marker

  " Update filetype.
  autocmd BufWritePost *
  \ if &l:filetype ==# '' || exists('b:ftdetect')
  \ |   unlet! b:ftdetect
  \ |   filetype detect
  \ | endif

  " Improved include pattern.
  autocmd FileType html
        \ setlocal includeexpr=substitute(v:fname,'^\\/','','') |
        \ setlocal path+=./;/
  autocmd FileType apache setlocal path+=./;/

  "Pretty json
  autocmd FileType json setlocal equalprg=python\ -m\ json.tool
  autocmd FileType html setlocal sw=2 ts=2 sts=2
  autocmd FileType htmldjango setlocal sw=2 ts=2 sts=2
  autocmd FileType css  setlocal sw=2 ts=2 sts=2
augroup END

" PHP
let g:php_folding = 0

" Python
let g:python_highlight_all = 1

" XML
let g:xml_syntax_folding = 1

" Vim
let g:vimsyntax_noerror = 1
let g:vim_indent_cont = 0

" Bash
let g:is_bash = 1

" JavaScript
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" Vim script
" augroup: a
" function: f
" lua: l
" perl: p
" ruby: r
" python: P
" tcl: t
" mzscheme: m
let g:vimsyn_folding = 'af'

" Syntax highlight for user commands.
augroup syntax-highlight-extends
  autocmd!
  autocmd Syntax vim
        \ call s:set_syntax_of_user_defined_commands()
augroup END

function! s:set_syntax_of_user_defined_commands()
  redir => _
  silent! command
  redir END

  let command_names = join(map(split(_, '\n')[1:],
        \ "matchstr(v:val, '[!\"b]*\\s\\+\\zs\\u\\w*\\ze')"))

  if command_names == '' | return | endif

  execute 'syntax keyword vimCommand ' . command_names
endfunction

" Clear modeline highlight.
autocmd MyAutoCmd VimEnter *
      \ highlight ModeMsg guifg=bg guibg=bg | highlight WarningMsg guifg=bg


"highlight modifications
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"# Pemenu colors
hi Pmenu ctermfg=255 ctermbg=236
hi PmenuSel ctermbg=255 ctermfg=24
hi PmenuSbar ctermbg=233
hi PmenuThumb ctermbg=238
hi Normal ctermbg=none
hi Comment ctermfg=242

"# color options to listchars
hi NonText ctermfg=darkgrey guifg=darkgrey ctermbg=none
hi clear SpecialKey
hi link SpecialKey NonText

"# hl Matchit
highlight MatchParen cterm=bold ctermfg=255 ctermbg=27

"#right margin
set colorcolumn=80
highlight ColorColumn ctermbg=235 ctermfg=white guibg=#592929
highlight OverLength ctermbg=246 ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"# Cursor line
set cursorline
hi CursorLine ctermbg=235 cterm=none 
"}}}


"---------------------------------------------------------------------------
" Plugins: "{{{

" Neocomplete {{{
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

let bundle = neobundle#get('neocomplete.vim')
function! bundle.hooks.on_source(bundle)
" Use smartcase.
  let g:neocomplete#enable_smart_case = 1
" Use fuzzy completion.
  let g:neocomplete#enable_fuzzy_completion = 1

" Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 5
" Set auto completion length.
  let g:neocomplete#auto_completion_start_length = 4
" Set manual completion length.
  let g:neocomplete#manual_completion_start_length = 0
" Set minimum keyword length.
  let g:neocomplete#min_keyword_length = 5
  let g:neocomplete#enable_insert_char_pre = 1
  let g:neocomplete#enable_prefetch = 0
  let g:neocomplete#skip_auto_completion_time = '0.6'
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell/command-history',
        \ }

  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#disable_auto_select_buffer_name_pattern =
        \ '\[Command Line\]'
  let g:neocomplete#max_list = 100
  let g:neocomplete#force_overwrite_completefunc = 1
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
  endif
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#enable_auto_close_preview = 1

  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'

" Define keyword pattern.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '[0-9a-zA-Z:#_]\+'
  let g:neocomplete#keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::\w*'

  let g:neocomplete#ignore_source_files = ['tag.vim']

  let g:neocomplete#sources#vim#complete_functions = {
        \ 'Ref' : 'ref#complete',
        \ 'Unite' : 'unite#complete_source',
        \ 'VimShellExecute' :
        \ 'vimshell#vimshell_execute_complete',
        \ 'VimShellInteractive' :
        \ 'vimshell#vimshell_execute_complete',
        \ 'VimShellTerminal' :
        \ 'vimshell#vimshell_execute_complete',
        \ 'VimShell' : 'vimshell#complete',
        \ 'VimFiler' : 'vimfiler#complete',
        \ 'Vinarise' : 'vinarise#complete',
        \}
  call neocomplete#custom#source('look', 'min_pattern_length', 4)

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.python = ''

" mappings."{{{
" <C-f>, <C-b>: page move.
  inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
  inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
" <C-y>: paste.
  inoremap <expr><C-y> pumvisible() ? neocomplete#close_popup() : "\<C-r>\""
" <C-e>: close popup.
  inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"
" <C-k>: unite completion.
  imap <C-k> <Plug>(neocomplete_start_unite_complete)
" <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" <C-n>: neocomplete.
  inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion.
  inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
  inoremap <expr>' pumvisible() ? neocomplete#close_popup() : "'"

  imap <expr> ` pumvisible() ?
        \ "\<Plug>(neocomplete_start_unite_quick_match)" : '`'

  inoremap <expr><C-x><C-f>
        \ neocomplete#start_manual_complete('file')

  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()

" <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction

" <TAB>: completion.
"  inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ neocomplete#start_manual_complete()
"  function! s:check_back_space() "{{{
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1] =~ '\s'
"  endfunction"}}}
"" <S-TAB>: completion back.
"  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"}}}
endfunction
"}}}

" neosnippet {{{
" Plugin key-mappings.
imap <C-n>     <Plug>(neosnippet_expand_or_jump)
smap <C-n>     <Plug>(neosnippet_expand_or_jump)
xmap <C-n>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"}}}


"# Vim-session setting{{{
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
"}}}

" color_highlight {{{
let g:colorizer_auto_filetype='css'
"}}}

" unite.vim"{{{

" Execute help.
nnoremap <silent> <C-h>  :<C-u>Unite -buffer-name=help help<CR>

" Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>

"Match candidates by filename
call unite#custom#source(
        \ 'buffer,file_rec/async,file_rec,file_mru', 'matchers',
        \ ['converter_tail', 'matcher_default'])
call unite#custom#source(
        \ 'buffer,file_rec/async,file_rec,file_mru', 'converters',
        \ ['converter_file_directory'])

call unite#custom#profile('files', 'filters', 'sorter_rank')
" Directory partial match.
call unite#custom#default_action('directory', 'narrow')

" Variables.
let g:unite_source_history_yank_enable = 1
let g:unite_enable_split_vertically = 0
let g:unite_winheight = 12
let g:unite_enable_short_source_names = 1

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_limit = 300
let g:unite_source_directory_mru_limit = 300
let g:unite_split_rule = 'botright'

" Like Textmate icons.
let g:unite_marked_icon = '✗'
let g:unite_prompt = '» '
let g:unite_enable_start_insert = 1

nnoremap <leader>f :<C-u>Unite file_rec/async:!<cr>
inoremap <leader>f <ESC>:<C-u>Unite file_rec/async:!<cr>
nnoremap <leader>p :<C-u>Unite file_rec/async<cr>
nnoremap <leader>b :<C-u>Unite buffer<cr>
inoremap <leader>b <ESC>:<C-u>Unite buffer<cr>
nnoremap <leader>r :<C-u>Unite file_mru<CR>
nnoremap <leader>o :<C-u>Unite outline<CR>
nnoremap <leader>/ :<C-u>Unite grep:.:file<CR>
nnoremap <silent> <leader>la :<C-u>Unite buffer file_mru bookmark<CR>

autocmd MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{

" Clear searching highlight
let @/ = ""
nmap <buffer> <ESC>      <Plug>(unite_exit)
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup'
    let g:unite_source_grep_recursive_opt = ''
endif
endfunction
"}}}


" Airline: {{{
"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_enable_unite=1
let g:airline_theme='lucius'
let g:airline_enable_syntastic = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" }}}

" Tagbar {{{
let g:tagbar_autofocus = 1
nmap <F8> :TagbarToggle<CR>
" }}}

"  Syntastic{{{
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_javascript_checkers = ['jshint']
"}}}

" python-mode{{{
let g:pymode_run_key = '<leader>pr'
let g:pymode_breakpoint_key = '<leader>pb'
"}}}


"}}}


" vimfiler.vim"{{{
nnoremap    <F2>   :<C-u>VimFilerExplorer<CR>
"}}}

"}}}


"---------------------------------------------------------------------------
" KeyMappings: "{{{

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

" Remove all trailing whitespace:
map <silent> <leader><Space> :%s/\s\+$//e<CR>
"


" " Convert all tabs appropriately:
map <C-R>t :set expandtab<CR>:%retab!<CR>

"#Navigate btween buffers
nnoremap <silent> bh :bfirst<CR>
nnoremap <silent> bj :bnext<CR>
nnoremap <silent> bk :bprevious<CR>
nnoremap <silent> bl :blast<CR>
nnoremap <silent> bn :bnext<Space>
nnoremap <silent> bd :bdelete<CR>
nnoremap <silent> Bd :Bdelete<CR>
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

inoremap <silent> <S-Left> <esc>:<c-u>bprevious<CR>
inoremap <silent> <S-Right> <esc>:<c-u>bnext<CR>

noremap <silent> <M-Right>  <c-w>l
noremap <silent> <A-Left>   <c-w>h
noremap <silent> <A-Up>     <c-w>k
noremap <silent> <A-Down>   <c-w>j

inoremap <silent> <M-Right>  <c-o><c-w>l
inoremap <silent> <A-Left>   <c-o><c-w>h
inoremap <silent> <A-Up>     <c-o><c-w>k
inoremap <silent> <A-Down>   <c-o><c-w>j

" Remove all trailing whitespace:
map <C-R>s :%s/\s\+$//e<CR>
"
" " Convert all tabs appropriately:
map <C-R>t :set expandtab<CR>:%retab!<CR>

" Useful save mappings.
nnoremap <silent> <Leader><Leader> :<C-u>update<CR>
nnoremap <silent> <Leader>w        :<C-u>wa<CR>


" Easy escape."{{{
inoremap jj           <ESC>
" inoremap <expr> j       getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
cnoremap <expr> j       getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
onoremap jj           <ESC>

inoremap j<Space>     j
onoremap j<Space>     j

"}}}

"# Change to paste mode to avoid akward indentation
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
set showmode
" Redraw. 
nnoremap <silent> <C-l> :<C-u>redraw!<CR>

"Tmux integration
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"indent with tab and shift tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"}}}


"---------------------------------------------------------------------------
" Others: {{{

"Session options
set ssop-=options    " do not store global and local values in a session
set ssop+=folds

" ruby path if you are using RVM
let g:ruby_path = system('rvm current')

" }}}


