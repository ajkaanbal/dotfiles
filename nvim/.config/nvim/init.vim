autocmd FileType vim setlocal foldmethod=marker tabstop=2 shiftwidth=2
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/bundle')


" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'ajkaanbal/autoswap.vim'
Plug 'wakatime/vim-wakatime'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" managing Coc with PLug doesn't work but g:coc_global_extensions should be enough
let g:coc_global_extensions = ['coc-snippets', 'coc-yaml']
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0ng/vim-hybrid'
" Plug 'othree/yajs.vim', { 'for' : 'javascript' }
Plug 'posva/vim-vue'
" Plug 'w0rp/ale'
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'tpope/vim-obsession'
Plug 'ntpeters/vim-better-whitespace'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'moll/vim-bbye'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'derekwyatt/vim-scala'
Plug 'airblade/vim-gitgutter'
Plug 'artnez/vim-wipeout', {'on': 'Wipeout'}
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
Plug 'majutsushi/tagbar'
" Plug 'SirVer/ultisnips' CocCommand snippets.editSnippets
Plug 'honza/vim-snippets',
Plug 'bps/vim-textobj-python'
Plug 'hynek/vim-python-pep8-indent'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'chase/vim-ansible-yaml'
" Plug 'avakhov/vim-yaml'
" Plug 'ensime/ensime-vim'
Plug 'christoomey/vim-tmux-runner'
" Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
Plug 'justinmk/vim-sneak'
Plug 'elzr/vim-json', {'for': 'json'}
" Plug 'jiangmiao/simple-javascript-indenter', {'for': 'javascript'}
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'wincent/terminus'
Plug 'tpope/vim-rsi'
Plug 'mattn/emmet-vim/', {'for': ['html', 'javascript.jsx']}
Plug 'neo4j-contrib/cypher-vim-syntax'
" Plug 'scrooloose/syntastic'
Plug 'vim-scripts/SQLUtilities' | Plug 'vim-scripts/Align'
Plug 'tweekmonster/startuptime.vim'
Plug 'tommcdo/vim-lion'
Plug 'djoshea/vim-autoread'
Plug 'othree/xml.vim', {'for': ['xml', 'html']}
Plug 'jparise/vim-graphql'
" Plug 'natebosch/vim-lsc'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go', { 'do': ':silent :GoUpdateBinaries' }
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" Plug 'zxqfl/tabnine-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vmchale/dhall-vim'
Plug 'vito-c/jq.vim' ", {'for': 'jq'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'aklt/plantuml-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'dag/vim-fish'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'towolf/vim-helm'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ 'for': 'scala',
"     \ }


" Plug 'ajkaanbal/vim-scala-utils'
"


call plug#end()

" Encoding {{{
  set encoding=utf8
" }}}

" Edit {{{
  "options needed for whitespaces instead tabs
  set tabstop=4
  set shiftwidth=4
  set shiftround
  set expandtab
  set tags=.tags
  set wildignorecase
  set noignorecase
  set autoindent
  set hidden
" end-edit}}}
"

" LUA{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "brainfuck" },  -- list of language that will be disabled
  },
}
EOF

" }}}

