set nocompatible "required
filetype off "required

" Set the runtime path to include vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"alternatively, pass a path where vundle should install plugins

call vundle#begin('~/.vim')

"let Vundle manage Vundle, required
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree' " File tree structure
Plugin 'davidhalter/jedi-vim' " Python auto completion 
Plugin 'bling/vim-airline' " Status bar 
Plugin 'nathanaelkane/vim-indent-guides' " For the indentation of code  
Plugin 'junegunn/fzf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
" add all your plugins here

call vundle#end() "required

"" Nerd tree is for file directory display 
autocmd vimenter * NERDTree


" Color scheme and theme setting 
colorscheme PaperColor
syntax enable
set background=dark

""""""""""""""""""""""""""""""""""""


"for the Indentation guide""""""""""

let g:indent_guides_enable_on_vim_startup = 1
set foldmethod=indent
"set foldlevel =99
nnoremap <space> za
filetype indent on 

""""""""""""""""""""""""""""""""""""""

" for graphical auto complete
set wildmenu


" If installed using git for fuzzy finder fzf
set rtp+=~/.fzf


au BufNewFile,BufRead *.py
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
set tabstop=2
set softtabstop=2
set shiftwidth=2

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespaces  /\s\+$/

set encoding=utf-8

let python_highlight_all=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
syntax on 

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
   execfile(activate_this, dict(__file__=activate_this))
EOF




"""""""""""""""""""""""""""""""""""""" for c++
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
set number
set nocp
map <F8> : !g++ % && ./a.out <CR>
""""""""""""""""""""""""""""""""""""""

"function! s:insert_gates()
"  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
"  execute "normal! i#ifndef " . gatename
"  execute "normal! o#define " . gatename . " "
""  execute "normal! Go#endif /* " . gatename . " */"
"  normal! kk
"endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"execute pathogen#infect()
"
syntax on
filetype plugin indent on


"noremap <silent><F5> :wall \| !clear && echo "% is running..." && python %<CR>
map <F5> :!clear;
