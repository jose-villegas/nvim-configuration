"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"   -> Compatibility
"   -> Plugins Manager Setup
"   -> Installed Plugins
"   -> Installed Themes
"   -> Plugins Configuration
"   -> General
"   -> VIM user interface
"   -> Colors and Fonts
"   -> Files and backups
"   -> Text, tab and indent related
"   -> Visual mode related
"   -> Moving around, tabs and buffers
"   -> Status line
"   -> Editing mappings
"   -> vimgrep searching and cope displaying
"   -> Spell checking
"   -> Misc
"   -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Manager Setup (Vim-Plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible                    " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  let vimplug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echom "Installing Vim-Plug..."
  if executable('curl')
    exec '!curl -fLo '.local_path.'site/autoload/plug.vim'.' --create-dirs '.vimplug_url
  elseif executable('wget')
    call mkdir(fnamemodify(local_path.'site/autoload/plug.vim', ':h'), 'p')
    exec '!wget --force-directories --no-check-certificate -O '.local_path.'site/autoload/plug.vim'.' '.vimplug_url
  else
    echom 'Could not download plugin manager. No plugins were installed'
    finish
  endif
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Installed Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required:
call plug#begin(expand('~/.vim/plugged'))

" The NERD tree allows you to explore your filesystem and to open files and directories. 
" It presents the filesystem to you in the form of a tree which you manipulate with the 
" keyboard and/or mouse. It also allows you to perform simple filesystem operations.
Plug 'scrooloose/nerdtree'

" This plugin aims at making NERDTree feel like a true panel, independent of tabs.
Plug 'jistr/vim-nerdtree-tabs'

" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the 
" target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to 
" comment out the selection, and gc in operator pending mode to target a comment. You can 
" also use it as a command, either with a range like :7,17Commentary, or as part of a :global 
" invocation like with :g/TODO/Commentary. That's it.
Plug 'tpope/vim-commentary'

" View any blob, tree, commit, or tag in the repository with :Gedit (and :Gsplit, :Gvsplit, 
" :Gtabedit, ...). Edit a file in the index and write to it to stage the changes. Use :Gdiff to 
" bring up the staged version of the file side by side with the working tree version and use Vim's 
"diff handling capabilities to stage a subset of the file's changes.
Plug 'tpope/vim-fugitive'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" This is the official theme repository for vim-airline.
Plug 'vim-airline/vim-airline-themes'

" A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows whether each line has been 
" added, modified, and where lines have been removed. You can also stage and undo individual hunks.
Plug 'airblade/vim-gitgutter'

" This plugin makes GVim-only colorschemes Just Work in terminal Vim, as long as the terminal supports 88 
" or 256 colors - and most do these days.
Plug 'godlygeek/csapprox'

" This plugin causes all trailing whitespace to be highlighted in red.
Plug 'bronson/vim-trailing-whitespace'

" This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
Plug 'raimondi/delimitmate'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the current
" file and get an overview of its structure.
Plug 'majutsushi/tagbar'

" Syntastic is a syntax checking plugin for Vim. It runs files through external syntax 
" checkers and displays any resulting errors to the user.
Plug 'scrooloose/syntastic'

" This plugin is used for displaying thin vertical lines at each indentation level 
" for code indented with spaces. 
Plug 'yggdroot/indentline'

" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'

" UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'sirver/ultisnips'

" This repository contains snippets files for various programming languages.
Plug 'honza/vim-snippets'

" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim.
Plug 'valloric/youcompleteme'

" Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs
Plug 'ervandew/supertab'

" C & C++
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
" C#
Plug 'vim-scripts/csharp.vim', {'for': ['cs']}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Installed Themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base16 provides carefully chosen syntax highlighting and a default set of sixteen colors suitable 
" for a wide range of applications. Base16 is not a single theme but a set of guidelines with numerous 
" implementations.
Plug 'chriskempson/base16-vim'

" Zenburn is a low-contrast color scheme for Vim. It’s easy for your eyes and
" designed to keep you in the zone for long programming sessions.
Plug 'vim-scripts/Zenburn'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""
" ==> Syntastic Plugin  
"""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

"""""""""""""""""""""""""
" ==> CtrlP Plugin  
"""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"""""""""""""""""""""""""
" ==> Snippets Plugin  
"""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""
" ==> TagBar Plugin  
"""""""""""""""""""""""""
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""
" ==> Airline  
"""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16-monokai'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"""""""""""""""""""""""""
" ==> NERDTree  
"""""""""""""""""""""""""
autocmd VimEnter * NERDTree " Start vim with NERDTree
autocmd VimEnter * wincmd p " Move cursor to main
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '\.meta$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Faster for : commands
nnoremap ; :

" Clear search highlight
nmap <silent> <leader>/ :nohlsearch<CR>

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,list:full

" Ignore following files
set wildignore=*.o,*.obj,*~,*.pyc,*.rbc,__pycache__,*.meta
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Add line numbers
set number

" let mouse wheel scroll file contents
if !has("gui_running")
    if &term=~'screen' || &term=~'tmux'
      set term=screen-256color
    endif
    set mouse=a
    set nocompatible
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
    nnoremap <Esc>[62~ <C-E>
    nnoremap <Esc>[63~ <C-Y>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Set theme & enable 256 colors palette
if !has("gui_running")
    if &term=~'screen' || &term=~'tmux'
      set term=screen-256color
    endif
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" ConEmu setup
if !empty($CONEMUBUILD)
    set termencoding=utf8
    " termcap codes for cursor shape changes on entry and exit to
    " /from insert mode
    " doesn't work
    "let &t_ti="\e[1 q"
    "let &t_SI="\e[5 q"
    "let &t_EI="\e[1 q"
    "let &t_te="\e[0 q"
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set GUI mode font
if has('gui_running')
  if has('gui_win32')
    set guifont=Consolas_for_Powerline:h10:cANSI
  else
    set guifont=Consolas\ 10
  endif
endif

if !exists('g:not_finish_vimplug')
  colorscheme base16-monokai
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
