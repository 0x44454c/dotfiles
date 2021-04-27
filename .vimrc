noremap ;; ;
map ; :


" theme 
set background=dark

" show line number
set number

" reset tab size to 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" enable autoindent
set autoindent
set smartindent

" enter into current millenium
set nocompatible

" cursor line
" set cursorline

" enable syntax and plugins (for netrw)
syntax enable
filetype on
filetype plugin on
filetype indent on

" search down into subfolders
" Provides tab completion for all file-rlated tasks
set path+=**

" display all matching files when we tab complete
set wildmenu
set showmatch

" search settings
set incsearch
set hlsearch

" show last status line
set laststatus=2

set autowrite

" :b lets you autoomplete any open buffer

" create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R

" TWEAKS FOR BROWSING:

let g:netrw_altv=1			" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:javascript_plugin_jsdoc=1 " jsdoc plugin


" ^N lets you autocomplete tags
" ^X^F lets you autocomplete files

" REMAPPING:

" nnoremap  :w<CR>
imap  <esc>:w<CR>
imap  <esc>:u<CR>
" imap <C-s-z> <esc><C-r> not working
nmap  :q<CR>
nmap  :w<CR>
nnoremap <leader><space> :b#<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e<Space>
inoremap ii <Esc>
