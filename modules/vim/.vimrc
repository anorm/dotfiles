set nocompatible
filetype off

" For 24 bit colors
if (has("termguicolors"))
    set termguicolors
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_ZH=[3m
set t_ZR=[23m

" Vundle init code
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin list
Plugin 'itchyny/lightline.vim'          " Fancy status line
Plugin 'sheerun/vim-polyglot'           " Language packs
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'                   " Fuzzy finder
Plugin 'junegunn/fzf.vim'               " Fuzzy finder
"Plugin 'rhysd/vim-clang-format'
Plugin 'Valloric/YouCompleteMe'         " C++ language support
Plugin 'embear/vim-localvimrc'          " Support .lvimrc files
Plugin 'christoomey/vim-tmux-navigator' " tmux integration
Plugin 'scrooloose/nerdtree'            " File explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'    " File explorer git status
Plugin 'majutsushi/tagbar'              " Outline view
Plugin 'morhetz/gruvbox'                " Color scheme
Plugin 'tpope/vim-fugitive'             " Git integration

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:gruvbox_contrast_dark="soft"
" let g:gruvbox_italic=1
colorscheme gruvbox
set breakindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set noshowmode
set autowrite
set hlsearch
"set incsearch
syntax on
set wildmode=longest:full,full
set wildmenu
set fillchars+=vert:\│

" To fix that lightline doesn't show up
set laststatus=2

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>f :FZF -q <cfile><cr>
nnoremap <silent> <Leader><Enter> :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag -p ~/.agignore --hidden -g ""'

let g:localvimrc_ask = 0

let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <left> :TmuxNavigateLeft<cr>
nnoremap <silent> <down> :TmuxNavigateDown<cr>
nnoremap <silent> <up> :TmuxNavigateUp<cr>
nnoremap <silent> <right> :TmuxNavigateRight<cr>

nnoremap <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
nnoremap <F8> :TagbarOpen fj<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

autocmd VimResized * wincmd =
autocmd BufWritePre * %s/\s\+$//e

set nowrapscan
set number

if &diff
    set noreadonly
endif
