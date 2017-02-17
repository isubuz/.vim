set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'owickstrom/vim-colors-paramount'
Plugin 'pbrisbin/vim-colors-off'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'easymotion/vim-easymotion'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/delimitMate.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/ListToggle'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Konfekt/FastFold'
Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim'}
Plugin 'hashivim/vim-terraform'
Plugin 'KabbAmine/zeavim.vim', {'on': [
    \   'Zeavim',
    \   '<Plug>Zeavim',
    \   '<Plug>ZVVisSelection',
    \   '<Plug>ZVKeyDocset',
    \   '<Plug>ZVMotion'
    \ ]}

call vundle#end()

filetype plugin indent on

"
" Settings
"
set noerrorbells		        " No beeps
set number			            " Show line numbers
set backspace=indent,eol,start	" Makes backspace key more powerful
set showcmd			            " Show me what I'm typing
set showmode			        " Show current mode

set noswapfile			        " Don't use swapfile
set nobackup			        " Don't create backup files
set nowritebackup
set splitright			        " Split vertical windows right to the current windows
set splitbelow			        " Split horizontal windows below to the current windows
set encoding=utf-8		        " Set default encoding to UTF-8
set autowrite			        " Automatically save before :next, :make etc
set autoread			        " Automatically reread changed files without prompting
set laststatus=2
set hidden

set ruler			            " Show cursor position all the time
au FocusLost * :wa		        " Set vim to save the file on focus out

set fileformats=unix,mac,dos	" Prefex unix over OSX over Windows formats

set noshowmatch 		        " Do not show matching brackets by flickering
set noshowmode			        " Show the mode with airline or lightline
set incsearch			        " Shows the match while typing
set hlsearch			        " Highlight found searches
set ignorecase			        " Search case insensitive
set smartcase			        " Search case sensitive when search pattern contains uppercase characters
set ttyfast
set lazyredraw			        " Wait to redraw

" Speed up syntax highlighting
set nocursorcolumn

" 256 colorscheme
set term=screen-256color

" Do not highlight current line
set nocursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Enable folding
set foldmethod=syntax
set foldnestmax=1
set nofoldenable
set foldlevel=0

" Clear last search highlighting with double ESC
nnoremap <silent> <Esc><Esc> :noh<CR> :call clearmatches()<CR>

" Make Vim handle long lines nicely
"set wrap
"set textwidth=79
"set formatoptions=qrn1

set autoindent
set complete-=i
set showmatch
set smarttab

set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

" Better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

syntax enable
set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme paramount

"highlight SignColumn ctermbg=white
"highlight LineNr ctermbg=white

" Highlight Invisibles. This setting must be after the colorscheme
" has been set.
highlight SpecialKey guibg=NONE ctermbg=NONE 
set listchars=tab:▸\ ,eol:¬
set nolist

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" Go settings
autocmd BufNewFile *.go setl noet ts=4 sw=4 sts=4

" Markdown settings
autocmd BufNewFile *.md setl ts=4 sw=4 sts=4 expandtab
         
" 2 spaces indentation
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype tf setlocal ts=2 sw=2 expandtab
autocmd Filetype md setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

" ========== vim-nerdtree ===========
nmap <C-n> :NERDTreeToggle<CR> 
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>

let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.vim$', '\~$', '\.git$', '\.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ========== vim-airline ===========
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" ========== Tmuxline ===========
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'right' : ''}


" ========== vim-markdown ===========
nmap <C-b> :TagbarToggle<CR>

" ========== ListToggle ===========
let g:lt_height = 5

" ========== ctrlp ===========
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10                
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_mruf_max = 450
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:ctrlp_buftag_types = {'go': '--language-force=go --golang-type=ftv'}

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" ========== vim-markdown ===========
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_formatter = 1
let g:vim_markdown_toml_formatter = 1
let g:vim_markdown_json_formatter = 1

" ========== vim-go ===========
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_build_constraints = 1
let g:go_fmt_experimental = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constants = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)

" ========== neocomplete ===========
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}}

" ==== FastFold ====
"let g:fastfold_savehook = 0

" Preserve folds on save/exit
"augroup AutoSaveFolds
    "autocmd!
    "autocmd BufWinLeave * mkview
    "autocmd BufWinEnter * silent loadview
"augroup END
