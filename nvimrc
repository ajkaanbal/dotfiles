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

" end-view}}}

" Utils {{{
  set path+=**
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
  
" end-plugins-settings}}}

