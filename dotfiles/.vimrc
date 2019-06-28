" Theme

set t_Co=256
let g:curtains_defaultscheme = "dark"
let g:curtains_darkscheme = "gruvbox"
let g:curtains_lightscheme = "one"

if &diff
  let g:curtains_defaultscheme = "light"
  let g:curtains_lightscheme = "PaperColor"
endif

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
set statusline+=%{FugitiveStatusline()}\ 
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

" Folding
set foldmethod=syntax
"" don't autofold everything on
set nofoldenable

" Don't always resize other windows when closing one
set noequalalways

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

" One colorscheme italic support
let g:one_allow_italics = 1

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
au FileType godoc setl wrap
au FileType godoc setl colorcolumn=
au FileType markdown set spell spelllang=en_us
au FileType markdown set wrap
au FileType markdown set nospell
au FileType text set wrap
au FileType groovy setl noexpandtab
au FileType qf setl colorcolumn=

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Recognize gradle syntax
au BufNewFile,BufRead *.gradle set filetype=groovy

" start pathogen Vim bundle manager
execute pathogen#infect()
filetype off
filetype plugin indent on

""" Tagbar Customization """
let g:tagbar_left = 1
let g:tagbar_width = 45

""" Completor.vim Options """
let g:completor_gocode_binary  = '~/go/src/gocode'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

""" YCM Options """
let g:ycm_complete_in_strings = 0
let g:ycm_complete_in_comments = 0

let g:ycm_gocode_binary_path = '~/go/bin/gocode'

" Disable the normal completion, instead only trigger after a
" 'semantic trigger' like `.` or `->` or manually (ctrl+space)
let g:ycm_min_num_of_chars_for_completion = 99

""" vim-go Customizations """
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_test_show_name = 1

"" Show type of current var
let g:go_auto_type_info = 1
let g:go_updatetiming = 1000 " ms

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

"" TypeScript Tagbar config
"" https://github.com/majutsushi/tagbar/wiki#typescript
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

