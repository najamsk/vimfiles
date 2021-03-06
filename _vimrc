" -----------------------------------------------------------
" derekwayatt: lifting his vrimc code
" -----------------------------------------------------------

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Maps to make handling windows a bit easier
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> ,= <C-W>=
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>
noremap <silent> ,_ <C-W>_<C-W><bar>

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>
set omnifunc=csscomplete#CompleteCSS
set fdm=manual

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1





" -----------------------------------------------------------
" General setup
" -----------------------------------------------------------
" enable backspace to delete anything (includes \n) in insert mode
set backspace=2
set nocompatible
" jingle bells, jingle bells, jingle bells, ....
"set errorbells
" show partial command in status line
set showcmd
" show line and column number in status line
set ruler
" show line numbers
set number
" enable spell-checking for text, html, and README files (Vim 7+)
autocmd BufNewFile,BufRead *.txt,*.html,README set spell

" -----------------------------------------------------------
" Text-Formatting, Indenting, Tabbing
" -----------------------------------------------------------
" auto-indenting (local to buffer)
set autoindent
" smart-indenting (clever auto-indenting)
set smartindent
" number of spaces the tab stands for
set tabstop=4
" number of spaces used for (auto)indenting
set shiftwidth=4
" a <tab> in an indent insets 'shiftwidth' spaces (not tabstop)
set smarttab
" if non-zero, number of spaces to insert for a <tab>
set softtabstop=4
" use tab characters for indent
set noexpandtab

" c/c++ specific options
" ----------------------

