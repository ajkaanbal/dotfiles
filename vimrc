" Initialize: "{{{
"---------------------------------------------------------------------------

" No 'vi' compatible commands.
set nocompatible

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','
let g:maplocalleader = '-'

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
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neocomplete.vim', {
\ 'disabled' : !has('lua'),
\ }
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'bling/vim-airline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'mattn/emmet-vim/',{
\ 'autoload' : {
\   'filetypes': ['html', 'htmldjango']
\ }}
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundleLazy 'kana/vim-textobj-django-template', {
\ 'autoload' : {
\   'filetypes': ['html', 'htmldjango']
\ }}
NeoBundleLazy 'othree/html5.vim', {
\ 'autoload' : {
\   'filetypes': ['html','htmldjango']
\ }}
NeoBundleLazy 'Valloric/MatchTagAlways', {
\ 'autoload' : {
\   'filetypes': ['html', 'htmldjango']
\ }}
NeoBundleLazy 'othree/xml.vim', {
\ 'autoload' : {
\   'filetypes': ['xml', 'html']
\ }}
NeoBundle 'xolox/vim-session', {'depends': 'xolox/vim-misc'}
NeoBundleLazy 'moll/vim-bbye', {
      \ 'autoload': {
      \   'commands': 'Bdelete'
      \}}

NeoBundleLazy 'pangloss/vim-javascript', { 'autoload' : {
      \ 'filetypes' : 'javascript',
      \ }}
NeoBundleLazy 'othree/vim-javascript-syntax', { 'autoload' : {
      \ 'filetypes' : 'javascript',
      \ }}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', { 'autoload': {
      \ 'filetypes': 'javascript'}}
NeoBundleLazy 'elzr/vim-json', { 'autoload': {
      \ 'filetypes': 'json' }}
NeoBundleLazy 'chrisbra/Colorizer', {
\ 'autoload' : {
\   'filetypes': ['css', 'stylus']
\ }}
NeoBundleLazy 'wavded/vim-stylus', {
\ 'autoload' : {
\   'filetypes': 'stylus'
\ }}
NeoBundleLazy 'guns/xterm-color-table.vim.git', {
      \ 'autoload': {
      \   'commands': 'XtermColorTable'
      \ }}
NeoBundleLazy 'hdima/python-syntax', {
\ 'autoload' : {
\   'filetypes': 'python'
\ }}
NeoBundleLazy 'davidhalter/jedi-vim', {
\ 'autoload' : {
\   'filetypes': 'python'
\ }}

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'sdanielf/vim-stdtabs'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'haya14busa/vim-easymotion'
NeoBundleLazy 'mbbill/undotree', {
\ 'autoload': {
\    'commands': 'UndotreeToggle'
\ }}
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

NeoBundleLazy 'lambdalisue/vim-django-support', {
\ 'autoload': {
\   'filetypes': ['python']
\}}

NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'benmills/vimux'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ajkaanbal/autoswap.vim'
NeoBundle 'ajkaanbal/vim-togglecursor'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'laurentgoudet/vim-howdoi'
NeoBundleLazy 'ekalinin/Dockerfile.vim',
\{'autoload': {'filetypes': 'Dockerfile'}}
NeoBundle 'evanmiller/nginx-vim-syntax', {'autoload': {'filetypes': 'nginx'}}
"Neobundle configuration
call neobundle#config('unite.vim', {
\   'lazy': 1,
\   'autoload': {
\       'commands' : [{ 'name' : 'Unite',
\                       'complete' : 'customlist,unite#complete_source'}]
\   }})
call neobundle#config('neocomplete.vim', {
\ 'lazy' : 1,
\ 'autoload' : {
\   'insert' : 1,
\ }})
call neobundle#config('neosnippet.vim', {
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
nnoremap <silent><space>l :<c-u>let @/ = ""<return><esc>
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
set foldlevelstart=4



set fillchars=vert:\|
set commentstring=%s

" Exclude = from isfilename.
set isfname-==

" Reload .vimrc automatically.
autocmd MyAutoCmd BufWritePost vimrc source $MYVIMRC

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=1000

"backups and persistance settings
set undodir=~/.vim/tmp/undo
set backupdir=~/.vim/tmp/backup

set backup
set writebackup

set undofile
set undolevels=100

" Enable virtualedit in visual block mode and cursor beyond the last char
set virtualedit=block,onemore

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
"}}}


"---------------------------------------------------------------------------
"" View:"{{{

