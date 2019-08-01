set autoread " Auto-refresh unchanged files when content changes
set nocompatible
let g:mapleader=' '
let g:maplocalleader = ','

call plug#begin('~/.vim/vendor')
	Plug 'tpope/vim-sensible'

	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	Plug '/usr/local/opt/fzf'
	Plug 'junegunn/fzf.vim' " or skim?

	Plug 'dbakker/vim-projectroot'
	Plug 'morhetz/gruvbox'
	Plug 'scrooloose/nerdtree'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'easymotion/vim-easymotion'
	Plug 'mbbill/undotree'
	Plug 'tpope/vim-surround'
	Plug 'terryma/vim-expand-region'
	Plug 'tpope/vim-unimpaired'
	Plug 'scrooloose/nerdcommenter'

	Plug 'fszymanski/deoplete-emoji'

	Plug 'w0rp/ale'
	Plug 'sheerun/vim-polyglot'

	Plug 'liuchengxu/vim-which-key'
	" Plug 'jimmay5469/vim-spacemacs'
	" Plug 'liuchengxu/vim-better-default'

call plug#end()

colorscheme gruvbox
set background=dark " Gruvbox variant

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'jfkdhgls;anvmcutiroepw'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint']
\ }
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['eslint']
\ }

" let g:deoplete#enable_at_startup = 1

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" KEYBINDINGS
let g:which_key_map =  {}
set timeoutlen=150 " vim-which-key delay

" NORMAL
" Move line
nnoremap <silent> J :m+1<CR>
nnoremap <silent> K :m-2<CR>
" duplicate line
nnoremap gd :t.<CR>

" VISUAL
" move selection
vmap <silent> J :'<'>,m'>+1<CR>:normal gv<CR>
vmap <silent> K :'<'>,m'<-2<CR>:normal gv<CR>
" duplicate selection
" vnoremap gd :'<'>,t'>.<CR>:'>+1<CR>
vnoremap gd "ay'>p

" INSERT


" LEADER LEADER
nnoremap <leader><leader> :Commands<CR>
nnoremap <leader><ESC> <ESC>
nnoremap <leader>/ :ProjectRootExe Rg<CR>
let g:which_key_map['/'] = 'Search project'

" BUFFER
let g:which_key_map.b = { 'name' : '+buffer' }
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bD :bdelete!<CR>
nnoremap <Leader>br :edit<CR>
nnoremap <Leader>bR :edit!<CR>

" COMMENT (NERDCommenter)
let g:which_key_map.c = { 'name' : '+comment' }

" FILE
let g:which_key_map.f = { 'name' : '+file' }
nnoremap <leader>fs :write<CR>
nnoremap <leader>ff :ProjectRootExe Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>

" GIT


" JUMP (EasyMotion)
let g:which_key_map.j = { 'name': '+jump' }
nmap <leader>jj <Plug>(easymotion-overwin-f2)
map <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)


" VIMRC / DOTFILE
let g:which_key_map.f.e = { 'name' : '+vimrc' }
nnoremap <leader>fed :edit $MYVIMRC<CR>
nnoremap <leader>feR :source $MYVIMRC<CR>
nnoremap <leader>feS :write<CR>:source $MYVIMRC<CR>
nnoremap <leader>feI :PlugInstall<CR>
nnoremap <leader>feU :PlugUpdate<CR>


" QUIT
let g:which_key_map.q = { 'name' : '+quit' }
nnoremap <leader>qq :confirm qall<CR>
nnoremap <leader>qs :wqall<CR>
nnoremap <leader>qQ :qall!<CR>

" SEARCH
let g:which_key_map.s = { 'name': '+search' }
nnoremap <leader>ss :BLines<CR>

" TOGGLES
let g:which_key_map.t = { 'name': '+toggle' }

" WINDOW (stolen from ...)
let g:which_key_map.w = {'name': '+window' }
nnoremap <Leader>wr <C-W>r
let g:which_key_map.w.r = 'rotate'
nnoremap <Leader>wd <C-W>c
let g:which_key_map.w.d = 'close'
nnoremap <Leader>wo <C-W>o
let g:which_key_map.w.o = 'only'
nnoremap <Leader>w= <C-W>=
let g:which_key_map.w['='] = 'equalize'

nnoremap <Leader>ww <C-W>w
let g:which_key_map.w.w = '[O] focus'
nnoremap <Leader>wj <C-W>j
let g:which_key_map.w.j = '[v] focus'
nnoremap <Leader>wk <C-W>k
let g:which_key_map.w.k = '[^] focus'
nnoremap <Leader>wh <C-W>h
let g:which_key_map.w.h = '[<] focus'
nnoremap <Leader>wl <C-W>l
let g:which_key_map.w.l = '[>] focus'
" double-map
if has('nvim') || has('terminal')
  tnoremap <Leader>wj <C-W>j
  tnoremap <Leader>wk <C-W>k
  tnoremap <Leader>wh <C-W>h
  tnoremap <Leader>wl <C-W>l
endif

nnoremap <Leader>wJ <C-W>J
let g:which_key_map.w.J = '[v] move'
nnoremap <Leader>wK <C-W>K
let g:which_key_map.w.K = '[^] move'
nnoremap <Leader>wH <C-W>H
let g:which_key_map.w.H = '[<] move'
nnoremap <Leader>wL <C-W>L
let g:which_key_map.w.L = '[>] move'

nnoremap <Leader>w[ <C-W>5<
let g:which_key_map.w['['] = '[<] resize'
nnoremap <Leader>w] <C-W>5>
let g:which_key_map.w[']'] = '[>] resize'
nnoremap <Leader>w{ :resize +5<CR>
let g:which_key_map.w['{'] = '[^] resize'
nnoremap <Leader>w} :resize -5<CR>
let g:which_key_map.w['}'] = '[v] resize'

nnoremap <Leader>ws <C-W>s
let g:which_key_map.w.s = '[-] split'
nnoremap <Leader>wv <C-W>v
let g:which_key_map.w.v = '[|] split'


" TRANSFORMATIONS
let g:which_key_map.x = {'name': '+transform' }
nnoremap <leader>xd :t.<CR>
vnoremap <leader>xd "ay'>p

call which_key#register('<Space>', "g:which_key_map")
noremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
noremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
noremap <silent> [ :<c-u>WhichKey  '['<CR>
noremap <silent> ] :<c-u>WhichKey  ']'<CR>
" nnoremap <silent> g :<c-u>WhichKey  'g'<CR> " Kills gg
" nnoremap <silent> s :<c-u>WhichKey  's'<CR>

" Clear search highlight on escape
nnoremap <silent> <esc> :noh<CR><esc>

if has('gui_running')
  " Settings for when running in a GUI
  set transparency=0
  set guifont=FiraCode-Regular:h14
  set guioptions+=gme " gray menu items, menu bar, gui tabs
  set antialias
  color ir_black+
else
  " Settings for when running in the console
endif


" https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

