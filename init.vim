" Make Vim more useful
set nocompatible

" ================ General Config ====================

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line       
set cursorline
" Make tabs as wide as two spaces
set tabstop=2 shiftwidth=2 expandtab
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Keep 1000 lines of command line history
set history=1000 

" Spell checking for text files
" au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_gb
" au BufNewFile,BufRead,BufEnter *.md setlocal spell spelllang=en_gb

au BufNewFile,BufReadPost *.md set filetype=markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Strip trailing whitespace (,ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

let mapleader="\<SPACE>"

call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/bling/vim-bufferline'
" Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'tpope/vim-fugitive'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'voxpupuli/vim-puppet'
Plug 'reedes/vim-thematic'
Plug 'reedes/vim-pencil'
Plug 'hashivim/vim-hashicorp-tools'
call plug#end()


let g:thematic#themes = {
\  'solarized_dark': { 'colorscheme': 'solarized', 
\                      'background': 'dark', 
\                      'solarized_termtrans': '1',
\                      'solarized_termcolors': '256',
\                    },
\  'solarized_light': { 'colorscheme': 'solarized',
\                       'background': 'light',
\                     },
\  'pencil_dark': { 'colorscheme': 'pencil', },
\  'pencil_light': { 'colorscheme': 'pencil', 'background': 'light', }
\ }
let g:thematic#theme_name = 'solarized_dark'

" syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

set switchbuf+=usetab,newtab

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.vim$']

filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:python_host_prog = '/usr/local/bin/python'

" adding nicer key bindings for copying to system clipboard
vmap <C-x> :!pbcopy<CR> 
vmap <C-c> :w !pbcopy<CR><CR> 

" Open file menu
nnoremap <Leader>t :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

nnoremap <Leader>e :NERDTreeTabsToggle<CR>


nnoremap tn :tabnew<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
