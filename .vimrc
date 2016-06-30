" My vimrc
" --------------------
execute pathogen#infect()|					" pathogen

syntax on
filetype plugin on
filetype plugin indent on

colorscheme solarized 

" Keybindings
" --------------------

"syntax = nmap + keystroke you want + keystroke that exists
imap jj <esc>|							" remap esc to jj
nmap ; :|							" remap : to ;

let mapleader = "\<space>"|					" defining leader key

nmap <leader>1 :!ls<cr>|					" bind shell output to leader + 1




" keywords are surrounded by angle brackets.. examples..
" <leader>
" <c> = control
" <c-x> = control + x
"nnoremap
"inoremap
"vnoremap

