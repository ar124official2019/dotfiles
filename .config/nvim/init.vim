" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" Plug 'ryanoasis/vim-devicons'
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake', { 'on': 'Neomake' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'neomake/neomake'
" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"Javascript Plugins
Plug 'pangloss/vim-javascript'
" Plug 'carlitux/deoplete-ternjs'
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

"Typescript Plugins
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi'
" Plug 'mhartington/deoplete-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

" let g:tern_request_timeout = 1
" let g:tern_request_timeout = 6000
" let g:tern#command = ["tern"]
" let g:tern#arguments = ["--persistent"]
" let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

autocmd! BufWritePost * Neomake
let g:neomake_warning_sign = {
      \ 'text': '?',
      \ 'texthl': 'WarningMsg',
      \ }

let g:neomake_error_sign = {
      \ 'text': 'X',
      \ 'texthl': 'ErrorMsg',
      \ }


"Editor Configurations
set number
set tabstop=2
set shiftwidth=2
set expandtab
noremap <C-r> :source ~/.config/nvim/init.vim<CR>

"THEME SETTINGS
colorscheme dracula
set background=dark
let g:airline_theme='onedark'
if (has("termguicolors"))
  set termguicolors
endif

"MISC
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
