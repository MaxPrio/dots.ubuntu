"VPLUG
"-----

" Install vim-plug if not found
"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"endif

" Run PlugInstall if there are missing plugins
"autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  "\| PlugInstall --sync | source $MYVIMRC
"\| endif


call plug#begin('~/.vim/plugged')

    Plug 'junegunn/vim-plug'
    Plug 'lyokha/vim-xkbswitch'

    " On-demand loading
    "Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

    " Plugin outside ~/.vim/plugged with post-update hook
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


call plug#end()
"============================================================================
    "filetype plugin indent on
    "syntax enable
"PLAGINS SPECIFIC
"vim-xkbswitch
    let g:XkbSwitchEnabled = 1
    let g:XkbSwitchIMappings = ['ru']
"GENERAL
    "
    set undolevels=1000
    set backspace=indent,eol,start
    set lazyredraw          " redraw only when we need to.

"INTERFACE 
    "
    set ruler
    set relativenumber
    set number
    set linebreak
    set showbreak=↪❭
    set visualbell
    set cmdheight=2
    set showcmd             " show command in bottom bar
    set so=7    "Set 7 lines to the cursor
    "set cursorline          " highlight current line
    set wildmenu            " visual autocomplete for command menu
    "set list               "show hidden chars
    set listchars=tab:▱▱,eol:¬,trail:~,space:‿
    "

"LINES indentation, tabs, folding.
    "
    "indentation, 
    filetype indent on      " load filetype-specific indent files
    set autoindent
    set smartindent

    "tabs
    set tabstop=4     " number of visual spaces per TAB
    set softtabstop=4    " number of spaces in tab when editing
    set expandtab       " tabs are spaces
    set shiftwidth=4
    set smarttab

    "folding
    "set foldmethod=indent   " fold based on indent level
    "set foldenable          " enable folding
    "set foldlevelstart=0   " closed by default
    "set foldcolumn=1
    "

"SEARCH
    "
    set incsearch           " search as characters are entered
    "set hlsearch            " highlight matches
    set ignorecase
    set smartcase
    "set showmatch           " highlight matching [{()}]

"MAPPINGS
    "movements
    inoremap jk <esc>
    vnoremap jk <esc>
    "toggle hidden chars.
    nnoremap <C-l> :set list!<CR>
    "unhighlight
    nnoremap <A-l> :nohlsearch<CR>
    "buffer list
    nnoremap ]b :bn<CR>
    nnoremap [b :bp<CR>
    nnoremap [[b <C-^>
    nnoremap []b :ls<CR>:b

"SPELL CHECK
"set spelllang=en
"set spell
