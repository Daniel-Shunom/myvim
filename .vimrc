set nocompatible
set encoding=UTF-8
set number
set relativenumber
set hlsearch
set path+=**
set showmode
set showcmd
set smartcase
set incsearch
set nowrap
set shiftwidth=2
set tabstop=2
set expandtab
set scrolloff=15
set wildmenu
set wildmode=list:longest
set ruler
syntax on
filetype on
filetype plugin on
filetype indent on

highlight Directory guifg=#00FFFF ctermfg=cyan

let g:polyglot_disabled = ['autoindent']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" PLUGINS ======================================== {{{
call plug#begin('~/.vim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'voldikss/vim-floaterm'
  Plug 'SirVer/ultisnips'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'altercation/vim-colors-solarized'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

set background=light
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

function! FindGleamProjectRoot(buffer) abort
  return ale#path#FindNearestDirectory(a: buffer, 'gleam.toml')
endfunction

" }}}

" MAPPINGS ========================================== {{{
inoremap <C-_> <C-w>
inoremap <C-a> <C-o>e<Right>
inoremap <C-b> <C-o>b
inoremap jk <Esc>
inoremap <C-j> <Esc>o
noremap <C-e> <C-o>$
inoremap <A-LEFT> <C-o>b
inoremap <A-RIGHT> <C-o>w
inoremap <A-UP> <Esc>gki
inoremap <A-DOWN> <Esc>gji
inoremap <A-s> <C-o> :update<CR>

" Use <Tab> and <S-Tab> to navigate the autocomplete menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <CR> (Enter) to confirm the selection
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

nnoremap <Leader><Tab> :NERDTreeToggle<CR>

nnoremap <Leader>ft :FloatermNew<CR>

nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 

nnoremap <C-x> x
nnoremap <C-s> :update<CR>
" }}}

" VIMSCRIPT ========================================== {{{
autocmd VimEnter * if argc() == 0 | NERDTree | endif
command! MakeTags !ctags -R .

augroup gleam_syntax
  autocmd!
  autocmd BufNewFile,BufRead *.gleam set filetype=gleam
augroup END

" }}}

" STATUS LINE ======================================== {{{
set laststatus=2
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R\
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" }}}

