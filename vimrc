" Initialize: "{{{
"---------------------------------------------------------------------------

" No 'vi' compatible commands.
set nocompatible


" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundleLazy 'Shougo/unite.vim', {
\  'autoload': {'commands': ['Unite']}
\}
NeoBundle 'sgoranson/unite-mark', {'depends': 'Shougo/unite.vim'}
NeoBundle 'Shougo/unite-outline', {'depends': 'Shougo/unite.vim'}
NeoBundle 'Shougo/neomru.vim', {'depends': 'Shougo/unite.vim'}
NeoBundleLazy 'Shougo/vimfiler', {
\ 'depends' : 'Shougo/unite.vim',
\ 'autoload' : {
\    'commands' : [{ 'name' : 'VimFiler',
\                    'complete' : 'customlist,vimfiler#complete' },
\                  'VimFilerExplorer',
\                  'Edit', 'Read', 'Source', 'Write'],
\    'mappings' : ['<Plug>(vimfiler_'],
\    'explorer' : 1,
\ }
\ }
NeoBundleLazy 'thinca/vim-ref', { 'autoload': { 'filetypes': ['python']} }
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'bling/vim-airline'
NeoBundleLazy 'majutsushi/tagbar', {
\  'autoload': { 'commands': 'TagbarToggle'}
\}
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'mattn/emmet-vim/',{
\ 'autoload' : {
\   'filetypes': ['html', 'htmldjango', 'xhtml']
\ }}
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundleLazy 'mjbrownie/django-template-textobjects', {
\ 'depends': 'kana/vim-textobj-user',
\ 'autoload' : {
\   'filetypes': ['html', 'htmldjango']
\ }}
NeoBundleLazy 'bps/vim-textobj-python', {
\ 'depends': 'kana/vim-textobj-user',
\ 'autoload' : {
\   'filetypes': 'python'
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
\   'filetypes': ['xml', 'html', 'htmldjango']
\ }}
NeoBundle 'xolox/vim-session', {'depends': 'xolox/vim-misc'}
NeoBundleLazy 'moll/vim-bbye', {
      \ 'autoload': {
      \   'commands': 'Bdelete'
      \}}

NeoBundleLazy 'othree/vim-javascript-syntax', { 'autoload' : {
      \ 'filetypes' : 'javascript',
      \ }}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', { 'autoload': {
      \ 'filetypes': 'javascript'}}
NeoBundleLazy 'elzr/vim-json', { 'autoload': {
      \ 'filetypes': 'json' }}
NeoBundleLazy 'chrisbra/Colorizer', {
\ 'autoload' : {
\   'filetypes': ['css', 'stylus'],
\   'commands': 'ColorHighlight'
\ }}
NeoBundleLazy 'wavded/vim-stylus', {
\ 'autoload' : {
\   'filetypes': 'stylus'
\ }}
NeoBundleLazy 'guns/xterm-color-table.vim.git', {
      \ 'autoload': {
      \   'commands': 'XtermColorTable'
      \ }}

" NeoBundleLazy 'hdima/python-syntax', {
" \ 'autoload' : {
" \   'filetypes': 'python'
" \ }}

NeoBundle 'Raimondi/delimitMate' " Automatic closing quotes,...
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'sdanielf/vim-stdtabs' " common indents
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'wellle/targets.vim'
NeoBundleLazy 'https://raw.githubusercontent.com/JessicaKMcIntosh/Vim/master/syntax/sql.vim', {
\   'type': 'raw',
\   'script_type': 'syntax',
\   'autoload': {'filetypes': ['sql']}
\}
NeoBundleLazy 'mbbill/undotree', {
\ 'autoload': {
\    'commands': 'UndotreeToggle'
\ }}
" from vim.org
NeoBundleLazy 'matchit.zip', { 'autoload' : {
      \ 'mappings' : [['nxo', '%', 'g%']]
      \ }}
let bundle = neobundle#get('matchit.zip')
function! bundle.hooks.on_post_source(bundle)
    silent! execute 'doautocmd Filetype' &filetype
endfunction

NeoBundleLazy 'amadeus/django.vim', {
\ 'autoload' : {
\   'filetypes': ['htmldjango','django']
\ }}

