" Theme
set t_Co=256 " needed to correctly set theme backgrounds
let g:darkscheme = "colibri"
let g:lightscheme = "papercolor"

" set lightscheme by default
exec "colorscheme ".g:lightscheme
set background=light

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

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%*

" Use fzf
set rtp+=/usr/local/opt/fzf
nmap ; :FZF<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = [ 'eslint' ]

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
au FileType groovy setl noexpandtab

" Recognize gradle syntax
au BufNewFile,BufRead *.gradle set filetype=groovy

" start pathogen Vim bundle manager
execute pathogen#infect()
filetype off
filetype plugin indent on

""" Commands """
" Toggle between colorschemes
command! DarkScheme :exec "colorscheme ".g:darkscheme | :set background=dark
command! LightScheme :exec "colorscheme ".g:lightscheme | :set background=light

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

