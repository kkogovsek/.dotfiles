" Plugged plugins call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-scripts/L9'
Plug 'scrooloose/nerdtree'
Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
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
Plug 'heavenshell/vim-jsdoc'
Plug 'vim-scripts/taglist.vim'
Plug 'phb1/gtd.vim'
Plug 'lervag/vimtex'
Plug 'trevordmiller/nova-vim'
Plug 'w0rp/ale'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/JavaBrowser'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

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
" colorscheme nova

" Line numbering
set relativenumber

" Syntactics
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Fugitive (oneline)
set statusline+=%{fugitive#statusline()}
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


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

" autocmd FileType javascript let b:syntastic_javascript_jscs_args =
"    \ get(g:, 'syntastic_javascript_jscs_args', '') .
"    \ FindConfig('-c', '.eslintrc', expand('<afile>:p:h', 1))

"let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
"let g:syntastic_javascript_eslint_exe='node_modules/.bin/eslint'

let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" let g:syntastic_javascript_checkers = ['eslint']

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" remap iz hjkl v jkl;
noremap ; l
noremap l k
noremap k j
noremap j h

nmap <silent> <A-h> gT<CR>
nmap <silent> <A-l> gt<CR>

" Ruler
execute "set colorcolumn=" . join(range(81,81), ',')

" Ctrl-P
set wildignore+=*/node_modules/*,*/coverage/*,*/bower_components/*,*.so,*.swp,*.zip 

" Remap leader to ','
let mapleader = ","
" tnoremap <Esc> <C-\><C-n>
tnoremap <C-x> <C-\><C-n>

" REACT
let g:jsx_ext_required = 0

" Close tags
let g:closetag_filenames = "*.html,*.js"

"JSDOC
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
    let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe "mksession! " . b:sessionfile
    endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if (len(argv()) == 0)
    let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()
map <leader>m :call MakeSession()<CR>

" Gtd
let g:gtd#dir = '~/notes'

" Reindent
map <F7> mzgg=G`z
set mouse=a

let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_lint_delay = 750
let g:ale_fix_on_save = 1
" Copy/paste from keyboard by default
set clipboard^=unnamed

function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