NeoBundleLazy 'artnez/vim-wipeout', {'autoload': {'commands': 'Wipeout'}}
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'benmills/vimux'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ajkaanbal/autoswap.vim'
NeoBundle 'jszakmeister/vim-togglecursor'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
" Plugins for syntax highlight
NeoBundle 'sheerun/vim-polyglot'
NeoBundleLazy 'smancill/conky-syntax.vim',
\ {'autoload':{ 'filetypes': 'conkyrc'}}
"Neobundle configuration
call neobundle#config('unite.vim', {
\   'lazy': 1,
\   'autoload': {
\       'commands' : [{ 'name' : 'Unite',
\                       'complete' : 'customlist,unite#complete_source'}]
\   }})

" call neobundle#config('neocomplete.vim', {
" \ 'lazy' : 1,
" \ 'autoload' : {
" \   'insert' : 1,
" \ }})
"
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
nnoremap <silent><space><space> :<c-u>let @/ = ""<return><esc>
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
set foldlevelstart=6



set fillchars=vert:\|
set commentstring=%s

" Exclude = from isfilename.
set isfname-==

" Reload .vimrc automatically.
autocmd MyAutoCmd BufWritePost vimrc source $MYVIMRC

" Keymapping timeout.
set timeout timeoutlen=1200 ttimeoutlen=50

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

" remove highlight search
autocmd MyAutoCmd InsertEnter * let @/ = ""

" auto update files
autocmd MyAutoCmd BufLeave,FocusLost * silent! update

"}}}