" Show line number.
set number

" Show <TAB> and <CR>
set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:%,eol:¬

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
set wildmenu
set wildmode=longest,full
set wildignore& " A file that matches with one of these patterns is ignored
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " Java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" Increase history amount.
set history=500

" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag

" Can supplement a tag in a command-line.
set wildoptions=tagfile

" Enable spell check.
set spelllang=en_us

" Completion setting.
set completeopt=menuone,longest
set completeopt-=preview

" tells VIM where to search for autocompletion
"  . : current file
"  w : files in other windows
"  b : files in loaded buffers, not in a window
"  t : the `tags` file
"  i : current and included files
set complete=.,w,b,u,t,i

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

" When a line is long, do not omit it in @.
set display=lastline

" Display an invisible letter with hex format.
set display+=uhex

" Disable automatically insert comment.
autocmd MyAutoCmd FileType *
      \ setl formatoptions-=ro | setl formatoptions+=mM

if has('conceal')
  " For conceal.
  set conceallevel=2 concealcursor="nvi"
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

  " Enable omni completion.
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python set omnifunc=jedi#completions
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType python setlocal completeopt-=preview
  if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
  else
    autocmd FileType python setlocal omnifunc=jedi#completions
  endif
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  "Fold methods
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType javascript setlocal foldmethod=syntax
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

  "Pretty json
  autocmd FileType json setlocal equalprg=json_reformat
  autocmd FileType htmldjango setlocal sw=2 ts=2 sts=2
  autocmd FileType stylus  setlocal sw=2 ts=2 sts=2

  " Close help buffer with q
  autocmd FileType help :nnoremap <buffer> <silent> q :<C-u>bdelete<CR>
  autocmd CmdwinEnter * map <buffer> <silent> q :<C-u>q<CR>
augroup END

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

"highlight modifications
set t_Co=256
colorscheme hybrid

highlight ExtraWhitespace ctermbg=9

"# Pemenu colors
hi Pmenu ctermfg=255 ctermbg=236
hi PmenuSel ctermbg=255 ctermfg=24
hi PmenuSbar ctermbg=233
hi PmenuThumb ctermbg=238

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
augroup cline
  autocmd!
  autocmd WinLeave,InsertEnter * set nocursorline
  autocmd WinEnter,InsertLeave * set cursorline
augroup END
"}}}


