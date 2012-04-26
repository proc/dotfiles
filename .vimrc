call pathogen#infect()
syntax on
filetype plugin indent on
colorscheme jellybeans
set background=dark
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme
 
" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,end,each,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
set cursorline              " highlight current line
set ttyfast                 " better scrolling 
set nobackup

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
" set nolist
" Show $ at end of line and trailing space as ~
set list!
set listchars=tab:▸\
" set lcs=tab:\ \ ,trail:~,extends:>,precedes:<
set visualbell  " No blinking .
set vb
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
 
" gvim specific
" set mousehide  " Hide mouse after chars typed
" set mouse=a  " Mouse in all modes

" Backups & Files
" set backup                     " Enable creation of backup file.
"set backupdir=~/.vim/backups " Where backups will go.
" set directory=~/.vim/tmp     " Where temporary files will go.
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd vimenter * IndentGuidesEnable

set hidden

if has('autocmd')
  autocmd BufWritePost vimrc source ~/.vimrc
endif

" Commenting
map <F5> :TComment<CR>

" Indenting
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Switch Buffer
:nnoremap <F6> :buffers<CR>:buffer<Space>
:nnoremap <F13> :NERDTreeToggle<CR>

let mapleader=','

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
nmap <leader>e :e! ~/.vimrc<CR>

" Rails rockets
function IndentV()
  Tabularize /^[^:]*\zs:/r1c0l0
  Tabularize /^[^=>]*\zs=>/l1
endfunction

map <Leader>iv :call IndentV()<cr>
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
map <leader>T :CommandTFlush<cr>\|:CommandT %%<cr>

" highlight hidden char

" highlight NonText ctermbg=darkgreen guibg=lightgreen
highlight SpecialKey ctermbg=darkgreen guibg=lightgreen

" turn off mvim toolbar
set go-=T

" Yank buffer
map <D-y> :YRShow<CR>
" au VimEnter * NERDTreeFind

:hi ModeMsg term=reverse cterm=reverse gui=reverse 
