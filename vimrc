set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" My Plugins
Plug 'alvan/vim-closetag'
Plug 'airblade/vim-gitgutter'
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim'}
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'commit': 'b319ed9753906a0737bfbd5d5e69b443966a8cd8'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'hashivim/vim-terraform'
Plug 'mileszs/ack.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'skywind3000/asyncrun.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Valloric/ListToggle'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'

call plug#end()

filetype plugin indent on

"
" Settings
"
set noerrorbells		        " No beeps
set number			            " Show line numbers
set backspace=indent,eol,start	" Makes backspace key more powerful
set showcmd			            " Show me what I'm typing
set showmode			        " Show current mode
set clipboard=unnamed           " Copy into mac clipboard

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
let g:two_firewatch_italics=1
let g:solarized_termcolors=16
colorscheme two-firewatch
set termguicolors

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
let NERDTreeIgnore = ['\.vim$', '\~$', '\.git$', '\.DS_Store', '\.idea']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ========== vim-go ===========
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constants = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

nmap ∆ <c-w>w<c-e><c-w>w
nmap ˚ <c-w>w<c-y><c-w>w

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

fun! ReloadBuffers() 
    set noconfirm
    bufdo e!
    set confirm
    syntax enable
endfun

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType typescript syn clear foldBraces
autocmd Filetype html,ruby,javascript,json,less,css,scss setlocal ts=2 sts=2 sw=2
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %L

"function! s:format_js()
  "call AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
"endfunction

autocmd FileType js map <leader>b :<C-u>call <SID>format_js()<CR>

" == json ==
let g:vim_json_syntax_conceal = 0

"let g:ale_set_highlights = 0
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier_eslint']
 \ }

let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

cnoreabbrev Ack Ack!
nnoremap <Leader>z :Ack! <cword><CR>

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Resize splits to equal sizes
autocmd VimResized * wincmd =
set equalalways 

let g:closetag_filenames = '*.html,*.js,*.jsx'
