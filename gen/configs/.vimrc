""" General Config
set relativenumber    " Use Relative Line Number
set hlsearch          " Highlight Search Result
syntax on             " Enable Syntax Highlight
set tabstop=2         " Set Tab Equal to 2 Spaces
set shiftwidth=2
set softtabstop=2
let mapleader=" "     " Set Leader Key
set showtabline=2     " Always Show Tabline
"set tabline=%{strftime('%c')}
set laststatus=2      " Always Show Statusline
set cursorline        " Highlight Current Line
set noshowmode        " No Extra Display For Mode

""" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/LeaderF'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

""" Initialize plugin system
call plug#end()

""" Color Scheme
set background=dark
"set termguicolors
colorscheme gruvbox 

""" Nerdtree Config
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

""" LeaderF Config
nnoremap <leader>f :LeaderfFile .<CR>

""" Tabline and StatusLine Config
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'], [ 'filename']],
		  \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ]]
      \ },
      \ 'component': {
      \   'time': '%{strftime("%m-%d %a")} (ง •_•)ง',
      \   'lineinfo': ' %3l:%-2c',
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['time'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
" Switch TabLine 
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
" Close TabLine 
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)
" Manage Tab 
nmap tu :tabe<CR>
nmap tp :-tabnext<CR>
nmap tn :+tabnext<CR>
" Manage Buffer 
nmap <Leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>

let &t_SI ="\<Esc>]50;CursorShape=1\x7"
let &t_SR ="\<Esc>]50;CursorShape=2\x7"
let &t_EI ="\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