" KeyMappings: "{{{

  " Useful save mappings.

  " autocmd BufRead,BufReadPre,BufNewFile * :nnoremap <silent> <CR> :<C-u>w<CR>
  nnoremap <silent> <CR> :<C-u>w<CR>


  augroup autosave
    autocmd! CmdwinEnter *  nunmap <CR>
    autocmd! CmdwinLeave *  nnoremap <silent> <CR> :<C-u>w<CR>
    autocmd! InsertLeave,BufLeave,FocusLost * silent! update
  augroup END
  if exists(':tnoremap')  " Neovim
    tnoremap <silent> <c-h> <c-\><c-n>:TmuxNavigateLeft<cr>
    tnoremap <silent> <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
    tnoremap <silent> <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
    tnoremap <silent> <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
    tnoremap <Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    " Send an scape to a nvim terminal
    " tnoremap <C-v><Esc> <Esc>
    " Cannot use <c-\> here.
    " tnoremap <silent> <c-\> <c-\><c-n>:TmuxNavigatePrevious<cr>
  endif

  " Close help buffer with q
  autocmd FileType help :nnoremap <buffer> <silent> q :<C-u>bdelete<CR>
  autocmd CmdwinEnter * map <buffer> <silent> q :<C-u>q<CR>

  " Clear last searching highlight
  nnoremap <silent><space><space> :<c-u>let @/ = ""<return><esc>

  " Don't override register on paste.
  ""These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
  xnoremap p "_dP
  xnoremap <silent> p p:let @+=@0<CR>

  " nnoremap d "_d
  " vnoremap d "_d
  " nnoremap D "_D
  " vnoremap D "_D
  nnoremap c "_c
  vnoremap c "_c
  nnoremap C "_C
  vnoremap C "_C

  " preview substitutions
  set inccommand=nosplit

" end-keymapping}}}

" View {{{
  colorscheme hybrid
  set background=dark
  set number
  set nowrap
  set showcmd
  set list
  set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:%,eol:¬
  set splitbelow
  set splitright
  set foldlevel=5
  set colorcolumn=80
  set cursorline
  set concealcursor=""
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
  set lazyredraw


  hi ExtraWhitespace ctermbg=9
  hi Pmenu ctermfg=255 ctermbg=236
  hi PmenuSel ctermbg=255 ctermfg=24
  hi PmenuSbar ctermbg=233
  hi PmenuThumb ctermbg=238
  hi NonText ctermfg=darkgrey guifg=darkgrey ctermbg=none
  hi clear SpecialKey
  hi link SpecialKey NonText
  hi MatchParen cterm=bold ctermfg=255 ctermbg=27
  hi ColorColumn ctermbg=235 ctermfg=white guibg=#592929
  augroup VIMRC
    autocmd!
    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline
  augroup END
  " Show line number.
  set relativenumber
  augroup RelativeNumber
    autocmd!
    autocmd WinLeave,InsertEnter * set norelativenumber number
    autocmd WinEnter,InsertLeave * set relativenumber
  augroup END
  augroup SwitchLang
    autocmd!
    autocmd WinEnter,InsertLeave * silent exec "!xkb-switch -s us"
  augroup END
  set clipboard+=unnamedplus


" end-view}}}

" Utils {{{
  let g:mapleader = ','
  " Check highlight colors
  " :help highlight
  " :source $VIMRUNTIME/syntax/hitest.vim
" }}}

" Mappings {{{
  " let g:python3_host_prog = expand('$HOME/.pyenv/versions/3.7.3/bin/python')
  nnoremap <silent> d<space> :StripWhitespace<esc>
  nnoremap <silent>Q :<c-u>Bdelete<CR>

  "indent with tab and shift tab
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv
  " save read-only files
  cmap w!! w !sudo tee % >/dev/null

" }}}

" Syntax {{{
  augroup VIMRC
    autocmd FileType,BufRead,BufNewFile *.vue setlocal tabstop=2 shiftwidth=2
    autocmd FileType,BufRead,BufNewFile *.go setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.rml set ft=xml
    autocmd BufRead,BufNewFile *.msg set ft=json
    autocmd FileType vim setlocal foldmethod=marker tabstop=2 shiftwidth=2
    autocmd FileType html,css,json,xml,htmldjango,js,javascript.jsx setlocal foldmethod=indent tabstop=2 shiftwidth=2 sts=2
    autocmd FileType scala setlocal colorcolumn=80,100,120
    autocmd FileType json setlocal equalprg=jq
    autocmd FileType yaml setlocal foldmethod=indent foldlevel=0 tabstop=2 shiftwidth=2 sts=2
    autocmd FileType dhall setlocal foldlevel=0 tabstop=2 shiftwidth=2 sts=2
  augroup END
" }}}

" Plugins settings: {{{

  " Ale {{{
  let g:ale_completion_enabled = 1
  let g:ale_virtualtext_cursor = 0

  let g:ale_set_signs = 0
  hi link ALEErrorLine ErrorMsg
  hi link ALEWarningLine WarningMsg
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_delay = 0
  " }}}

  " Vim-session setting {{{
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
  " }}}

  " FZF{{{
  "
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --word-regexp --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
  let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
  let g:fzf_layout = { 'down': '~20%' }
  let $FZF_DEFAULT_COMMAND='fd --type f'
  command! -bang Buffers call fzf#run(fzf#wrap('buffers',
    \ {'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'options': '--reverse'}, <bang>0))
  nnoremap <leader>f :<C-u>FZF --reverse<CR>
  nnoremap <leader>b :<C-u>Buffers<CR>
  nnoremap <leader>* :<C-u>Rg <C-R><C-W><CR>
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
  let g:fzf_preview_window = []

  " }}}

  " lightline {{{

    let g:lightline = {
      \ 'colorscheme': 'ajk',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

    " Use autocmd to force lightline update.
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


  " }}}

  hi Substitute ctermbg=3 ctermfg=0
  " buftabline {{{
    let g:buftabline_numbers=2 " use ordinal numbers not internal vim buffer number
    nmap <leader>1 <Plug>BufTabLine.Go(1)
    nmap <leader>2 <Plug>BufTabLine.Go(2)
    nmap <leader>3 <Plug>BufTabLine.Go(3)
    nmap <leader>4 <Plug>BufTabLine.Go(4)
    nmap <leader>5 <Plug>BufTabLine.Go(5)
    nmap <leader>6 <Plug>BufTabLine.Go(6)
    nmap <leader>7 <Plug>BufTabLine.Go(7)
    nmap <leader>8 <Plug>BufTabLine.Go(8)
    nmap <leader>9 <Plug>BufTabLine.Go(9)
    nmap <leader>0 <Plug>BufTabLine.Go(-1)
    function! BuftablineGo(agg)
        let s:b = a:agg - 1
        execute printf("exe 'b'.get(buftabline#user_buffers(),%d,'')", s:b)
    endfunction
    command! -nargs=1 B call BuftablineGo(<args>)
    " command! -nargs=1 Go exe printf("'b'.get(buftabline#user_buffers(),%d,'')<cr>", 2)
    hi BufTabLineFill ctermbg=235 ctermfg=white
    hi BufTabLineHidden ctermbg=235 ctermfg=243
    hi link BufTabLineCurrent TabLineSel
    hi BufTabLineActive ctermbg=236 ctermfg=243
  " }}}

  " gitgutter {{{
    nmap [h <Plug>(GitGutterPrevHunk)
    nmap ]h <Plug>(GitGutterNextHunk)
    nmap ghs <Plug>(GitGutterStageHunk)
    nmap ghu <Plug>(GitGutterUndoHunk)
    nmap ghp <Plug>(GitGutterPreviewHunk)

    let g:gitgutter_sign_added = '✜'
    let g:gitgutter_sign_modified = '✎'
    let g:gitgutter_sign_removed = '✄'
    let g:gitgutter_sign_modified_removed = '✎✄'

    highlight GitGutterAdd    guifg=#009900 guibg=0 ctermfg=2
    highlight GitGutterChange guifg=#bbbb00 guibg=0 ctermfg=3
    highlight GitGutterDelete guifg=#ff2222 guibg=0 ctermfg=1
  " }}}

  " vimviler {{{
    " let g:vimfiler_tree_leaf_icon = ' '
    " let g:vimfiler_tree_opened_icon = '▾'
    " let g:vimfiler_tree_closed_icon = '▸'
    " let g:vimfiler_file_icon = '-'
    " let g:vimfiler_marked_file_icon = '*'
    " let g:vimfiler_options_direction = 'topright'
    " let g:vimfiler_options_direction = 'topright'

    " nnoremap <silent><F2> :<C-u>VimFilerExplorer -find<CR>
    " call vimfiler#custom#profile('default', 'context', {
    "   \ 'safe' : 0,
    "   \ })

     "}}}

  " Tagbar {{{
    nnoremap <F8> :<C-u>TagbarToggle<CR>
  " }}}

  " splitjoin {{{
    let g:splitjoin_split_mapping = ''
    let g:splitjoin_join_mapping = ''

    nnoremap gJ :silent SplitjoinJoin<cr>
    nnoremap gS :silent SplitjoinSplit<cr>
  "}}}

  " UltiSnips {{{

    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

  "}}}

  " YouCompleteme {{{
    " let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  "}}}

  "{{{ vim-commentary
  autocmd FileType sql setlocal commentstring=--\ %s
  "}}}

  " Deoplete {{{
    let g:deoplete#enable_at_startup = 1
    " let g:deoplete#omni_patterns = {}
    " let g:deoplete#omni_patterns.scala = '[^. *\t]\.\w*'
    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.scala = '[^. *\t]\.\w*'
  " }}}

  " UltiSnips {{{
  let g:UltiSnipsExpandTrigger="c-<tab>"
  " }}}


  " coc {{{
    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    "
    let g:coc_node_path = '/usr/bin/node'
    hi CocRustTypeHint ctermfg=237 ctermbg=none
    hi CocRustChainingHint ctermfg=237 ctermbg=none

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> for trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
  " }}}


  " Tern {{{
    " autocmd FileType javascript nnoremap gD :<c-u>TernDef<cr>
  "}}}

  " JSX{{
    let g:jsx_ext_required = 0
  " }}

  " Closetags {{
    let g:closetag_filenames = "*.html,*.js,*.pt"
  " }}

  " Align - lion {{{
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    " glip=
  "}}}

  " " Jedi {{{
  "   autocmd FileType python setlocal completeopt-=preview
  "   let g:jedi#goto_assignments_command = "gD"
  "   hi jediFunction term=NONE cterm=NONE ctermfg=33 ctermbg=0
  "   hi jediFat term=bold,underline cterm=bold,underline ctermbg=0 ctermfg=248
  " " }}}

  " vim-tmux-runner {{{
    nnoremap R :VtrSendLinesToRunner<CR>
    vnoremap <Enter> :VtrSendLinesToRunner<cr>
    let g:VtrDisplayPaneNumbers = 0
  "}}}

  "indentLine {{{
    let g:indentLine_faster = 1
    let g:indentLine_color_term = 236
    let g:indentLine_noConcealCursor = "nc"
    let g:indentLine_concealcursor=""
    let g:indentLine_char ='┆'
  "}}}

  "Sneak {{{
    let g:sneak#streak = 1
    hi link SneakPluginTarget ErrorMsg
    hi link SneakStreakMask  Comment
    hi link SneakStreakTarget  ErrorMsg
    hi link SneakStreakStatusLine ErrorMsg
  "}}}

  " vim-ensime {{{
    let g:EnErrorStyle='SpellBad'
  " }}}

  " syntastic {{{
  "
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_style_error_symbol = '☢'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_style_warning_symbol = '≈'
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_python_checkers = ['frosted', 'pylint','flake8']
    let g:syntastic_auto_loc_list = 2
    let g:syntastic_loc_list_height = 3

  " }}}

  " vim-go {{{
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
  " }}}


  "coc-vim{{{
    au BufRead,BufNewFile *.sbt set filetype=scala
      " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Some server have issues with backup files, see #649
    set nobackup
    set nowritebackup

    " Use <c-space> for trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` for navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gD <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nnoremap <leader>c :<C-u> CocCommand<CR>
    " Remap for do codeAction of current line
    nmap <leader>ca :<C-u>call CocActionAsync('codeAction', 'cursor')<CR>

    " Remap for do action format
    nnoremap <silent> F :call CocAction('format')<CR>

    " Use K for show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent! call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType scala setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " Organize imports

    " autocmd BufWrite *.scala :call CocActionAsync('organizeImport')
    nnoremap <silent> <leader>oi  :<C-u>CocCommand editor.action.organizeImport<CR>



    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call CocAction('fold', <f-args>)


    " Metals specific commands

    " Toggle panel with Tree Views
    nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
    " Toggle Tree View 'metalsPackages'
    nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
    " Toggle Tree View 'metalsCompile'
    nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
    " Toggle Tree View 'metalsBuild'
    nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
    " Reveal current current class (trait or object) in Tree View 'metalsPackages'
    nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

  "}}}


  " dadbod {{{
  " Default storage path: ~/.local/share/db_ui
  autocmd FileType sql if exists('g:autoloaded_db') | :nnoremap <silent> <CR> :<C-u> echo 'Save on enter disabled'<CR>

  " }}}

  " {{{
  autocmd FileType netrw setl bufhidden=wipe
  " autocmd FileType netrw setl bufhidden=delete
  " }}}

" end-plugins-settings}}}

" vim:foldmethod=marker shiftwidth=2 tabstop=2