"---------------------------------------------------------------------------
" Plugins: "{{{

" neosnippet {{{
" Plugin key-mappings.
imap <C-j> <Plug>(neosnippet_jump_or_expand)
smap <C-j> <Plug>(neosnippet_jump_or_expand)
xmap <C-j> <Plug>(neosnippet_expand_target)

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:snippets_dir='~/.vim/bundle/vim-snippets/snippets'
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
"}}}

" Neocomplete {{{
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

let bundle = neobundle#get('neocomplete.vim')
function! bundle.hooks.on_source(bundle)
" Disable autocomplete
  let g:neocomplete#disable_auto_complete = 1
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
" Use smartcase.
  let g:neocomplete#enable_smart_case = 1

  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell/command-history',
        \ }

  let g:neocomplete#max_list = 20
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
  let g:neocomplete#enable_auto_close_preview = 0

" Define keyword pattern.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'

  let g:neocomplete#ignore_source_files = ['tag.vim']

  if !exists('g:neocomplete#sources#vim#complete_functions')
      let g:neocomplete#sources#vim#complete_functions = {}
  endif
  let g:neocomplete#sources#vim#complete_functions = {
        \ 'Ref' : 'ref#complete',
        \ 'VimFiler' : 'vimfiler#complete',
        \}

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.python =
  \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" mappings."{{{
" <C-y>: paste.
  inoremap <expr><C-y> pumvisible() ? neocomplete#close_popup() : "\<C-r>\""
" <C-e>: close popup.
  inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"
  inoremap <expr><C-x><C-f>
        \ neocomplete#start_manual_complete('file')

   " <TAB>: completion.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
  endfunction"}}}

" <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction

endfunction
"}}}


"# Vim-session setting{{{
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
"}}}

" color_highlight {{{
let g:colorizer_auto_filetype='css,stylus'
"}}}

" unite.vim"{{{

call unite#custom#source('file_rec', 'sorters', 'sorter_reverse')
"Match candidates by filename
call unite#custom#source(
        \ 'buffer,file_rec/async,file_rec,file_mru', 'matchers',
        \ ['converter_tail', 'matcher_regexp'])
call unite#custom#source(
        \ 'buffer,file_rec/async,file_rec,file_mru', 'converters',
        \ ['converter_file_directory'])

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
nnoremap <leader>/ :<C-u>Unite grep:$buffers<CR>
nnoremap <silent> <leader>a :<C-u>Unite buffer file_mru bookmark<CR>

autocmd MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{

"Split-right with C-v
imap <silent><buffer><expr> <C-v>  unite#do_action('right')

" Clear searching highlight
let @/ = ""

" Disable whitespace highlighting
execute 'DisableWhitespace'

nmap <buffer> <ESC>      <Plug>(unite_exit)
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup --all-text'
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
let g:syntastic_python_checkers = ['frosted', 'pylint']
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 3
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_aggregate_errors = 1
"}}}


"}}}


" vimfiler.vim"{{{
if neobundle#tap('vimfiler')
    nnoremap    <F2>   :<C-u>VimFilerExplorer<CR>
    let g:vimfiler_as_default_explorer = 1

    function! neobundle#tapped.hooks.on_source(bundle)
        let g:vimfiler_tree_leaf_icon = ' '
        let g:vimfiler_tree_opened_icon = '▾'
        let g:vimfiler_tree_closed_icon = '▸'
        let g:vimfiler_file_icon = ' '
        let g:vimfiler_readonly_file_icon = '✗'
        let g:vimfiler_marked_file_icon = '✓'
    endfunction

    autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
    function! s:vimfiler_settings()
        execute 'DisableWhitespace'
    endfunction
endif
"}}}

"indentLine {{{
let g:indentLine_color_term = 236
let bundle = neobundle#get('indentLine')
function! bundle.hooks.on_post_source(bundle)
    set concealcursor="inc"
endfunction
unlet bundle
"}}}

" Easyalign {{{
vnoremap <silent> <Enter> :EasyAlign<Enter>
"}}}

" python-jedi {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enable = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
"}}}

" undotoggle {{{
nnoremap <F5> :UndotreeToggle<cr>
"}}}

" vimux {{{
"using mappings described in docs
map <Leader>vz :VimuxZoomRunner<CR>
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <Leader>vs vip<Leader>vs<CR>

"}}}

"}}}

" Howdoi {{{
map <C-x><C-H> <Plug>Howdoi
"}}}

" gitv {{{
nmap <leader>gv :Gitv   --all<cr>
nmap <leader>gV :Gitv!  --all<cr>
vmap <leader>gV :Gitv!  --all<cr>
"}}}
"---------------------------------------------------------------------------
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
nnoremap <silent> d<space> :StripWhitespace<esc>

"#Navigate btween buffers
nnoremap <silent><leader>0 :bfirst<CR>
nnoremap <silent><leader>l :bnext<CR>
nnoremap <silent><leader>h :bprevious<CR>
nnoremap <silent><leader>$ :blast<CR>
nnoremap <silent><leader>1 :b1<CR>
nnoremap <silent><leader>2 :b2<CR>
nnoremap <silent><leader>3 :b3<CR>
nnoremap <silent><leader>4 :b4<CR>
nnoremap <silent><leader>5 :b5<CR>
nnoremap <silent><leader>6 :b6<CR>
nnoremap <silent><leader>7 :b7<CR>
nnoremap <silent><leader>8 :b8<CR>
nnoremap <silent><leader>9 :b9<CR>
nnoremap <silent><leader>d :bdelete<CR>
nnoremap <silent><leader>D :Bdelete<CR>
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

inoremap <silent> <S-Left> <esc>:<c-u>bprevious<CR>
inoremap <silent> <S-Right> <esc>:<c-u>bnext<CR>

"Window operations
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-l> <C-w>l

" Useful save mappings.
inoremap <silent> <Leader>u  <C-o>:<C-u>update<CR>
nnoremap <silent> <Leader>u :<C-u>update<CR>
nnoremap <silent> <Leader>w        :<C-u>wa<CR>
map ' `

" Easy escape."{{{
inoremap jj           <Esc>`^
cnoremap <expr> j       getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
onoremap jj           <ESC>`^

"}}}

"# Change to paste mode to avoid akward indentation
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>

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
"let g:ruby_path = system('rvm current')

" }}}

if !has('vim_starting')
    " Call on_source hook when reloading .vimrc.
    call neobundle#call_hook('on_source')
endif