"---------------------------------------------------------------------------
"" View:{{{

" Show line number.
set relativenumber
augroup RelativeNumber
  autocmd!
  autocmd WinLeave,InsertEnter * set norelativenumber number
  autocmd WinEnter,InsertLeave * set relativenumber
augroup END

" Show <TAB> and <CR>
set list
set listchars=tab:▶\ ,trail:·,extends:»,precedes:«,nbsp:%,eol:¬

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
set autoindent

augroup MyAutoCmd

  " Auto reload VimScript.
  autocmd BufWritePost,FileWritePost *.vim if &autoread
        \ | source <afile> | echo 'source ' . bufname('%') | endif

  " Enable omni completion.
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType python set omnifunc=jedi#completions
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType python setlocal completeopt-=preview
  if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
  else
    " autocmd FileType python setlocal omnifunc=jedi#completions
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
  autocmd FileType xml  setlocal sw=2 ts=2 sts=2
  autocmd FileType yaml  setlocal sw=2 ts=2 sts=2

  " Close help buffer with q
  autocmd FileType help :nnoremap <buffer> <silent> q :<C-u>bdelete<CR>
  autocmd CmdwinEnter * map <buffer> <silent> q :<C-u>q<CR>

  "functions
    fun! <SID>DetectHTMLDjango()
      let n = 1
      while n < 20 && n < line("$")
        if getline(n) =~ '{%\s*\(extends\|block\|comment\|ssi\|if\|for\| blocktrans\)\>'
          set ft=htmldjango
          return
        endif
        let n = n + 1
      endwhile
    endfun

    "autocmds
    autocmd BufNewFile,BufRead *.html call <SID>DetectHTMLDjango()
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

" UltiSnips {{{

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"
"}}}

"# Vim-session setting{{{
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
"}}}

" color_highlight {{{
let g:colorizer_auto_color = 0
"}}}

" unite.vim"{{{

call unite#custom#source('file_rec', 'sorters', 'sorter_reverse')
"Match candidates by filename
call unite#custom#source(
        \ 'buffer,file_rec/async,file_rec,file_mru', 'matchers',
        \ ['converter_tail', 'matcher_regexp'])

call unite#custom#source(
        \ 'buffer', 'converters',
        \ ['converter_file_directory'])

call unite#custom#source('file_rec/async,file_rec,file_mru,buffer', 'filters',
\ ['converter_relative_word', 'matcher_default',
\  'sorter_default', 'converter_relative_abbr'])

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
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup --all-text'
    let g:unite_source_grep_recursive_opt = ''

    "ignore what there is in .gitignore or .hgignore
    let g:unite_source_rec_async_command='ag --follow --nocolor --nogroup -g ""'
endif


nnoremap <C-@>f :<C-u>Unite file_rec/async:! -prompt-direction=top<CR>
nnoremap <C-@>p :<C-u>Unite file_rec/async -prompt-direction=top<cr>
nnoremap <C-@>b :<C-u>Unite buffer -prompt-direction=top<cr>
nnoremap <C-@>t :<C-u>Unite tab -prompt-direction=top<cr>
nnoremap <C-@>r :<C-u>Unite file_mru -prompt-direction=top<CR>
nnoremap <C-@>m :<C-u>Unite mark -prompt-direction=top<CR>
nnoremap <C-@>k :<C-u>Unite bookmark -prompt-direction=top<CR>
nnoremap <C-@>j :<C-u>Unite jump -prompt-direction=top<CR>
nnoremap <C-@>c :<C-u>Unite change -prompt-direction=top<CR>
nnoremap <C-@>o :<C-u>Unite outline -prompt-direction=top<CR>
nnoremap <C-@>/ :<C-u>Unite grep:. -prompt-direction=top<CR>
nnoremap <C-@>a :<C-u>Unite buffer file_mru bookmark -prompt-direction=top<CR>
nnoremap <C-@>* :<C-u>UniteWithCursorWord grep:. -prompt-direction=top<cr>

autocmd MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{
    "Split-right with C-v
    imap <silent><buffer><expr> <C-v>  unite#do_action('right')

    " Clear searching highlight
    let @/ = ""

    " Disable whitespace highlighting
    execute 'DisableWhitespace'

    nmap <buffer> <ESC>      <Plug>(unite_exit)
endfunction "}}}


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
let g:syntastic_style_error_symbol = '☢'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['frosted', 'pylint','flake8']
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 3
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_aggregate_errors = 1

highlight SyntasticStyleErrorSign cterm=bold ctermfg=166
highlight SyntasticErrorSign cterm=bold ctermfg=1

"}}}

" easy-motion {{{
    "Bi-directional find motion
    nmap s <Plug>(easymotion-s)
"}}}


" vimfiler.vim {{{
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
vnoremap <silent> <space> :EasyAlign<Enter>
"}}}

" undotoggle {{{
nnoremap <F5> :UndotreeToggle<cr>
"}}}
"
" delimitMate {{{
  let delimitMate_expand_cr = 2
  let delimitMate_expand_space = 1
" }}}

" vimux {{{
let g:VimuxRunnerIndex=1
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vnoremap <Enter> "vy :call VimuxSlime()<CR>
"}}}

"}}}

" gitv {{{
"}}}

" gitgutter {{{
  nmap [h <Plug>GitGutterPrevHunk
  nmap ]h <Plug>GitGutterNextHunk
  nmap ghs <Plug>GitGutterStageHunk
  nmap ghr <Plug>GitGutterRevertHunk
  nmap ghp <Plug>GitGutterPreviewHunk

  let g:gitgutter_sign_added = '✜'
  let g:gitgutter_sign_modified = '✎'
  let g:gitgutter_sign_removed = '✄'
  let g:gitgutter_sign_modified_removed = '✎✄'
" }}}

" matchtagalways {{{
   let g:mta_filetypes = {
           \ 'html' : 1,
           \ 'xhtml' : 1,
           \ 'xml' : 1,
           \ 'jinja' : 1,
           \ 'htmldjango' : 1,
           \}
"}}}

"{{{ vim-ref
if neobundle#tap('vim-ref')
  function! neobundle#hooks.on_source(bundle)
    let g:ref_cache_dir = expand('~/.cache/ref')
    let g:ref_use_vimproc = 1

    autocmd MyAutoCmd FileType ref call s:ref_my_settings()
    function! s:ref_my_settings() "{{{
      " Overwrite settings.
      nnoremap <buffer> q <C-w>c
    endfunction"}}}
  endfunction
endif
"}}}

"}}}


"---------------------------------------------------------------------------
" KeyMappings: "{{{

" Remove all trailing whitespace:
nnoremap <silent> d<space> :StripWhitespace<esc>

"#Navigate btween buffers
nnoremap <silent>gb :bnext<CR>
nnoremap <silent>gB :bprevious<CR>
nnoremap <C-T> <C-^>
nnoremap <silent>Q :<c-u>Bdelete<CR>

"Window operations
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-l> <C-w>l

inoremap <silent><C-l> <esc><C-w>l
inoremap <silent><C-k> <esc><C-w>k
inoremap <silent><C-h> <esc><C-w>h
inoremap <silent><C-l> <esc><C-w>l

" Useful save mappings.
nnoremap <silent> <CR> :<C-u>update<CR>
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
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

cnoremap <C-P> <up>
cnoremap <C-N> <down>

"}}}


"---------------------------------------------------------------------------
" Others: {{{

"Session options
set ssop-=options    " do not store global and local values in a session
set ssop+=folds
set path+=**

" }}}


if !has('vim_starting')
    " Call on_source hook when reloading .vimrc.
    call neobundle#call_hook('on_source')
endif

" vim:foldmethod=marker shiftwidth=2 tabstop=2
