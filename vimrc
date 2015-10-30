set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'git@github.com:ervandew/supertab.git'
Bundle 'git@github.com:kien/ctrlp.vim.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'tpope/vim-rails'
Bundle 'bkad/CamelCaseMotion'
Bundle 'https://github.com/scrooloose/syntastic'
Bundle 'digitaltoad/vim-jade'
Bundle 'https://github.com/majutsushi/tagbar'
Bundle 'https://github.com/marijnh/tern_for_vim'
Bundle 'https://github.com/tpope/vim-fugitive'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/bling/vim-airline.git'
Bundle 'git://github.com/tpope/vim-commentary.git'
Bundle 'git://github.com/tpope/vim-repeat.git'
Bundle 'https://github.com/terryma/vim-expand-region.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/airblade/vim-gitgutter.git'
Bundle 'https://github.com/Yggdroot/indentLine.git'
Bundle 'https://github.com/Raimondi/delimitMate.git'

Plugin 'Valloric/YouCompleteMe'
call vundle#end()
Bundle 'slim-template/vim-slim.git'

set runtimepath^=~/.vim/bundle/ctrlp.vim " add ctrlp to runtime path

syntax enable
filetype plugin indent on

let mapleader = "\<Space>"

execute pathogen#infect()
set tabstop=4
set expandtab
set backspace=2         " backspace in insert mode works like normal editor
set shiftwidth=4
syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set smartindent
set number              " line numbers
set autoread
au CursorHold * checktime
set incsearch           " search as you type
set nobackup            " get rid of anoying ~file
set hlsearch            " highlight search results
set noswapfile          " no create swap files
set ignorecase
set smartcase
set laststatus=2
nmap <silent> <C-G> :NERDTreeToggle<CR>
nmap <C-S> :w<CR>
imap <c-s> <Esc>:w<CR>
nmap Q :q <enter><CR>

" remap colon to semicolon
:nmap ; :

" scroll up/down page
nmap D <C-D>
nmap U <C-U>

" search for occurrences of highlighted text
vnoremap // y/<C-R>"<CR>

"fxi arrow keys in insert mode bug

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

nmap <C-P> :CtrlP <CR>
nmap <C-T> :vsplit <CR>
nmap <C-Y> <C-W>s
set pastetoggle=<F10>   " toggle paste with F10

autocmd BufNewFile,BufRead Gemfile set filetype=ruby

set shellcmdflag=-ic   " make vim shell interactive

set clipboard=unnamed    "share clipboard

"speeds up ctrlp finder by ignoring certain files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" delete extra whitespace F6
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" syntastic recommended settings--COMMENTED OUT BECAUSE MESSED UP STATUSLINE
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntax checking default off
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"closetag.vim settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" easymotion mappings

" Bi-directional find motion
nmap f <Plug>(easymotion-bd-w)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

set number
set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc


nnoremap <leader>n :call NumberToggle()<cr>

"folding settings
"set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" for jasmine
au BufNewFile,BufRead *.ejs set filetype=html


"tagbar default
nmap <F8> :TagbarToggle<CR>

map <C-f> :!git grep -i 

inoremap jk <Esc>


"for tags
set tags=./tags,tags;/

" tabbing
map <C-N> :tabe<cr>
map <C-I> :tabp<cr>
map <C-O> :tabn<cr>



map cw ciw
map yw yiw
map dw diw

set timeoutlen=1000 ttimeoutlen=0
map f *

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline#extensions#default#layout = [
      \ [ 'a', 'c' ],
      \ [ 'y', 'z', 'warning' ]
      \ ]
" a- mode, crypt, paste, iminsert
" b- hunks, branch
" c- bufferline or filename
" x- tagbar, filetype, virtualenv
" y- fileencoding, fileformat
" z- percentage, line number, column number
" warning- syntastic, whitespace

" vim-powerline symbols
"let g:airline_left_sep          = '⮀'
"let g:airline_left_alt_sep      = '⮁'
"let g:airline_right_sep         = '⮂'
"let g:airline_right_alt_sep     = '⮃'
"let g:airline_branch_prefix     = '⭠'
"let g:airline_readonly_symbol   = '⭤'
"let g:airline_linecolumn_prefix = '⭡'


" for max character
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    set colorcolumn=80
  endif
endfunction

nnoremap <silent> <F8> :call g:ToggleColorColumn()<CR>

"Used for repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"Used for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

map <C-a> <C-Z>

" for searching highlighted text
vnoremap // y/<C-R>"<CR>

"UNCOMMENT IF GITGUTTER IS SLOW
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0
