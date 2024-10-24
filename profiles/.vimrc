"""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vimwiki/vimwiki'
Plugin 'maxbrunsfeld/vim-yankstack' "cycle through yanks with <Leader>p
Plugin 'Townk/vim-autoclose' "brackets etc
Plugin 'preservim/nerdcommenter'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

"""""""""""""""""""""""""""""""""""""
" EDITOR
"""""""""""""""""""""""""""""""""""""
if !exists("g:syntax_on") " only run once
    syntax enable " enable syntax processing
endif

colorscheme badwolf

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufRead Dockerfile.* set syntax=dockerfile
autocmd FileType sh setlocal textwidth=80 colorcolumn=+0

" spaces and tabs
set shiftwidth=2 " affects shift commands
set softtabstop=2 " number of spaces inserted on <Tab>
set tabstop=2 " expands \t to this many spaces
set expandtab " makes <Tab> a shortcut for insert spaces

" line display
set number " display line numbers (LHS)
set ruler " display the line and character numbers (bottom right)
set cursorline " highlights the current line

" status display
set showcmd " display incomplete commands (bottom right)
set laststatus=2 " always display the status line
set cmdheight=2 " number of status lines displayed before hit-enter request

" text wrapping
set wrap " visually wraps without inserting newline
set linebreak " don't wrap in the middle of words
set backspace=2 " make backspace work like most other programs

" scrolling
set scrolloff=999 " keeps cursor centered

" backup
set writebackup " backup files during saving
set autowrite " automatically write files on exit
set autoread " automatically reload file on detected external change

" commands
set wildmenu " visual autocomplete for command menu

" searching
set incsearch " search as characters are entered
set hlsearch " highlight matches

" autohighlights the word under the cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""

" turn off search highlighting and spellcheck
nnoremap <Leader><Space> :nohlsearch<CR>

" disable arrow movement, resize splits instead
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" move vertically by visual (wrapped) line
nnoremap j gj
nnoremap k gk

" visual selects last inserted text
nnoremap gV `[v`]

" save session (including window configuration etc)
" reopen with vim -S
nnoremap <Leader>ss :mksession!<CR>

" buffer navigation
nnoremap <Leader>; :bp<CR>
nnoremap <Leader>' :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>\ :buffers<CR>:b<Space>
nnoremap <silent> <Leader>q :bp<cr>:bd #<cr>:AirlineRefresh<cr>

" autoformatting to textwidth
nnoremap <Leader>a :g/./ normal gqq<CR>:nohlsearch<CR>

" location list navigation
nnoremap <Leader>[ :lprevious<CR>
nnoremap <Leader>] :lnext<CR>

" force mapping of W to save
autocmd VimEnter * :command W write

" quicker escape from insert mode
set ttimeoutlen=100

"""""""""""""""""""""""""""""""""""""
" VIMWIKI
"""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '/Users/ramsey/Library/CloudStorage/GoogleDrive-ramsey144@gmail.com/My\ Drive/now/'}] " path of the default wiki <Leader>ww

"""""""""""""""""""""""""""""""""""""
" YANKSTACK
"""""""""""""""""""""""""""""""""""""
" shortcut to cycle through yanks
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

"""""""""""""""""""""""""""""""""""""
" AIRLINE
"""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1 " enables the tagline

