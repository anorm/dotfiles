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
Plugin 'andreasvc/vim-256noir'
Plugin 'itchyny/lightline.vim'          " Fancy status line
Plugin 'sheerun/vim-polyglot'           " Language packs
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'                   " Fuzzy finder
Plugin 'junegunn/fzf.vim'               " Fuzzy finder
"Plugin 'rhysd/vim-clang-format'
"Plugin 'Valloric/YouCompleteMe'         " C++ language support
Plugin 'embear/vim-localvimrc'          " Support .lvimrc files
Plugin 'christoomey/vim-tmux-navigator' " tmux integration
Plugin 'scrooloose/nerdtree'            " File explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'    " File explorer git status
Plugin 'majutsushi/tagbar'              " Outline view
Plugin 'morhetz/gruvbox'                " Color scheme
Plugin 'tpope/vim-fugitive'             " Git integration
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'dense-analysis/ale'
Plugin 'vis'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_italic=1
silent! colorscheme gruvbox
set breakindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set noshowmode
set autowrite
set hlsearch
set incsearch
syntax on
set wildmode=longest:full,full
set wildmenu
set fillchars+=vert:\│
set list
set listchars=tab:>-

" To fix that lightline doesn't show up
set laststatus=2

highlight ColorColumn ctermbg=red
hi Search guibg=#A07820 guifg=#000000
call matchadd('ColorColumn', '\%121v', 100)

let mapleader = ','
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

let g:ale_python_flake8_options = '--max-line-length=188'
let g:ale_set_quickfix=0

"
" OmniSharp
"   inspired by https://github.com/OmniSharp/omnisharp-vim#example-vimrc
"
let g:OmniSharp_server_stdio = 1
if has('patch-8.1.1880')
	set completeopt=longest,menuone,popuphidden
	" Highlight the completion documentation popup background/foreground the same as
	" the completion menu itself, for better readability with highlighted
	" documentation.
	set completepopup=highlight:Pmenu,border:off
else
	set completeopt=longest,menuone,preview
	" Set desired preview window height for viewing documentation.
	set previewheight=5
endif

augroup omnisharp_commands
    autocmd!
    "autocmd CursorHold *.cs OmniSharpTypeLookup
    "autocmd CursorHoldI *.cs OmniSharpTypeLookup

	" The following commands are contextual, based on the cursor position.
	autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
	autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
	autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
	autocmd FileType cs nmap <silent> <buffer> <Leader>pd <Plug>(omnisharp_preview_definition)
	autocmd FileType cs nmap <silent> <buffer> <Leader>pi <Plug>(omnisharp_preview_implementations)
	autocmd FileType cs nmap <silent> <buffer> <Leader>t <Plug>(omnisharp_type_lookup)
	autocmd FileType cs nmap <silent> <buffer> <Leader>d <Plug>(omnisharp_documentation)
	autocmd FileType cs nmap <silent> <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
	autocmd FileType cs nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)
	autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
	autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

	" Navigate up and down by method/property/field
	autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
	autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
	" Find all code errors/warnings for the current solution and populate the quickfix window
	autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
	" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
	autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
	autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)

	autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

	autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

	autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
	autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
	autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

autocmd FileType cs set makeprg=dotnet\ msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true
autocmd FileType cs set errorformat=\ %#%f(%l\\\,%c):\ %m
