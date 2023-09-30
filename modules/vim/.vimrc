set nocompatible
filetype off

"Fra http://cscope.sourceforge.net/cscope_maps.vim
"if has("cscope")
"    cs add cscope.out
"    nmap <C-x>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-x>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-x>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-x>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-x>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-x>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-x>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-x>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
"endif

" Vundle init code
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin list
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'rhysd/vim-clang-format'
Plugin 'Valloric/YouCompleteMe'
Plugin 'embear/vim-localvimrc'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" To fix that lightline doesn't show up
set laststatus=2

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader><Enter> :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag -p ~/.agignore --hidden -g ""'

let g:localvimrc_ask = 0

let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <left> :TmuxNavigateLeft<cr>
nnoremap <silent> <down> :TmuxNavigateDown<cr>
nnoremap <silent> <up> :TmuxNavigateUp<cr>
nnoremap <silent> <right> :TmuxNavigateRight<cr>

autocmd VimResized * wincmd =
