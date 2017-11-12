" Theme
set t_Co=256 " needed to correctly set theme backgrounds
let g:hybrid_custom_term_colors = 1
colorscheme gruvbox
set background=dark

set showtabline=2

" Status line
set laststatus=2
set statusline+=%y
set statusline+=%t\ 
set statusline+=%m

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=2

syntax enable
set number
set numberwidth=6
set autoindent
set smartindent
set showmatch
" set cursorline " TODO: change the cursorline color
set nowrap

" Omnifunc
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete2#Complete
endif

" Keymaps
nnoremap <C-T> :GoTestFunc<CR>

" File explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.*\.swp$,node_modules/.*,.idea/.*,.git/.*'

" Better searching
set incsearch
set hlsearch
set ignorecase

" Show tabs as characters
set list
set listchars=tab:»\ 

" Trim empty lines on bottom of files when saving
au BufWritePre *.txt $put _ | $;?\(^\s*$\)\@!?+1,$d

au FileType go setl noexpandtab
au FileType markdown set spell spelllang=en_us
au FileType markdown set wrap
au FileType markdown set nospell

" start pathogen Vim bundle manager
execute pathogen#infect()
filetype off
filetype plugin indent on

""" Ignores """
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

""" vim-go Customizations """
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
