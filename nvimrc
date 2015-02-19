" Initialize: "{{{

  "We need a coolest (and useful) mapleader.  
  let g:mapleader = ','

  " Define Augroup as good practice to prevent double code execution on reload
  " vimrc
  augroup nvimcmd
    autocmd!
  augroup end

  " Default bundle directory. .vim directory must exist. (NeoBundle must be
  " installed
  set runtimepath+=~/.vim/bundle/neobundle.vim/

  "Now, initializes Neobundle.
    call neobundle#begin(expand('~/.vim/bundle/'))
  "}}}

  "Plugins, plugins everywhere {{{
    "Let Neobundle manage Neobundle
    NeoBundleFetch 'Shougo/neobundle.vim'

    "A decent syntax colours
      NeoBundle 'w0ng/vim-hybrid'

    " Utils {{{
      "Highly recomended. For asynchronous plugins (like neobundle).
      NeoBundle 'Shougo/vimproc', {'build': {'unix': 'make -f make_unix.mak'}}

      " Because always use tmux. Move between tmux-panes and vim-windows with
      " with C-[hjkl]
      NeoBundle 'christoomey/vim-tmux-navigator'

      " Just change cursor when insert mode
      NeoBundle 'jszakmeister/vim-togglecursor'

      " I want a decent session manager
      NeoBundle 'xolox/vim-session', {'depends': 'xolox/vim-misc'}
      "NeoBundle 'bling/vim-airline'
    "}}}

  "end plugin list }}}
  call neobundle#end()

  " Plugins by filetype and enable indent. Required for Neobundle.
  filetype plugin indent on

  " Coloritos
  syntax enable
  " Terminal setting to allow to use `muchos coloritos`
  set t_Co=256

  "Check if every bundle listing is installed.
  NeoBundleCheck

" end-initialization }}}
 
" Plugins settings {{{

  " Vim-session setting {{{
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
  " }}}
  
" }}}

" Encoding {{{
  set encoding=utf8
" }}}

" Edit {{{
  "options needed for whitespaces instead tabs
  set tabstop=4
  set shiftwidth=4
  set expandtab
" end-edit}}}

" View {{{
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

" Plugins settings: {{{
  " vim-hybrid {{{
   let bundle = neobundle#get('vim-hybrid')
   function! bundle.hooks.on_post_source(bundle)
    colorscheme hybrid
    " Custom colors for this color scheme
    "highlight Comment ctermfg=242
   endfunction 
  " }}}
" end-plugins-settings}}}
