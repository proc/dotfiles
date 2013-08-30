call pathogen#infect()
syntax on
filetype plugin indent on
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
set tags=./tags;/
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif
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
" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list!
set listchars=tab:▸\
set visualbell  " No blinking .
set vb
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" default font
set gfn=Menlo\ Regular:h14

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

autocmd vimenter * IndentGuidesEnable

set hidden

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

" easy save
nnoremap <silent> <leader>s :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

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

" Remap CMD+S to :w
if has("gui_macvim")
  macmenu &File.Save key=<nop>
  :imap <D-s> <Esc><D-s>
  nnoremap <silent> <D-s> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
endif

" Abbreviate messages
set shortmess=a

" Add more space for commands
set cmdheight=2

nnoremap <silent> <C-s> :call RelatedSpecVOpen()<CR>
nnoremap <silent> ,<C-s> :call RelatedSpecOpen()<CR>

" Cmd-Shift-R for RSpec
nmap <silent> <D-R> :call RunRspecCurrentFileConque()<CR>
" Cmd-Shift-L for RSpec Current Line
nmap <silent> <D-L> :call RunRspecCurrentLineConque()<CR>
" ,Cmd-R for Last conque command
nmap <silent> ,<D-r> :call RunLastConqueCommand()<CR>

let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CWInsert = 1

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

" Ignore case unless search string has capital letters
set ignorecase
set smartcase

" Copy filename to clipboard
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>
map <F8> :!`brew --prefix`/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change Ruby 1.8 hash rockets to Ruby 1.9 syntax
map <Leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>
