set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"Set Windows like tabstops
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

"Set tabs for vhdl files
autocmd FileType vhdl setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab autoindent
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab noautoindent

"Change colorscheme to darkblue
colorscheme darkblue

"Load plugins from bundle directory add syntax highlighting and enable loading
"an indent file for filetype
execute pathogen#infect()
syntax on
filetype plugin indent on

"Code Folding
set foldmethod=indent
set foldlevel=99

"Maps Ctrl+movement to C+w +movement when using a multiple windowed screen
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Change working directory when changing tabs if t:wd is defined
au TabEnter * if exists("t:wd") | exe "cd" t:wd | endif

"Set snippets_dir
if has('win32')
	let g:snippets_dir = "C:/tools/vim/vimfiles/snippets"
endif