" make program
set makeprg=jam
" enable specific indenting for c-code and others
set cindent
" indent the next line after these c keywords
set cinwords=if,else,while,do,for,switch,case
" and here some nice options for c indenting
set cinoptions=l1,g0,t0,(0
" use full featured format-options. see "help fo-table for help
if v:version >= 600
    set formatoptions=tcrqn2
else
    " vim 5 doesn't know r/n
    set formatoptions=tcq2
endif

" -----------------------------------------------------------
" Searching, Substituting
" -----------------------------------------------------------

" select case-insensitive search
set ignorecase 
" No ignorecase if uppercase chars in search
set scs
" change the way backslashes are used in search patterns
set magic
" begin search at top when EOF reached
set wrapscan
" jump to matches during entering the pattern
set sm
" highlight all matches... (use :noh when you're done)
set hls
" ...and also during entering the pattern
set incsearch
" use 'g'-flag when substituting (subst. all matches in that line, not only first)
" to turn off, use g (why is there no -g ?)
"set gdefault
" turn off the fucking :s///gc toggling
set noedcompatible

" -----------------------------------------------------------
" Highlighting, Colors, Fonts
" -----------------------------------------------------------

" when we have a colored terminal or gui...
if &t_Co > 2 || has("gui_running")
    " ...then use highlighting
    syntax on
endif

if has("gui_running")
    "Standartgroesse bei'm GUI-Fenster
    "columns    width of the display
    set co=98
    "lines      number of lines in the display
    set lines=41
    if has("win32")
		set guifont=Consolas:h10:cANSI
        "set guifont=Monaco:h9:cANSI
        "set guifont=Courier:h10:cANSI
    else
        set gfn=-adobe-courier-medium-r-normal-*-*-140-*-*-m-*-iso8859-15
    endif
    "colorscheme morning
endif
" how many lines to sync backwards
syn sync minlines=10000 maxlines=10000
" how many lines to search backward after a jump to check syntax
let c_minlines = 200
" aldo highlight some things in comments
let c_comment_strings = 1
" SQL-Highlighting in PHP-Strings (1=yes 0=no)
let php_sql_query = 1
let php_minlines=300
let php_htmlInStrings=1
let php_folding = 1
" use white background in GUI-Mode, black on console
if has("gui_running") 
"|| &term=="xterm"
    set bg=light
else
    set bg=dark
endif

" use css when converting syntax to html (2html.vim)
let html_use_css = 1
" and a nice command for making html-code
command Code2html :source $VIMRUNTIME/syntax/2html.vim|

" -----------------------------------------------------------
" Statusline, Menu
" -----------------------------------------------------------

" use tab for auto-expansion in menus
set wc=<TAB>
" show a list of all matches when tabbing a command
set wmnu
" how command line completion works
set wildmode=list:longest,list:full
" ignore some files for filename completion
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz
" some filetypes got lower priority
set su=.h,.bak,~,.o,.info,.swp,.obj
" remember last 2000 typed commands
set hi=2000
" show cursor position below each window
set ruler
" shows the current status (insert, visual, ...) in statusline
set showmode
" use shortest messages
set shm=aT
" show always statusline of last window
set laststatus=2

" -----------------------------------------------------------
" Insert-Mode Completion
" -----------------------------------------------------------

" order and what to complete. see ":help complete" for info
set     complete=.,w,b,u,t,i
" enable dictionary (add k to complete to scan dict when completing)
" set dict=<FILENAME>
" adjust case of a keyword completion match
set infercase
" showfulltag   when completing tags in Insert mode show only the name
" not any arguments (when a c-funtion is inserted)
set nosft

" -----------------------------------------------------------
" Tag search (c-code) and tag highlighting
" -----------------------------------------------------------

" where to look for tags
set     tags=./tags,../tags,../../tags,../../../tags,/usr/include/tags
" double-click opens preview-window with matching tag
noremap <2-LeftMouse> :call MousePush()<cr>
" and also <Strg-_> (useful on console or using no mouse)
map ^_ :call MousePush()<cr>
imap ^_  <space><esc>:let pos_pos = line('.').'normal! '.virtcol('.').'<bar>'<cr>[(^[[D:call MousePush()<cr>:exe pos_pos<cr>a<backspace>
" cycle thru preview tags
map <C-PageUp> :ptp<cr>
map <C-PageDown> :ptn<cr>
imap <C-PageUp> <esc>:silent! ptp<cr>a
imap <C-PageDown> <esc>:silent! ptn<cr>a
" height of preview-window
set previewheight=5
fun! MousePush()
    if filereadable(expand("<cfile>"))
        exe 'edit ' . expand("<cfile>")
    elseif -1 < match(getline(line(".")), "<".expand("<cfile>").">")
        exe 'find ' . expand("<cfile>")
    else
        exe 'ptag ' . expand ("<cword>")
    endif
endfun
" generate tags.vim file out of tags file for highlighting all local functions
noremap <F11>  :sp tags<CR>:%s/^\([^ \t:]*:\)\=\([^ \t]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12><F4>
" source tags.vim file
noremap <F12>  :source tags.vim<CR>
" autoload tags.vim if exists
au BufRead *
            \   if filereadable(expand("%:p:h")."/tags.vim")  && expand("%p:h") != $VIMRUNTIME
            \ |     exe 'source '.expand("%:p:h")."/tags.vim"
            \ | endif

" -----------------------------------------------------------
" window handling
" -----------------------------------------------------------

" focus follows mouse
set mousef
" minimal number of lines used for the current window
set wh=1
" minimal number of lines used for any window
set wmh=0
" make all windows the same size when adding/removing windows
set noequalalways
"a new window is put below the current one
set splitbelow

" -----------------------------------------------------------
" file, backup, path
" -----------------------------------------------------------

" updatecount   number of characters typed to cause a swap file update
set uc=50
" make no backups
set nobackup

if has("unix")
    if v:version >= 600
        set     path=.,~/include/**,~/src/**2,~/.vim/**2,~/lib/**2,/usr/include/**,/usr/X11R6/include/,/usr/local/include
    else
        set     path=.,~/include,/usr/include,/usr/X11R6/include/,/usr/local/include
    endif
endif


" -----------------------------------------------------------
" WIN-GUI Specials
" -----------------------------------------------------------

" first of all: we don't use "behave windows"
" to try to get a better clipboard-handling
" (we do it ourself)

if has("win32")
    if has("gui_running")
        " alt jumps to menu
        set winaltkeys=menu
        " clipboard to autoselect
        set guioptions+=a

        " ---- Windows Like keys ----
        " CTRL-Z is Undo; not in cmdline though
        noremap <C-Z> u
        inoremap <C-Z> <C-O>u
        " CTRL-Y is Redo (although not repeat); not in cmdline though
        noremap <C-Y> <C-R>
        inoremap <C-Y> <C-O><C-R>
        " CTRL-A is Select all
		" noremap <C-A> gggH<C-O>G
        " noremap <C-A> <C-O>gg<C-O>gH<C-O>G
        " cnoremap <C-A> <C-C>gggH<C-O>G
        " CTRL-F4 is Close window
        noremap <C-F4> <C-W>c
        inoremap <C-F4> <C-O><C-W>c
        cnoremap <C-F4> <C-C><C-W>c
        " CTRL-Tab is Next window
        noremap <C-Tab> <C-W>w
        inoremap <C-Tab> <C-O><C-W>w
        cnoremap <C-Tab> <C-C><C-W>w
        " ---- Windows Like Copy-Paste keys ----
        " CTRL-v is paste
        "inoremap <C-v> <esc>"*p<return>i
        "noremap <C-v> "*p<return>
        " CTRL-x is cut (in visual mode only)
        " vnoremap <C-x> "*d
        " CTRL-c is copy (in visual mode only)
        vnoremap <C-c> "*y
        " ---- Restore some remapped things 
        " make real <C-V> (visual block) as <C-Q> available
        noremap <c-q> <c-v>
        inoremap <C-Y> <C-Y>
		map <F8> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
    endif
endif

" -----------------------------------------------------------
" UNIX Specials
" -----------------------------------------------------------

if has("unix")
    set clipboard=autoselect
    set shell=/bin/bash
endif

" -----------------------------------------------------------
" Special Features
" -----------------------------------------------------------

if v:version >= 600
    filetype on
    filetype indent on
else
    filetype on
endif

if has("autocmd")
    " try to auto-examine filetype
    if v:version >= 600
        filetype plugin indent on
    endif
    " try to restore last known cursor position
    autocmd BufReadPost * if line("'\"") | exe "normal '\"" | endif
    " autoread gzip-files
    augroup gzip
    " Remove all gzip autocommands
    au!

    " Enable editing of gzipped files
    " set binary mode before reading the file
    autocmd BufReadPre,FileReadPre      *.gz,*.bz1 set bin
    autocmd BufReadPost,FileReadPost    *.gz call GZIP_read("gunzip")
    autocmd BufReadPost,FileReadPost    *.bz1 call GZIP_read("bunzip2")
    autocmd BufWritePost,FileWritePost  *.gz call GZIP_write("gzip")
    autocmd BufWritePost,FileWritePost  *.bz1 call GZIP_write("bzip2")
    autocmd FileAppendPre               *.gz call GZIP_appre("gunzip")
    autocmd FileAppendPre               *.bz1 call GZIP_appre("bunzip2")
    autocmd FileAppendPost              *.gz call GZIP_write("gzip")
    autocmd FileAppendPost              *.bz1 call GZIP_write("bzip2")

    " After reading compressed file: Uncompress text in buffer with "cmd"
    fun! GZIP_read(cmd)
        let ch_save = &ch
        set ch=2
        execute "'[,']!" . a:cmd
        set nobin
        let &ch = ch_save
        execute ":doautocmd BufReadPost " . expand("%:r")
    endfun

    " After writing compressed file: Compress written file with "cmd"
    fun! GZIP_write(cmd)
        !mv <afile> <afile>:r
        execute "!" . a:cmd . " <afile>:r"
    endfun

    " Before appending to compressed file: Uncompress file with "cmd"
    fun! GZIP_appre(cmd)
        execute "!" . a:cmd . " <afile>"
        !mv <afile>:r <afile>
    endfun
    augroup END " gzip
endif

" -----------------------------------------------------------
" Mappings
" -----------------------------------------------------------

" copy/paste across vim sessions
nmap _Y :.w! ~/.vi_tmp<CR>
vmap _Y :w!  ~/.vi_tmp<CR>
nmap _P :r   ~/.vi_tmp<CR>

" Appends / insert current date
nmap _d "=strftime("%d.%m.%Y")<CR>p
nmap _D "=strftime("%d.%m.%Y")<CR>P

" Changes directory to the one of the current file
nmap _h :cd%:h<CR>

" Suppresses all spaces at end/beginning of lines
nmap _s :%s/\s\+$//<CR>
nmap _S :%s/^\s\+//<CR>

" Converts file format to/from unix
command Unixformat :set ff=unix
command Dosformat :set ff=dos

" toggle highlight search (folke)
noremap <F4>  :if 1 == &hls \| noh \| else \| set hls \| endif \| <CR>


"noremap <PageUp> <c-u>
"noremap <PageDown> <c-d>

" <Tab> is bound to `complete'
" inoremap <Tab> ^P

" cycle thru errors (folke)
nnoremap <M-PageDown> :cn<cr>
nnoremap <M-PageUp> :cp<cr>
" Make opens error-list automatically
command Make :make|:cw
inoremap <F9> <esc>:write<cr>:Make<cr>
nnoremap <F9> write<cr>:Make<cr>

" cycle thru buffers ...
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>

" search in doc selected text
vnoremap * <esc>:let save_reg=@"<cr>gvy:let @/=@"<cr>:let @"=save_reg<cr>/<cr>

" Folkes magic  # adder/remover
vnoremap # :s/^\([ \t]*\)\(.*\)$/\1#\2<cr>:nohl<cr>:silent! set hl<CR>
vnoremap 3 :s/^\([ \t]*\)#\(.*\)$/\1\2<cr>:nohl<cr>:silent! set hl<CR>

" Folkes auto-reindenter
function! SavePos()
    let g:restore_position_excmd = line('.').'normal! '.virtcol('.').'|'
endfun
function! RestorePos()
    exe g:restore_position_excmd
    unlet g:restore_position_excmd
endfun

inoremap <F10> <esc>:call SavePos()<CR>ggVG=:call RestorePos()<CR>a
nnoremap <F10> :call SavePos()<CR>ggVG=:call RestorePos()<CR>


" Folkes magic :wq in insertmode
function Wqtipper()
    let x = confirm("Hey!\nDu bist im Insert-Mode!\n Willst du trotzdem :wq machen?"," &Ja \n &Nein ",1,1)
    if x == 1
        silent! wq
    else
        "???
    endif
endfun
iab wq <bs><esc>:call Wqtipper()<CR>

" I often press del with the left hand on shift
inoremap <S-Del> <Del>
noremap <S-Del> <Del>


"unsorted
"set foldclose=all
"set fdm=marker
let b:asmsyntax="nasm"

" Type %/ in the command line to expand out to the current buffer's file
" locaiton (if it exists)
if has("unix")
	cmap %/ <C-R>=expand("%:p:h") . "/" <CR>
else
	cmap %/ <C-R>=expand("%:p:h") . "\\" <CR>
endif

" Include scripts
":helptags $VIMRUNTIME/../vimfiles/doc
" silent! ruby nil " for rails.vim
let g:miniBufExplUseSingleClick = 1


" Color Scheme
colorscheme maroloccio2
set cmdheight=2
" -----------------------------------------------------------
" Custom settings
" -----------------------------------------------------------
" allow buffers to be in bg without saving
" and remembers undo-history
set hidden
" Remember x commands for search patterns
set history=1000
" Extend % matching
runtime macros/matchit.vim
" Auto-complete menu
set wildmenu
" Shell-like autocomplete; full allows tabbing through matches
set wildmode=list:longest,full
" Store temp files in on central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp,$TMP
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp,$TMP
" Use visual bell instead of beeping
set visualbell
" Remove the "Press ENTER or type command to continue" messages
set shortmess=atI
" remember stuff after quitting vim:
" marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%
" use console dialog instead of pop-up dialogs for simple choices
set guioptions+=c
" Automatically change to the current directory of the active window
set autochdir


" Enable omnicomplete
" filetype plugin on enabled these (see above)
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType ruby set omnifunc=rubycomplete#Complete

" Autosave on focus lost
au FocusLost * :wa
" Save on buffer switch
set autowrite

" MiniBuffer Explorer
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 

" Buffer Explorer
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerSplitBelow = 1
let g:bufExplorerOpenMode = 1
let g:bufExplorerSplitHorzSize = 7


" Objective-J Syntax highlighting
au BufNewFile,BufRead *.j setf objj
