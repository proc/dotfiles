call pathogen#infect()
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
syntax on
" filetype plugin indent on
colorscheme smyck
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


" Turn off case sensitivity for lower case searches, and turn on case sensitivity
" for searches with at least 1 uppercase character
set ignorecase
set smartcase

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
set shortmess=atI
nnoremap <Leader>u :GundoToggle<CR>
" set foldmethod=syntax
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
  autocmd bufwritepost .vimrc source ~/.vimrc
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
nmap <Leader>] :Tabularize /=><CR>
vmap <Leader>] :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <leader>e :e! ~/.vimrc<CR>

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

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

set iskeyword-=_

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Remove all trailing whitespace from the file
nmap <leader>c :%s/\s\+$//g<CR>

if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=public/assets
endif

nnoremap <F3> :NumbersToggle<CR>
:imap ii <Esc>

set runtimepath+=~/.vim/after/syntax

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> 1000<C-O><C-U>
imap <silent> <PageDown> 1000<C-O><C-D>
map <silent> - 1000<C-U>
map <silent> <Space> 1000<C-D>
set nostartofline

" Bundles
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/YankRing.vim'

set path+=/path/to/your/rails-application/app/**
set path+=/path/to/your/rails-application/lib/**
set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')
" or you can add substitution pattern s/ies$/y/g, s/ves$/f/g like this:
" set includeexpr+=substitute(substitute(substitute(v:fname,'s$','','g'),'ie$','y','g'),'ve$','f','g')

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
nmap tgf <C-w>gf
