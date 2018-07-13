" Theme
set t_Co=256 " needed to correctly set theme backgrounds
let g:curtains_defaultscheme = "light"
let g:curtains_darkscheme = "gruvbox"
let g:curtains_lightscheme = "papercolor"

set showtabline=2

" Status line
set laststatus=2
set statusline=
set statusline+=\ \ " add some right padding
set statusline+=%y
set statusline+=\ 
set statusline+=%F
set statusline+=\ %r
set statusline+=\ 
set statusline+=%m
set statusline+=%=
set statusline+=\ 
set statusline+=Buf\ %n
set statusline+=\ 
set statusline+=[%l/%L\ \|\ %p%%]
set statusline+=\ \ \ " add some right padding

" character col width ruler
set colorcolumn=80
au BufNewFile,BufRead *.java set colorcolumn=80,120
au BufNewFile,BufRead *.go set colorcolumn=80,120
au BufNewFile,BufRead *.html set colorcolumn=120

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
set nowrap
set completeopt-=preview

" Keymaps
nnoremap <C-T> :GoTestFunc<CR>
nnoremap <C-\> :TagbarToggle<CR>

"" Use ctrl+space to trigger completion
inoremap <C-@> <C-x><C-o>

"" Ctrl+C while in visual mode to copy/paste to clipboard
vnoremap <C-c> "+y<CR>
noremap <C-v> :r !pbpaste<CR><CR>

" File explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.*\.swp$,node_modules/.*,.idea/.*,.git/.*'

" Use fzf
set rtp+=/usr/local/opt/fzf
nmap ; :FZF<CR>

" Better searching
set incsearch
set hlsearch
set ignorecase

" Show tabs as characters
set list
set listchars=tab:»\ ,trail:•

" Trim empty lines on bottom of files when saving
" TODO this always moves our cursor to the bottom
" on each save, super annoying
" au BufWritePre * $put _ | $;?\(^\s*$\)\@!?+1,$d

au FileType go setl noexpandtab
au FileType markdown set spell spelllang=en_us
au FileType markdown set wrap
au FileType markdown set nospell
au FileType groovy setl noexpandtab

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Recognize gradle syntax
au BufNewFile,BufRead *.gradle set filetype=groovy

" start pathogen Vim bundle manager
execute pathogen#infect()
filetype off
filetype plugin indent on

""" Ignores """
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

""" Tagbar Customization """
let g:tagbar_left = 1
let g:tagbar_width = 55

""" vim-go Customizations """
let $GOPATH = "/Users/tylerfowler/go"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1

"" Go Tagbar config
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }
