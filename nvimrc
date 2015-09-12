if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/bundle')


Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'ajkaanbal/autoswap.vim'
Plug 'wakatime/vim-wakatime'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'jszakmeister/vim-togglecursor'
Plug 'Shougo/unite.vim', { 'on': 'Unite' }
Plug 'w0ng/vim-hybrid'
Plug 'othree/yajs.vim', { 'for' : 'javascript' }
Plug 'marijnh/tern_for_vim', { 'for' : 'javascript' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'ntpeters/vim-better-whitespace'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'moll/vim-bbye'
"Plug 'Yggdroot/indentLine',

call plug#end()

" Encoding {{{
  set encoding=utf8
" }}}

" Edit {{{
  "options needed for whitespaces instead tabs
  set tabstop=4
  set shiftwidth=4
  set expandtab
" end-edit}}}

" KeyMappings: "{{{

  " Useful save mappings.
  nnoremap <silent> <CR> :<C-u>w<CR>

" end-keymapping}}}

" View {{{
  colorscheme hybrid
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
" }}}

" Syntax {{{
  augroup VIMRC
    autocmd FileType vim setlocal foldmethod=marker tabstop=2 shiftwidth=2
    autocmd FileType html setlocal foldmethod=indent tabstop=2 shiftwidth=2
    autocmd FileType javascript setlocal omnifunc=tern#Complete | setlocal completeopt-=preview
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
  " }}}

" end-plugins-settings}}}

" vim:foldmethod=marker shiftwidth=2 tabstop=2
