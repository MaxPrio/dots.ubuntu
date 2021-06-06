" VUNDLE
  " Settins
    "set nocompatible              " be iMproved, required
    "filetype off                  " required

    " set the runtime path to include Vundle and initialize
    "set rtp+=~/.vim/bundle/Vundle.vim
"------------------------------------------------------
    "call vundle#begin()

    " let Vundle manage Vundle, required
    "Plugin 'VundleVim/Vundle.vim'

    " The following are examples of different formats supported.
    
  "GitHub plugins
    "Plugin 'tpope/vim-fugitive'
    "Plugin 'mattn/emmet-vim' "html & css
    "Plugin 'vim-scripts/bash-support.vim'
    "Colors
    "Plugin 'xolox/vim-misc'
    "Plugin 'xolox/vim-colorscheme-switcher'
    "Plugin 'arcticicestudio/nord-vim'
    "Plugin 'pinecoders/vim-pine-script'
    "Plugin 'noah/vim256-color'
  "Other plugins
    " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'L9'
    "
    "Plugin 'vim-xkbswitch'
        " Dont forget: $ sudo apt-get install xkb-switch
    "
    " Git plugin not hosted on GitHub
    "Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    "Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    "Pass the path to set the runtimepath properly.
    "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Install L9 and avoid a Naming conflict if you've already installed a
    " different version somewhere else.
    " Plugin 'ascenator/L9', {'name': 'newL9'}

    "All of your Plugins must be added before the following line
    "call vundle#end()            " required
"------------------------------------------------------
    "filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
    
"============================================================================

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
    "
    "movements
    nnoremap j gj
    nnoremap k gk
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

"EMMET CONFIG
    "redefine trigger
    "let g:user_emmet_leader_key=','

"SPELL CHECK
"set spelllang=en
"set spell
