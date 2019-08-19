scriptencoding utf-8

" TODO LIST
" - :cdo :cfdo - interactive global search replace (qfreplace plugin)
" - deal with yank/paste vs system registry
" - iab
" - vimdiff
" - split up init.vim
" - toggles
" - leader group undo (C-h u)
" - tig - rebase and un/stage keybindings
" - customize easymotion setup
" - proper debugging support
" FIXME - broken
" - fzf - empty list on no input
" - figure out tabline (tabs - windows - buffers)
" - NERDCommenterInsert adds extra newline
" - fzf extra commands not working https://github.com/junegunn/fzf.vim/issues/18
" https://bitbucket.org/bestseller-ecom/product-catalog/pull-requests/164?t=1
" - fzf with ripgrep - go to column

let g:mapleader=' '
let g:maplocalleader = ','

call plug#begin('~/.vim/vendor')

  Plug 'tpope/vim-sensible'
  Plug 'liuchengxu/vim-better-default'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
  " Plug 'lotabout/skim.vim'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'

  Plug 'dbakker/vim-projectroot'
  Plug 'moll/vim-bbye'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'morhetz/gruvbox'

  Plug 'w0rp/ale'

  " Text Manipulation
  Plug 'tpope/vim-unimpaired' " Would like to replace with custom setup
  Plug 'terryma/vim-multiple-cursors' " https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-expand-region'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tommcdo/vim-exchange'
  Plug 'jiangmiao/auto-pairs'

  " Languages
  Plug 'editorconfig/editorconfig-vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'jparise/vim-graphql'

  " UI / Syntax
  Plug 'andrewradev/bufferize.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'airblade/vim-gitgutter'
  Plug 'luochen1990/rainbow'
  Plug 'whiteinge/diffconflicts'

  " Tools
  Plug 'liuchengxu/vim-which-key'
  " Plug 'iberianpig/tig-explorer.vim'
  Plug '~/src/forks/tig-explorer.vim'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-fugitive'
  Plug 'idanarye/vim-merginal'
  Plug 'DataWraith/auto_mkdir'
  Plug 'airblade/vim-matchquote'

  " Experimental
  Plug 'thinca/vim-qfreplace'
  " Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-vinegar'
  Plug 'justinmk/vim-dirvish'

call plug#end()

" gx open urls with this thing
let g:netrw_http_cmd = 'open'
let g:netrw_gx='<cWORD>'


let g:vim_better_default_enable_folding = 0
let g:vim_better_default_persistent_undo = 0
let g:vim_better_default_key_mapping = 1
let g:vim_better_default_basic_key_mapping = 0
let g:vim_better_default_buffer_key_mapping = 0
let g:vim_better_default_file_key_mapping = 0
let g:vim_better_default_fold_key_mapping = 0
let g:vim_better_default_window_key_mapping = 0

runtime! plugin/default.vim
set termguicolors " make terminal colors vork in vimr
set autoread " Auto-refresh unchanged files when content changes
set norelativenumber
set nonumber
set signcolumn=yes
set timeoutlen=600
set updatetime=600
set formatoptions-=cro " https://superuser.com/a/271024

colorscheme gruvbox
set background=dark " Gruvbox variant

call deoplete#custom#option('sources', {
\  '_': ['ale'],
\ })

" FZF
let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-x': 'Bdelete',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
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

" NerdCommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 0
let g:NERDDefaultAlign = 'left'

" Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'jfkdhgls;anvmcutiroe'

" Rainbow Parentheses
let g:rainbow_active = 1

" UndoTree
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\   'auto_complete_delay': 150,
\   'auto_refresh_delay': 150,
\   'smart_case': v:true,
\ })

" ALE
let g:ale_linters_explicit = 1 " Only run linters named in ale_linters settings.
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'vim': ['vint'],
\ }


