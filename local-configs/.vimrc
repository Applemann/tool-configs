" use advanced Vim features
set nocompatible
set clipboard=unnamed

let NERDTreeWinPos="left"

" expand tabs to spaces
" to insert a real tab, use CTRL-V<Tab>
 
set expandtab
" number of spaces to use for each step of (auto)indent

set shiftwidth=4
" number of spaces that a <Tab> in the file counts for

set tabstop=4
set softtabstop=4

" Round indent to multiple of 'shiftwidth'. Applies to > and < commands
set noshiftround

" Copy indent from current line when starting a new line
set autoindent

" vertical cursor movement keeps cursor in the same column (if possible)
set nostartofline

" When there is a previous search pattern, highlight all its matches
set hlsearch

" While typing a search pattern, show where the so far typed pattern
" matches
set incsearch

" Searches wrap around the end of the file
set wrapscan

" case of normal letters is ignored
set ignorecase

" Override 'ignorecase on' if search pattern contains uppercase characters
set smartcase

" Do not wrap lines longer than the width of the window
set nowrap

" screen won't be redrawn while executing macros, registers and other
" commands
set lazyredraw

"  precede each line with its line number
set number
" do not unload |abandon|ed buffers
set hidden
" The window that the mouse pointer is on is automatically activated
"set mousefocus
set winminheight=0
" the mouse pointer is hidden when characters are typed
set mousehide
" RMB pops up a menu. Shift-LMB extends a selection.
set mousemodel=popup
" Use same directory as with last file browser
set browsedir=last
" display what mode I'm in
set showmode
" display status line for a single window too
set laststatus=2
" show the line and column number of the cursor position in the status line
set ruler
" show the ugly ^M
set fileformats=unix

set listchars=tab:>-,eol:$,trail:*,extends:>,precedes:<

set background=dark

set cinkeys-=0#
function! Ft()
    return &filetype
endfunction
function! Ro()
    if &readonly
        return 'R'
    else
        return ' '
    endif
endfunction
function! Mo()
    if &modified
        return 'M'
    else
        return ' '
    endif
endfunction
function! Nm()
    if &modifiable
        return ' '
    else
        return 'N'
    endif
