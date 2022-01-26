" ------------------MI NEOVIM-----------------------------------
 
set title
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber 
set laststatus=2
set noshowmode
set termguicolors
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter


"----------------------PLUGINS-----------------------
call plug#begin('~/.local/share/nvim/plugged')

" visual
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'

" syntax
Plug 'sheerun/vim-polyglot'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" themes
Plug 'dracula/vim',{'as':'dracula'}

" Tree
Plug 'scrooloose/nerdtree'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" autocomplete
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'ddollar/nerdcommenter'

" git
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'

call plug#end()

" Theme
set background=dark
colorscheme dracula

" ----------------------- MAPS --------------

let mapleader=" "

" no keyboard arrows
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" testing
nnoremap <Leader>t :TestNearest<CR>
nnoremap <Leader>T :TestFile<CR>
nnoremap <Leader>TT :TestSuite<CR>

" shortcuts
nnoremap <leader>w :w<CR> 
nnoremap <Leader>q :q<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <leader>t :tabe<CR>
nnoremap <leader>vs :vsp<CR>
nnoremap <leader>sp :sp<CR>
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>e :e$MYVIMRC<CR> 

" split resize
nnoremap <silent> <right> :vertical resize +5<CR> 
nnoremap <silent> <left> :vertical resize -5<CR> 
nnoremap <silent> <up> :resize +5<CR> 
nnoremap <silent> <down> :resize -5<CR> 

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev blame Gblame
cnoreabbrev find NERDTreeFind
cnoreabbrev diff Gdiff

" plugs
map <Leader>nt :NERDTreeFind<CR>
map <Leader>ff :Files<CR>
map <Leader>ag :Ag<CR>
nmap <Leader>f <Plug>(easymotion-s2)

" tabs navigation
nnoremap <leader>l :bnext<CR> 
nnoremap <leader>h :bprevious<CR>

" terminal 
vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR> 
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" buffers
map <Leader>ob :Buffers<cr>

" git
nnoremap <Leader>G :G<cr>
nnoremap <Leader>gp :Gpush<cr>
nnoremap <Leader>gl :Gpull<cr>


"------------------------- PLUGINS CONFIGURATION--------------------------

" treesitter 
"activa la resolucion de colores del plug (activar cada idioma con ej-> :TSInstal java)
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
