" -------------------------------------
nnoremap ;; ;
nmap ; :
let mapleader="'"
" inoremap  <Esc>
vnoremap . :norm.<CR>

set nocompatible
filetype off

" -------------------------------------
"  Plugins
" -------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" add plugins here

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='luna'
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.colnr="C:"
"let g:airline_symbols.linenr=" L:"
" let g:Powerline_symbols = 'unicode'
" let g:airline_left_sep='>'

"" Git Fugitive Plugin --------------->
Plugin 'tpope/vim-fugitive'

"" LightLine Plugin ------------------>
Plugin 'itchyny/lightline.vim'
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
        \    'left': [ [ 'mode', 'paste' ],
        \               [ 'gitbranch', 'readonly', 'filename', 'modified' ],
        \               ['filesize']
        \]
        \ },
        \ 'component_function': {
          \    'gitbranch': 'FugitiveHead',
          \     'filesize': "FileSize"
          \ },
          \ }

function! FileSize()
  let l:bytes = (line2byte('$')+len(getline('$'))) | let l:sizes = ['B', 'KB', 'MB', 'GB'] | let l:i = 0
  while l:bytes >= 1024 | let l:bytes = l:bytes / 1024.0 | let l:i += 1 | endwhile
  return l:bytes > 0 ? printf(' %.1f%s ', l:bytes, l:sizes[l:i]) : ''
endfunction

Plugin 'joshdick/onedark.vim'
let g:onedark_termcolors=16
colorscheme onedark

"" auto formatter -------------------->
Plugin 'vim-autoformat/vim-autoformat'

call vundle#end()
" -------------------------- vundle#end

" -----------------------------------
" reset
" -------------------------------------
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
" set nowrap
set smartcase
set showmatch
set title
set ruler
set et
set number " relativenumber
set incsearch
set hlsearch
set autoread
set autowrite
set nobackup
set nowritebackup
set noswapfile
set spelllang=en_us
set ttimeoutlen=0

set background=dark
" set titlestring=%(%F%)%a\ -\ VIM%(\ %M%)
" set t_Co=16
set t_Co=256
hi CursorLineNr cterm=bold

" -------------------------------------
" theme
" -------------------------------------
" colorscheme synthwave84

" cursor line
" set cursorline

" enable syntax and plugins (for netrw)
syntax on
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

" show last status line
" set laststatus=2

" -------------------------------------------------------------------
" autocomplete -> https://stackoverflow.com/questions/17365324/auto-save-in-vim-as-you-type
" -------------------------------------------------------------------
augroup autosave
  autocmd!
  autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
  autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
augroup END
" -------------------------------------------------------------------
" :b lets you autoomplete any open buffer

" create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R

" TWEAKS FOR BROWSING:

let g:netrw_altv=1      " open splits to the right
let g:netrw_liststyle=3   " tree view
let g:javascript_plugin_jsdoc=1 " jsdoc plugin


" ^N lets you autocomplete tags
" ^X^F lets you autocomplete files

" REMAPPING:

" nnoremap  :w<CR>
imap  <esc>:w<CR>
imap  <esc>:u<CR>
imap <C-S-z> <esc><C-r> not working
nmap  :q<CR>
nmap  :w<CR>
nnoremap <leader><space> :b#<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e<Space>
" inoremap ii <Esc>
nnoremap ,r :vertical res
noremap <F3> :Autoformat<CR>
nnoremap<leader>s :set spell!<CR>

" -------------------------------------------------------------------
" Mapping Left and Right arrow for presentatio mode
" -------------------------------------------------------------------
autocmd BufNewFile,BufRead *.vp call ViPresentation()

function ViPresentation()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>

  if !exists('#goyo')
    Goyo
  endif
endfunction
" -------------------------------------------------------------------

" -------------------------------------------------------------------
" makes Ascii art font
" -------------------------------------------------------------------
nmap <leader>t :.!toilet -w 200 -f smblock<CR>
" makes Ascii Border
nmap <leader>1 :.!toilet -w 200 -f term -F border<CR>
" -------------------------------------------------------------------



