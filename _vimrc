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

set nu
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
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

map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>

"Change working directory when changing tabs if t:wd is defined
au TabEnter * if exists("t:wd") | exe "cd" t:wd | endif

"Set snippets_dir
if has('win32')
	let g:snippets_dir = "C:/tools/vim/vimfiles/snippets"
endif
