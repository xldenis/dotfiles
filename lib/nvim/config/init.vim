
if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')

  call dein#add('rakr/vim-one')
  call dein#add('itchyny/lightline.vim')

  call dein#add('tpope/vim-sensible')

  call dein#add('w0rp/ale')
  call dein#add('Shougo/deoplete.nvim')
  
  call dein#add('copy/deoplete-ocaml')
  call dein#add('sebastianmarkow/deoplete-rust')

  call dein#add('sheerun/vim-polyglot')

  call dein#add('farmergreg/vim-lastplace')

  call dein#add('/usr/local/opt/fzf')
  " call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})

  call dein#add('https://framagit.org/tyreunom/coquille',
    \{'on_ft': ['v']})

  call dein#add('axelf4/vim-strip-trailing-whitespace')

  call dein#end()
  call dein#save_state()
endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme one
set background=dark

filetype plugin indent on
syntax enable
set noshowmode
let g:mapleader = "\<space>"

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :History:<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>m :Maps<cr>
nnoremap <leader>r :Rg<cr>

let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" set timeoutlen=250

function! KeyMappings()
  noremap <silent> <ESC>g :call CoqToCursor()<CR>
  noremap <silent> <ESC>s :call CoqNext()<CR>
  noremap <silent> <ESC>u :call CoqUndo()<CR>

  inoremap <silent> <ESC>g <C-\><C-o>:call CoqToCursor()<CR>
  inoremap <silent> <ESC>s <C-\><C-o>:call CoqNext()<CR>
  inoremap <silent> <ESC>u <C-\><C-o>:call CoqUndo()<CR>
endfunction

au FileType coq call KeyMappings()
hi default CheckedByCoq ctermbg=10 guibg=#3e4452
hi default SentToCoq ctermbg=12 guibg=#828997


tnoremap <Esc> <C-\><C-n>

" Tabs and spaces

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent

" Mouse support
set mouse=a
set rtp+=~/.opam/default/share/merlin/vim
