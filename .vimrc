set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'alfredodeza/coveragepy.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set ruler
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set smarttab |
    \ set expandtab |
    \ set fileformat=unix |
    \ set nosmartindent

colorscheme desert
set encoding=utf8

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Tabs {{{
" New tab
noremap <silent> <C-t> :tabnew<CR>
" Next Tab
nnoremap <silent> <C-PageDown> :tabnext<CR>
" Previous Tab
nnoremap <silent> <C-PageUp> :tabprevious<CR>
" Close Tab
nmap <silent> <C-q> :tabclose<CR>
" }}}

" " Searching and movement -------------------------------------------------- {{{
" " Use sane regexes.
" nnoremap / /\v
" vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" set gdefault
" set scrolloff=3
" set sidescroll=1
" set sidescrolloff=10
" set virtualedit+=block
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" runtime macros/matchit.vim
" map <tab> %
" silent! unmap [%
" silent! unmap ]%
" " Made D behave
" nnoremap D d$
" " Don't move on *
" " I'd use a function for this but Vim clobbers the last search when you're in
" " a function.
" nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
" " Jumping to tags.
" "
" " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" " split instead.
" "
" " Both of them will align the destination line to the upper middle part of the
" " screen. Both will pulse the cursor line so you can see where the hell you
" " are. <c-\> will also fold everything in the buffer and then unfold just
" " enough for you to see the destination line.
" function! JumpToTag()
"     execute "normal! \<c-]>mzzvzz15\<c-e>"
"     execute "keepjumps normal! `z"
"     Pulse
" endfunction
" function! JumpToTagInSplit()
"     execute "normal! \<c-w>v\<c-]>mzzMzvzz15\<c-e>"
"     execute "keepjumps normal! `z"
"     Pulse
" endfunction
" nnoremap <c-]> :silent! call JumpToTag()<cr>
" nnoremap <c-\> :silent! call JumpToTagInSplit()<cr>
" " Keep search matches in the middle of the window.
" nnoremap n nzzzv
" nnoremap N Nzzzv
" " Same when jumping around
" nnoremap g; g;zz
" nnoremap g, g,zz
" nnoremap <c-o> <c-o>zz
" " Easier to type, and I never use the default behavior.
" noremap H ^
" noremap L $
" vnoremap L g_
" " Heresy
" inoremap <c-a> <esc>I
" inoremap <c-e> <esc>A
" cnoremap <c-a> <home>
" cnoremap <c-e> <end>
" " gi already moves to "last place you exited insert mode", so we'll map gI to
" " something similar: move to last change
" nnoremap gI `.
" " Fix linewise visual selection of various text objects
" nnoremap VV V
" nnoremap Vit vitVkoj
" nnoremap Vat vatV
" nnoremap Vab vabV
" nnoremap VaB vaBV
" " Directional Keys {{{
" " It's 2013.
" noremap j gj
" noremap k gk
" noremap gj j
" noremap gk k
" " Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" " easier moving between tabs
" map <Leader>n <esc>:tabprevious<CR>
" map <Leader>m <esc>:tabnext<CR>
" noremap <leader>v <C-w>v
" " }}}

" Python-Mode {{{
" " Common Options {{{
" " pymode-common
" let g:pymode_trim_whitespace = 1
" " pymode-indent
" let g:pymode_indent = 1
" pymode-folding
let g:pymode_folding = 0
" " pymode-documentation
" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'M'
" let g:pydoc = 'pydoc'
" " pymode-virtualenv
" let g:pymode_virtualenv = 1
" " pymode-run
" let g:pymode_run = 0
" " pymode-breakpoints
" let g:pymode_breakpoint = 0
" " }}}
" " Lint Options {{{
let g:pymode_lint = 0
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']
" nnoremap <leader>L :PymodeLint
" " }}}
" Rope Options {{{
let g:pymode_rope = 1
" pymode-completion
let g:pymode_rope_completion = 0
" }}}
" " Syntax Options {{{
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_builtin_objs = 1
" let g:pymode_syntax_print_as_function = 0
" let g:pymode_syntax_space_errors = 0
" " }}}
" }}}

" Syntastic {{{
let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_baloon = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_java_checkers = ['javac']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pep8_args = "--max-line-length=99"
let g:syntastic_python_flake8_args = "--max-line-length=99"
let g:syntastic_style_error_symbol = 'E>'
let g:syntastic_style_warning_symbol = 'W>'
let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "active_filetypes": [],
            \ "passive_filetypes": ['java', 'html', 'rst']
            \ }
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
nnoremap <leader>C :SyntasticCheck<cr>
" }}}

" CTAGS

" set tags=~/.mytags
" set tags=~/.mymdmtags
" My plan was to map <C-[> with :pop, but for some reason this mapping makes
" ESC also map it, and it's a mess. Then I moved to <D-[> and then the line below
nnoremap <D-[> :pop<CR>
nnoremap <D-]> <C-]>

" YouCompleteMe recommended settings from https://code.djangoproject.com/wiki/UsingVimWithDjango
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" From: http://robertodealmeida.posthaven.com/using-ctags-in-vim-with-a-python-virtualenv 
" map <D-F11> :!ctags --exclude=".tox" --tag-relative -R --python-kinds=-i -f $VIRTUAL_ENV/tags .<CR><CR>
map <A-F11> :!ctags --exclude=".tox" --tag-relative -R --python-kinds=-i -f $VIRTUAL_ENV/tags .<CR><CR>
set tags=$VIRTUAL_ENV/tags

" Hitting Alt+d inserts ipdb debugging line in Python
inoremap <D-d> import ipdb<CR>ipdb.set_trace()<CR>

" From https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

set nu

set clipboard=unnamed
