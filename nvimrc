if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/bundle')


Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'ajkaanbal/autoswap.vim'
Plug 'wakatime/vim-wakatime'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'jszakmeister/vim-togglecursor'
Plug 'Shougo/unite.vim' | Plug 'Shougo/vimfiler.vim'
Plug 'w0ng/vim-hybrid'
" Plug 'othree/yajs.vim', { 'for' : 'javascript' }
Plug 'marijnh/tern_for_vim', { 'for' : 'javascript' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'ntpeters/vim-better-whitespace'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'moll/vim-bbye'
Plug 'bling/vim-airline',
Plug 'derekwyatt/vim-scala'
Plug 'airblade/vim-gitgutter'
Plug 'artnez/vim-wipeout', {'on': 'Wipeout'}
Plug 'tomtom/tcomment_vim'
Plug 'cohama/lexima.vim'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'ensime/ensime-vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
Plug 'justinmk/vim-sneak'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'jiangmiao/simple-javascript-indenter', {'for': 'javascript'}
Plug 'wincent/terminus'
Plug 'tpope/vim-rsi'
Plug 'mattn/emmet-vim/', {'for': ['html']}
" Plug 'ajkaanbal/vim-scala-utils'


call plug#end()

" Encoding {{{
  set encoding=utf8
" }}}

" Edit {{{
  "options needed for whitespaces instead tabs
  set tabstop=4
  set shiftwidth=4
  set expandtab
  set tags=.tags
  set wildignorecase
  set ignorecase
  set autoindent
  set hidden
" end-edit}}}

" KeyMappings: "{{{

  " Useful save mappings.
  nnoremap <silent> <CR> :<C-u>w<CR>
  augroup autosave
    autocmd! CmdwinEnter *  nunmap <CR>
    autocmd! CmdwinLeave *  nnoremap <silent> <CR> :<C-u>w<CR>
    autocmd! InsertLeave,BufLeave,FocusLost * silent! update
  augroup END

  " Close help buffer with q
  autocmd FileType help :nnoremap <buffer> <silent> q :<C-u>bdelete<CR>
  autocmd CmdwinEnter * map <buffer> <silent> q :<C-u>q<CR>

  " Clear last searching highlight
  nnoremap <silent><space><space> :<c-u>let @/ = ""<return><esc>

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
  hi OverLength ctermbg=246 ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
  augroup VIMRC
    autocmd!
    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline
  augroup END
" end-view}}}

" Utils {{{
  let g:mapleader = ','
" }}}

" Mappings {{{
  nnoremap <silent> d<space> :StripWhitespace<esc>
  nnoremap <silent>Q :<c-u>Bdelete<CR>

  "indent with tab and shift tab
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv
" }}}

" Syntax {{{
  augroup VIMRC
    autocmd FileType vim setlocal foldmethod=marker tabstop=2 shiftwidth=2
    autocmd FileType html setlocal foldmethod=indent tabstop=2 shiftwidth=2
    autocmd FileType javascript setlocal omnifunc=tern#Complete | setlocal completeopt-=preview | setlocal tabstop=2 shiftwidth=2
  augroup END
" }}}

" Plugins settings: {{{

  " Vim-session setting {{{
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
  " }}}

  " Unite {{{
    let g:unite_source_history_yank_enable = 1
    let g:unite_enable_split_vertically = 0
    let g:unite_winheight = 12
    let g:unite_enable_short_source_names = 1
    let g:unite_source_file_mru_filename_format = ':~:.'
    let g:unite_source_file_mru_limit = 300
    let g:unite_source_directory_mru_limit = 300
    let g:unite_split_rule = 'botright'
    let g:unite_marked_icon = '✗'
    let g:unite_prompt = '» '
    let g:unite_enable_start_insert = 1
    if executable('ag')
        "call unite#custom#default_action('directory', 'narrow')
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --all-text'
        let g:unite_source_grep_recursive_opt = ''
        let g:unite_source_rec_async_command=['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
    endif
    " nnoremap <leader>f :<C-u>Unite file_rec/async:! -sync -prompt-direction=top<CR>
    nnoremap <leader>f :<C-u>Unite file_rec/neovim:! -prompt-direction=top<CR>
    nnoremap <leader>p :<C-u>Unite file_rec/async -prompt-direction=top<cr>
    nnoremap <leader>b :<C-u>Unite buffer -prompt-direction=top<cr>
    nnoremap <leader>t :<C-u>Unite tab -prompt-direction=top<cr>
    nnoremap <leader>r :<C-u>Unite file_mru -prompt-direction=top<CR>
    nnoremap <leader>m :<C-u>Unite mark -prompt-direction=top<CR>
    nnoremap <leader>k :<C-u>Unite bookmark -prompt-direction=top<CR>
    nnoremap <leader>j :<C-u>Unite jump -prompt-direction=top<CR>
    nnoremap <leader>c :<C-u>Unite change -prompt-direction=top<CR>
    nnoremap <leader>o :<C-u>Unite outline -prompt-direction=top<CR>
    nnoremap <leader>/ :<C-u>Unite grep:. -prompt-direction=top<CR>
    nnoremap <leader>a :<C-u>Unite buffer file_mru bookmark -prompt-direction=top<CR>
    nnoremap <leader>* :<C-u>UniteWithCursorWord grep:. -prompt-direction=top<cr>
    autocmd VIMRC filetype unite call s:unite_my_settings()
    function! s:unite_my_settings()
        imap <silent><buffer><expr> <C-v>  unite#do_action('right')
        let @/ = ""
        execute 'silent DisableWhitespace'
        nmap <buffer> <ESC>      <Plug>(unite_exit)
    endfunction

  " Airline {{{
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
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#fnamemod = ':p:t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''

  " }}}

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

  " vimviler {{{
    let g:vimfiler_tree_leaf_icon = ' '
    let g:vimfiler_tree_opened_icon = '▾'
    let g:vimfiler_tree_closed_icon = '▸'
    let g:vimfiler_file_icon = '-'
    let g:vimfiler_marked_file_icon = '*'
    let g:vimfiler_options_direction = 'topright'
    let g:vimfiler_options_direction = 'topright'

    nnoremap <silent><F2> :<C-u>VimFilerExplorer -find<CR>
    call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })

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

    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsListSnippets="<c-tab>"
    let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

  "}}}

  " Ensime {{{
    autocmd FileType scala nnoremap gD :<c-u>EnDeclaration<cr>
    autocmd FileType scala nnoremap gB :<c-u>EnDocBrowse<cr>
  "}}}

  " vim-tmux-runner {{{
    nnoremap R :VtrSendLinesToRunner<CR>
    vnoremap <Enter> :VtrSendLinesToRunner<cr>
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


" end-plugins-settings}}}

" vim:foldmethod=marker shiftwidth=2 tabstop=2