endfunction
set statusline=%3n\ %<%f%=%4b/0x%02B\ %{Ft()}\ %{Mo()}%{Nm()}%{Ro()}\ %2c\ %2v\ %4l\ %4L\ %3p%%
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert
set backspace=indent,eol,start
" listings pause when the whole screen is filled
set more
" number of screen lines to keep above and below the cursor
set scrolloff=2
set sidescrolloff=10
set sidescroll=10
" Display an incomplete command in the lower right corner of the Vim window
set showcmd
" Cursor can be positioned where there is no actual character
" block   Allow virtual editing in Visual block mode.
" insert  Allow virtual editing in Insert mode.
" all     Allow virtual editing in all modes.
set virtualedit=all
" allow movement across newline in all modes, from right to left only
set whichwrap=b,h,<,[
" the following 3-fold combo makes vim react faster to <Esc> (leaving
" Visual, Command modes, etc.) this could screw cursor keys in Insert mode
" on veeeeeery slow machines / connections (not likely to ever happen)
" the default value is 1000 ms, which is terribly slow
set notimeout       " don't timeout on mappings       
set ttimeout        " do timeout on terminal key codes
set timeoutlen=50   " timemout in 50 msec            
" I want man to open in new termwin
" unfortunately doesn't work
"set keywordprg=rxvt\ -e\ man
" jump to the matching paren for .5sec, or beep if there isn't one
set showmatch

" Tells when the 'equalalways' option applies: 
" ver     vertically, width of windows is not affected
" hor     horizontally, height of windows is not affected
" both    width and height of windows is affected
set eadirection=hor
" When on, splitting a window will put the new window below the current
" one.
set splitbelow
" When on, splitting a window will put the new window right of the current
" one.
set splitright

set shell=/bin/sh

set switchbuf=useopen,split

" abort prompts on ^G
cmap <c-g> <c-c>
" <Space> in Normal mode scrolls down one screenful (like a pager)
nmap <Space> <C-F>
" after performing a search, matches are highlighted. get rid of the
" highlighting with <Enter>
" breaks e. g. quickfix window! (:.cc still works)
nnoremap <silent> <Enter> :nohl<Enter>
inoremap <C-F> <C-X><C-F>

nmap <F7> :diffget<CR>
nmap <F8> :diffput<CR>
nmap <F9> :diffupdate<CR>

nmap gf :sp <cfile><CR>

source $VIMRUNTIME/menu.vim
set wildmenu
"set wildmode=longest,list
set wildmode=longest:full
set wcm=<C-Z>
map <F10> :emenu <C-Z>

" source ~/.vim/abbreviations

" let myfiletypefile='~/filetype.vim'
filetype indent on
filetype plugin on

autocmd FileType python set omnifunc=pythoncomplete#Complete

" augroup filetypedetect
"     autocmd BufNewFile,BufRead *.tpl                          setfiletype smarty
"     autocmd BufNewFile,BufRead /usr/home/roman/work/*.php     setfiletype php
"     "autocmd BufNewFile,BufRead /home/roman/work/*.php         setlocal syntax=
"     autocmd BufNewFile,BufRead /usr/home/roman/work/*.php     setlocal expandtab tabstop=4 foldmethod=marker
" augroup END

if has("gui_running")
    colorscheme murphy
    set winaltkeys=menu
    set guifont=-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-iso8859-2
endif
if &t_Co > 2 || has("gui_running") 
    syntax on
    highlight Folded guifg=Wheat guibg=DarkRed
    syntax sync fromstart
endif

" no friggin' toolbar
set guioptions-=T

" DirDiff
let g:DirDiffExcludes = "CVS"


" <F2> prepne klavesnici do normalniho (americkeho) rozlozeni klaves  
" map <F2> :set noremap<CR>:so ~/.vim/vimcz-encz<CR>:set remap<CR>
" imap <F2> <C-O>:set noremap<CR><C-O>:so ~/.vim/vimcz-encz<CR><C-O>:set remap<CR>

" <F3> prepne klavesnici do modu pro psani cestiny ;)
" map <F3> :set noremap<CR>:so ~/.vim/vimcz-czen<CR>:set remap<CR>
" imap <F3> <C-O>:set noremap<CR><C-O>:so ~/.vim/vimcz-czen<CR><C-O>:set remap<CR>

" <F5> zmeni hlsearch status
" map <F5> :set hls!<CR>:set hls?<CR>
imap <F5> <C-O>:set hls!<CR>:set hls?<CR>
imap jj <Esc>

nmap <F6> :syn sync fromstart<CR>

" <F6> predchozi jump
"map <F6> :cp<CR>
"imap <F6> <C-O>:cp<CR>
"
"" <F7> nasledujici jump
"map <F7> :cn<CR>
"imap <F7> <C-O>:cn<CR>

" <F11> prepne prohledavani do normalniho modu
map <F11> :set wim=full<CR>
imap <F11> <C-O>:set wim=full<CR>

" <F12> zapne prohledavani vseho textu pri pouziti :h
map <F12> :set wim=list:full<CR>
imap <F12> <C-O>:set wim=list:full<CR>

"nmap g[[ :call ShowBlockName()<CR>

" load english-czech keyboard layout first
" so ~/.vim/vimcz-encz

""
"" ShowBlockName.vim mappings:
""
"u CursorHold * call ShowBlockName('quiet')

" Tweak commands like [d so that they disable ShowBlockName so it doesn't
" obliterate the output of this command.
" nnoremap [d :call ShowBlockName('[d')<CR>
" nnoremap [i :call ShowBlockName('[i')<CR>


" vimc>tw=75
"
"

map t :tabedit<space>
map <C-n> gt
map <C-p> gT

noremap <S-w><S-w> :w <CR>
map <S-T> :NERDTreeToggle<CR> 
map <C-r> :r !bash ~/.tmux/run_puppet.sh<CR>
set paste
set tabstop=2