" KEYBINDINGS
" Redo
noremap U <C-r>
" Clear search highlight on escape
nnoremap <silent> <esc> :noh<CR><esc>
" God damn macros (move to <Leader>xq)
noremap q <Nop>
noremap Q <Nop>
" Move line or selection
nnoremap <silent> J :m+1<CR>
nnoremap <silent> K :m-2<CR>
vmap <silent> J :'<'>,m'>+1<CR>:normal gv<CR>
vmap <silent> K :'<'>,m'<-2<CR>:normal gv<CR>
" Join lines
noremap H k:join!<CR>
noremap L :join!<CR>
" Duplicate line or selection
nnoremap gd :t.<CR>
vnoremap gd "ay'>"ap
" " Swap stuff around
" map gx <Plug>(Exchange)
" map gxx <Plug>(ExchangeLine)
" map gxc <Plug>(ExchangeClear)
" Yank to the end of line
nnoremap Y y$
" Quit visual mode
vnoremap v <Esc>
" Moving around in insert/command modes
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
" jj | Escaping insert/command mode
inoremap jj <Esc>
cnoremap jj <C-c>
" Cycle deoplete suggestions on tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Exit terminal insert mode
tnoremap <C-'><C-'> <C-\><C-n>o
" " Comment current line in insert mode
" imap <C-/> <Plug>NERDCommenterInsert

" WHICH_KEY
let g:which_key_map =  {}

" LEADER LEADER
noremap <Leader><Space> :Commands<CR>
nnoremap <Leader><ESC> <ESC>
map <Leader>/ <Plug>(easymotion-bd-f2)
nnoremap <Leader><Tab> :bnext<CR>
nnoremap <Leader><S-Tab> :bprev<CR>
noremap <Leader>' :split term://$SHELL<CR>
let g:which_key_map['/'] = 'Search project'

" BUFFER
let g:which_key_map.b = { 'name' : '+buffer' }
nnoremap <Leader>bO :%bd\|e#\|bd#<CR>
let g:which_key_map.b.O = 'only'
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bN :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bd :Bdelete<CR>
nnoremap <Leader>bD :Bdelete!<CR>
nnoremap <Leader>bm :Bufferize messages<CR>
nnoremap <Leader>br :edit<CR>
nnoremap <Leader>bR :edit!<CR>
nnoremap <Leader>bY :%y+<CR>
nnoremap <Leader>bP gg"_dGP

" COMMENT (NERDCommenter)
let g:which_key_map.c = { 'name' : '+comment' }
map <Leader>cc <Plug>NERDCommenterToggle
map <Leader>ci <Plug>NERDCommenterComment
map <Leader>cm <Plug>NERDCommenterSexy
map <Leader>cy <Plug>NERDCommenterYank
nmap <Leader>cd :call NERDComment(1, 'yank') \| normal p<CR>
vmap <Leader>cd :call NERDComment(1, 'yank') \| '>normal p<CR>
map <Leader>ca <Plug>NERDCommenterAppend

" FILE
let g:which_key_map.f = { 'name' : '+file' }
nnoremap <Leader>fs :write<CR>
nnoremap <Leader>fS :wall<CR>
nnoremap <expr> <Leader>fR ':write ' . expand('%:p')
nnoremap <expr> <Leader>fo ':e ' . expand('%:p:h') . '/'
nnoremap <Leader>ff :ProjectRootExe Files<CR>
nnoremap <Leader>fn :enew<CR>
nnoremap <Leader>fr :History<CR>
nnoremap <Leader>ft :NERDTreeToggle<CR>
nnoremap <Leader>fT :NERDTreeFind %<CR>

" VIMRC / DOTFILE
let g:which_key_map.f.v = { 'name' : '+vimrc' }
nnoremap <Leader>fvd :edit $MYVIMRC<CR>
nnoremap <Leader>fvS :write \| source $MYVIMRC<CR>
nnoremap <Leader>fvI :PlugInstall<CR>
nnoremap <Leader>fvU :PlugUpdate<CR>
nnoremap <Leader>fvC :PlugClean<CR>

