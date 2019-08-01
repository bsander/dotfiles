set autoread " Auto-refresh unchanged files when content changes
set number
set nocompatible
let g:mapleader=' '
let g:maplocalleader = ','

call plug#begin('~/.vim/vendor')
	Plug 'tpope/vim-sensible'

	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	Plug 'dbakker/vim-projectroot'
	Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
	Plug 'lotabout/skim.vim'

	Plug 'morhetz/gruvbox'
	Plug 'scrooloose/nerdtree'
	Plug 'mbbill/undotree'

	Plug 'fszymanski/deoplete-emoji'
	Plug 'w0rp/ale'

	" Text Manipulation
	Plug 'tpope/vim-unimpaired'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-surround'
	Plug 'terryma/vim-expand-region'
	Plug 'scrooloose/nerdcommenter'
	Plug 'tommcdo/vim-exchange'

	" Languages
	Plug 'sheerun/vim-polyglot'
	Plug 'jparise/vim-graphql'

	" UI / Syntax
	Plug 'editorconfig/editorconfig-vim'
	Plug 'luochen1990/rainbow'
	Plug 'liuchengxu/vim-which-key'
	" Plug 'jimmay5469/vim-spacemacs'
	" Plug 'liuchengxu/vim-better-default'

call plug#end()

colorscheme gruvbox
set background=dark " Gruvbox variant

call deoplete#custom#option('sources', {
\  '_': ['ale', 'emoji'],
\ })

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 0

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'jfkdhgls;anvmcutiroe'

let g:rainbow_active = 1

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\   'auto_complete_delay': 150,
\   'auto_refresh_delay': 150,
\   'smart_case': v:true,
\ })
call deoplete#custom#source('emoji', 'filetypes', [])
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])


" let g:ale_set_balloons = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'vim': ['vint']
\ }

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['eslint']
\ }

" let g:deoplete#enable_at_startup = 1

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
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
\ 'header':  ['fg', 'Comment']
\ }

" KEYBINDINGS

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
vnoremap gd "ay'>p
" vnoremap gd :'<'>,t'>.<CR>:'>+1<CR> " Can't be repeated with multiple lines


" INSERT


" WHICH_KEY
let g:which_key_map =  {}
set timeoutlen=150 " vim-which-key delay

" LEADER LEADER
noremap <leader><Space> :Commands<CR>
noremap <leader><C-Space> :History:<CR>
nnoremap <leader><ESC> <ESC>
nnoremap <leader>/ :ProjectRootExe Rg<CR>
nnoremap <Leader><Tab> :bnext<CR>
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
nnoremap <leader>ft :NERDTreeFind %<CR>
nnoremap <leader>fT :NERDTreeToggle<CR>

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
nnoremap <leader>feC :PlugClean<CR>


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
nnoremap <leader>tn :set invnumber<CR>
nnoremap <Leader>t- :let &scrolloff=999-&scrolloff<CR>


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
nnoremap <leader>wt :tabnew<CR>

nnoremap <Leader>w. :tabnext<CR>
let g:which_key_map.w['.'] = '[>] tab'
nnoremap <Leader>w, :tabprev<CR>
let g:which_key_map.w[','] = '[<] tab'

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

" LOCAL LEADER
let g:which_key_local_map = {}
noremap <silent> <localleader><localleader> :ALEHover<CR>
noremap <silent> <localleader><leader> :ALEFix<CR>

" ERRORS
let g:which_key_local_map.e = {'name': '+errors'}
noremap <localleader>el :lopen<CR>
noremap <localleader>ee :lnext<CR>
noremap <localleader>eE :lprev<CR>
noremap <localleader>ed :lclose<CR>


call which_key#register('<Space>', 'g:which_key_map')
call which_key#register(',', 'g:which_key_local_map')

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

" nnoremap <silent> g :<c-u>WhichKey 'g'<CR>
" vnoremap <silent> g :<c-u>WhichKeyVisual 'g'<CR>

nnoremap <silent> [ :<c-u>WhichKey '['<CR>
vnoremap <silent> [ :<c-u>WhichKeyVisual '['<CR>

nnoremap <silent> ] :<c-u>WhichKey ']'<CR>
vnoremap <silent> ] :<c-u>WhichKeyVisual ']'<CR>

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

" Use interactive grep versions
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', '÷'))

" Go to last cursor position when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
