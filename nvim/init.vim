"{{{
set number
set complete +=kspell
set completeopt =menuone,longest
set cursorline
set nocompatible " We're running Vim, not Vi!
syntax on " Enable syntax highlighting
filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
"when in autocomplete the status bar will not change(update)
"set shortmess +=c
set scrolloff=7
set timeoutlen=300
set relativenumber
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set encoding=utf-8
"for speling completion
"============
set spell
set complete  +=k
"============
syntax enable
let g:indent_guides_enable_on_vim_startup = 1
set nowrap
set sidescroll=10
" search all sub directories
set path+=*
"vim plugin for finding files
filetype plugin on
" default updatetime 4000ms is not good for async update
set updatetime=100
" nerd tree start on when startup
" autocmd vimenter * NERDTree
"}}}
"========================================
"plugins
"========================================
"{{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"Plug 'Mofiqul/dracula.nvim'
"Plug 'morhetz/gruvbox'
"Plug 'tomasr/molokai'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'liuchengxu/vim-which-key'
"Plug 'nvim-telescope/telescope.nvim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
Plug 'jiangmiao/auto-pairs'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/vim-be-good' "for practicing vim
"for git sign adding and deleting
if has('nvim') || has('patch-8.0.902')
Plug 'mhinz/vim-signify'
else
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif
    let g:signify_sign_add               = '│'
    let g:signify_sign_delete            = '│'
    let g:signify_sign_delete_first_line = '!'
    let g:signify_sign_change            = '│'            

    highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
    highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
    highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
"for git commits and git integration
Plug  'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'https://tpope.io/vim/surround.git' "for surrounding  text
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } "for markdown preview
Plug 'https://tpope.io/vim/commentary.git' "for commenting files
Plug 'voldikss/vim-floaterm'
  let g:floaterm_keymap_new    = '<F7>'
  let g:floaterm_keymap_prev   = '<F8>'
  let g:floaterm_keymap_next   = '<F9>'
  let g:floaterm_keymap_toggle = '<F12>'
  let g:floaterm_width         =  0.8
  let g:floaterm_height        =  0.8
  hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
  hi FloatermBorder guibg=orange guifg=cyan
  
call plug#end()
"}}}
"===========================================
"key mapping
"===========================================
"{{{
nnoremap <SPACE> <Nop>
let mapleader =" "
nnoremap <C-d> <C-d>zz
nnoremap <C-d> <C-d>zz
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap ; :
noremap : :!
nmap <C-p> <Plug>MarkdownPreviewToggle

nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <A-i> :edit $MYVIMRC<CR>
"}}}
"============================================
"wild menu
"============================================
"{{{
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.class
  
"}}}
"============================================
"enable folding
"============================================
" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" P> 
" P> 
" Use the marker method of folding.
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}
" ===========================================
" color scheme
" ===========================================
"{{{
colorscheme palenight
hi Normal guibg=NONE ctermbg=NONE
"}}}