" GIT
let g:which_key_map.g = { 'name': '+git' }
" map <Leader>gg :split +Tig\ status<CR>
map <Leader>gg :Tig status<CR>
map <Leader>gf :Git fs<Space>
map <Leader>gl :Tig<CR>
map <Leader>gb :Tig refs<CR>
map <Leader>gB :Gblame<CR>
" map <Leader>gg :Git<CR>
" map <Leader>gl :Glog!<CR>
" map <Leader>gm :Merginal<CR>
map <Leader>gs :terminal git sync<CR>

" HELP
let g:which_key_map.h = { 'name': '+help' }
map <Leader>hh :Helptags<CR>
map <Leader>hb :Maps<CR>

" JUMP (EasyMotion)
let g:which_key_map.j = { 'name': '+jump' }
map <Leader>jj <Plug>(easymotion-bd-f2)
map <Leader>jl <Plug>(easymotion-bd-jk)
map  <Leader>jw <Plug>(easymotion-bd-w)

" QUIT
let g:which_key_map.q = { 'name' : '+quit' }
nnoremap <Leader>qq :confirm qall<CR>
nnoremap <Leader>qs :wqall<CR>
nnoremap <Leader>qQ :qall!<CR>

" SEARCH
let g:which_key_map.s = { 'name': '+search' }
nnoremap <Leader>ss :BLines<CR>
nnoremap <Leader>sb :Lines<CR>
nnoremap <Leader>sf :ProjectRootExe Rg<CR>

" TOGGLES
let g:which_key_map.t = { 'name': '+toggle' }
nnoremap <Leader>tc :Colors<CR>
nnoremap <Leader>tn :set invnumber<CR>
nnoremap <Leader>tN :set invrelativenumber<CR>
nnoremap <Leader>ts :Filetypes<CR>
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

" nnoremap <Leader>wt :tabedit<CR>
" nnoremap <Leader>w. :tabnext<CR>
" let g:which_key_map.w['.'] = '[>] tab'
" nnoremap <Leader>w, :tabprev<CR>
" let g:which_key_map.w[','] = '[<] tab'

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
nnoremap <Leader>xd :t.<CR>
vnoremap <Leader>xd "ay'>pgv
let g:which_key_map.x.d = 'duplicate'
map <Leader>xo gx
noremap <Leader>xu :<C-u>UndotreeToggle<CR>
noremap <Leader>xq q
let g:which_key_map.x.q = 'macro'
noremap <Leader>x@ :r!date<CR>
" Swap stuff around
map <Leader>xx <Plug>(Exchange)
map <Leader>xX <Plug>(ExchangeClear)


" LOCAL LEADER
let g:which_key_local_map = {}

call which_key#register('<Space>', 'g:which_key_map')
call which_key#register(',', 'g:which_key_local_map')

nnoremap <silent> <Leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

nnoremap <silent> [ :<c-u>WhichKey '['<CR>
vnoremap <silent> [ :<c-u>WhichKeyVisual '['<CR>

nnoremap <silent> ] :<c-u>WhichKey ']'<CR>
vnoremap <silent> ] :<c-u>WhichKeyVisual ']'<CR>

" nnoremap <silent> g :<c-u>WhichKey  'g'<CR> " Kills gg
" nnoremap <silent> s :<c-u>WhichKey  's'<CR>


autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" " https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

function! <SID>AutoProjectRootCD()
  try
    if &filetype != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

" Use interactive grep versions
  " \   'rg --vimgrep --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', 'alt-/'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Filter oldfiles for History command
command! History call fzf#run(fzf#wrap({
\ 'source':  s:filtered_recent_files(),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' }))

" Filter oldfiles and include open buffers
function! s:filtered_recent_files()
  return extend(
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'),
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|^/private/var/\\|.git/\\|NvimView\\|^term:'"),
  \ )
endfunction

" Go to last cursor position when reopening file
if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Start terminal in insert-mode
" autocmd TermOpen * startinsert
autocmd BufWinEnter,WinEnter term://* startinsert


" Connect to running nvim instance to avoid nested nvims
if has('nvim')
  let $GIT_EDITOR = 'nvr --remote-wait --servername ' . v:servername
endif
