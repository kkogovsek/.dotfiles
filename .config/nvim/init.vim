" Plugged plugins call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-scripts/L9'
Plug 'scrooloose/nerdtree'
Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
" Expand je z Ctrl + y
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'

call plug#end()

" Nerd Tree File view
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right"

set encoding=utf8

" Teme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Line numbering
set relativenumber

" Syntactics
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Fugitive (oneline)
set statusline+=%{fugitive#statusline()}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

" Aurline
let g:airline#extensions#tabline#enabled = 1

" Completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" ESLINT

function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_jscs_args =
    \ get(g:, 'syntastic_javascript_jscs_args', '') .
    \ FindConfig('-c', '.eslintrc', expand('<afile>:p:h', 1))

let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Ruler
execute "set colorcolumn=" . join(range(81,81), ',')

" Ctrl-P
set wildignore+=*/node_modules/*,*/coverage/*,*/bower_components/*,*.so,*.swp,*.zip 

" Remap leader to ','
let mapleader = ","
tnoremap <Esc> <C-\><C-n>

" REACT
let g:jsx_ext_required = 0

" Close tags
let g:closetag_filenames = "*.html,*.js"
