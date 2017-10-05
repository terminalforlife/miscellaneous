"----------------------------------------------------------------------------------
" Project Name      - $HOME/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Mon 25 Sep 09:50:58 BST 2017
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------

" Remap to sane, touch-typing standard movement keys.
noremap j h
noremap k j
noremap l k
noremap ; l

" Set variables used within this file.
let g:autoscrollstate=0
let g:moremodestate=0
let g:hardmodestate=0
let g:docmodestate=1
let g:mousesupportstate=0
let g:virtualeditstate=0
let mapleader=","

" Allow recursive fuzzy finding.
set path+=**

" Stop asking VIM to act like ancient vi.
set nocompatible

" Don't clutter your drive with swap and backup files.
set noswapfile
set nobackup

" ???
set matchtime=0

" Disable text wrapping.
set nowrap

" Make the ESC timeout sane.
set ttimeout
set ttimeoutlen=10

" ???
set viewoptions=folds,options,cursor,unix,slash

"Longer command history. Default is apparently 20.
set history=4000

"set listchars=tab:-,trail:,extends:#,nbsp:.
set listchars=tab:»→,trail:→,extends:#,nbsp:.

" Disable the ruler.
set noruler

" Set the status line at the bottom of VIM.
set statusline=\ %F%m%r%h%w\ \ FF=%{&ff}\ \ T=%Y\ \ A=\%03.3b\ \ H=\%02.2B\ \ POS=%04l,%04v\ \ %p%%\ \ LEN=%L

" ???
set cmdheight=1

" Display VIM's current mode; insert and visual.
set showmode

" Set the way in which folds are registered.
set foldmethod=marker

" Set the marker used to recognise a fold.
set foldmarker=#\ {{{,#\ }}}

" Disable search highlighting.
set nohlsearch

" ???
set wildchar=<TAB>

" Display a menu in : when tab shows multiple possibilities.
set wildmenu

" ???
set wrapmargin=0

" ???
set nomore

" Enables live searching; search as you type.
set incsearch

" Superficially use 8-space tabs; set this for reference.
set tabstop=8

" Just holds some extra color settings.
func! ExtraColorSets()
	hi SpecialKey     ctermfg=darkyellow   ctermbg=NONE
	hi ColorColumn    ctermbg=235          ctermfg=250
	hi CursorLine     ctermbg=237          cterm=bold
	hi StatusLine     ctermfg=black        ctermbg=white
	hi VertSplit      ctermbg=black        ctermfg=black
	hi StatusLine     ctermbg=white        ctermfg=black
	hi StatusLineNC   ctermbg=238          ctermfg=black
	hi Comment        ctermfg=241
endfunc

" Removing tailing spaces and tabs, then save.
func! CleanupThenSave()
	exe "normal! :%s/\\s\\+$//\<CR>"
	exe "normal! :%s/\\t\\+$//\<CR>"
	write
endfunc

" Function deals with autoscrolling.
func! AutoScroll()
	if(g:autoscrollstate == 0)
		let g:autoscrollstate = 1
		set sidescrolloff=999
		set scrolloff=999
		echo "Automatic scrolling is enabled."
	elseif(g:autoscrollstate == 1)
		let g:autoscrollstate = 0
		set sidescrolloff=0
		set scrolloff=0
		echo "Automatic scrolling is disabled."
	endif
endfunc

" The function for toggling mouse support.
func! MouseSupport()
	if(g:mousesupportstate == 0)
		let g:mousesupportstate = 1
		set mouse=a
		echo "Mouse support enabled."
	elseif(g:mousesupportstate == 1)
		let g:mousesupportstate = 0
		set mouse=
		echo "Mouse support disabled."
	endif
endfunc

" The function for toggle virtual editing.
func! VirtualEdit()
	if(g:virtualeditstate == 1)
		let g:virtualeditstate = 0
		set virtualedit=
		echo "Virtual editing is disabled."
	elseif(g:virtualeditstate == 0)
		let g:virtualeditstate = 1
		set virtualedit=all
		echo "Virtual editing is enabled."
	endif
endfunc

" The function for toggling DocMode.
func! DocMode()
	set linebreak!
	set wrap!

	if(g:docmodestate == 0)
		let g:docmodestate = 1
		echo "Document Mode is disabled."
		syntax on
		silent call ExtraColorSets()
	elseif(g:docmodestate == 1)
		let g:docmodestate = 0
		syntax off
		silent call ExtraColorSets()

		if(&list == 1)
			set nolist
		endif

		if(g:moremodestate == 1)
			echo "Document Mode is enabled and More Mode is disabled."
			silent call MoreMode()
		elseif(g:moremodestate == 0)
			echo "Document Mode is enabled."
		endif
	endif
endfunc

" The function for toggling ListMode.
func! ListMode()
	set list!

	if(&list == 1 )
		echo "List mode is enabled."
	elseif(&list == 0 )
		echo "List mode is disabled."
	endif
endfunc

" The function for toggling MoreMode.
func! MoreMode()
	set showmatch!
	set ruler!
	set cursorline!
	set relativenumber!
	"set number!

	if(g:moremodestate == 0)
		let g:moremodestate = 1
		set colorcolumn=84
		set laststatus=2
		echo "More mode is enabled."
	elseif(g:moremodestate == 1)
		let g:moremodestate = 0
		set colorcolumn=0
		set laststatus=1
		echo "More mode is disabled."
	endif
endfunc

" The function for toggling HardMode. Incomplete.
func! HardMode()
	if(g:hardmodestate == 0)
		let g:hardmodestate = 1
		noremap j <Nop>
		noremap k <Nop>
		noremap l <Nop>
		noremap ; <Nop>
		echo "Hard mode is enabled."
	elseif(g:hardmodestate == 1)
		let g:hardmodestate = 0
		noremap ; l
		noremap l k
		noremap k j
		noremap j h
		echo "Hard mode is disabled."
	endif
endfunc

" Set colors depending on terminal type.
if(&ttytype == "xterm-256color")
	colorscheme tfl
	set background=dark
	set ttyfast
else
	colorscheme darkblue
	set background=dark
	set nottyfast
endif

" A color preset.
func! ColorPreset1()
	colorscheme default
	set background=dark
endfunc

" Another color preset.
func! ColorPreset2()
	colorscheme tfl
	set background=dark
	silent call ExtraColorSets()
endfunc

" Enter a shell (bash) hashbang.
func! HashBang()
	exe "normal! ggi#!/bin/bash\<CR>\<CR>\<Esc>G"
endfunc

" Enter a shell (sh) hashbang.
func! ShHashBang()
	exe "normal! ggi#!/bin/sh\<CR>\<CR>\<Esc>G"
endfunc

" Enter a tidy header.
func! Header()
	exe "normal! i#\<Esc>82a-\<Esc>o"
	exe "normal! i# Project Name      - \<CR>"
	exe "normal! i# Started On        - \<Esc>:r!date\<CR>i\<c-h>\<Esc>A\<CR>"
	exe "normal! i# Last Change       - \<CR>"
	exe "normal! i# Author E-Mail     - terminalforlife@yahoo.com\<CR>"
	exe "normal! i# Author GitHub     - https://github.com/terminalforlife\<CR>"
	exe "normal! i#\<Esc>82a-\<Esc>0o"
endfunc

" Function to save the current file, but also update header.
func! LastChange()
	exe "normal! mcgg/^[#/\"]\\+ Last Change\<CR>f-c$- \<Esc>:r!date\<CR>i\<c-h>\<Esc>`c"
endfunc

" Lol. Why didn't I use a snippet file? Oh well, very useful for shell (bash).
func! Setup()
	exe "normal! 0iXERR(){ echo \"ERROR: $1\" 1>&2; exit 1; }\<CR>"
	exe "normal! 0iERR(){ echo \"ERROR: $1\" 1>&2; }\<CR>\<CR>"

	exe "normal! 0ideclare -i DEPCOUNT=0\<CR>"
	exe "normal! 0ifor DEP in /usr/bin/{} /bin/{} /sbin/{}\<CR>{\<CR>"
	exe "normal! 0i\<Tab>if ! type -P \"$DEP\" &> /dev/null\<CR>\<Tab>then\<CR>"
	exe "normal! 0i\<Tab>\<Tab>ERR \"Dependency '$DEP' not met.\"\<CR>"
	exe "normal! 0i\<Tab>\<Tab>DEPCOUNT+=1\<CR>\<Tab>fi\<CR>}\<CR>\<CR>"
	exe "normal! 0i[ $DEPCOUNT -eq 0 ] || exit 1\<CR>\<CR>"

	exe "normal! 0ishopt -s extglob\<CR>\<CR>"

	exe "normal! 0iUSAGE()\<CR>{\<CR>\<Tab>while read -r\<CR>"
	exe "normal! 0i\<Tab>do\<CR>\<Tab>\<Tab>echo \"$REPLY\"\<CR>\<Tab>done <<-EOF\<CR>"
	exe "normal! 0i\<Tab>\<Tab>            EXAMPLE (25th September 2017)\<CR>"
	exe "normal! 0i\<Tab>\<Tab>            Written by terminalforlife (terminalforlife@yahoo.com)\<CR>"
	exe "normal! 0i\<Tab>\<Tab>\<CR>"
	exe "normal! 0i\<Tab>\<Tab>            Description Here\<CR>\<CR>"
	exe "normal! 0i\<Tab>\<Tab>SYNTAX:     example [OPTS]\<CR>"
	exe "normal! 0i\<Tab>\<Tab>\<CR>"
	exe "normal! 0i\<Tab>\<Tab>OPTS:       --help|-h|-?            - Displays this help information.\<CR>"
	exe "normal! 0i\<Tab>\<Tab>            --debug                 - Enables the built-in bash debugging.\<CR>"
	exe "normal! 0i\<Tab>\<Tab>            --quiet|-q              - Runs in quiet mode. Errors still output.\<CR>"
	exe "normal! 0i\<Tab>\<Tab>\<CR>"
	exe "normal! 0i\<Tab>\<Tab>NOTE:       N/A\<CR>"
	exe "normal! 0i\<Tab>EOF\<CR>}\<CR>\<CR>"

	exe "normal! 0ifor ARG in $@\<CR>{\<CR>\<Tab>case \"$ARG\"\<CR>\<Tab>in\<CR>"
	exe "normal! 0i\<Tab>\<Tab>--help|-h|-\\?)\<CR>\<Tab>\<Tab>\<Tab>USAGE; exit 0 ;;\<CR>"
	exe "normal! 0i\<Tab>\<Tab>--debug)\<CR>\<Tab>\<Tab>\<Tab>DEBUGME=\"true\" ;;\<CR>"
	exe "normal! 0i\<Tab>\<Tab>--quiet|-q)\<CR>\<Tab>\<Tab>\<Tab>BEQUIET=\"true\" ;;\<CR>"
	exe "normal! 0i\<Tab>\<Tab>*)\<CR>\<Tab>\<Tab>\<Tab>XERR \"Incorrect argument(s) specified.\" ;;\<CR>"
	exe "normal! 0i\<Tab>esac\<CR>\<CR>\<Tab>shift\<CR>}\<CR>\<CR>"

	exe "normal! 0i[ $UID -eq 0 ] && XERR \"Root access isn't required.\"\<CR>\<CR>"

	exe "normal! 0i[ \"$BEQUIET\" == \"true\" ] && exec 1> /dev/null\<CR>"

	exe "normal! 0i[ \"$DEBUGME\" == \"true\" ] && set -xeu\<CR>\<CR>\<CR>\<CR>"
	exe "normal! 0i[ \"$DEBUGME\" == \"true\" ] && set +xeu\<Esc>kk"
endfunc

" Enable syntax highlighting.
syntax on

" Sets Insert Remappings
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

" Press spacebar to clear search highlighting.
noremap <silent> <SPACE> :noh<CR>

" Disable the arrow keys.
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>

" Switch to a different color preset.
noremap <silent> <leader>color1 :call ColorPreset1()<CR>
noremap <silent> <leader>color2 :call ColorPreset2()<CR>

" Re-source the .vimrc file; can cause issues.
noremap <silent> <leader>rc :source $HOME/.vimrc<CR>

" Display helpful screen information; good for code.
noremap <silent> <leader>more :call MoreMode()<CR>

" Toggle the display of tabs and spaces.
noremap <silent> <leader>list :call ListMode()<CR>

" Work in progress. Toggles a stricter VIM.
noremap <silent> <leader>hard :call HardMode()<CR>

" Use VIM as a standard text editor, for non-code.
noremap <silent> <leader>doc :call DocMode()<CR>

" Toggle moving the cursor and the screen simultaneously.
noremap <silent> <leader>scroll :call AutoScroll()<CR>

" Toggle the ability to move the cursor anyway.
noremap <silent> <leader>virt :call VirtualEdit()<CR>

" Toggle the mouse support.
noremap <silent> <leader>mouse :call MouseSupport()<CR>

" Uses the header to update the modified date and save.
noremap <silent> <leader>save :call LastChange()<CR>

" Adds a lot of nice shell (bash) code in preperation.
noremap <silent> <leader>setup :call Setup()<CR>

" Enter hashbangs on the first line.
noremap <silent> <leader>bash :call HashBang()<CR>
noremap <silent> <leader>shell :call ShHashBang()<CR>

" Underline below the current; uses the same length.
noremap <silent> <leader>ul mmyypVr-<Esc>`m

" Comment out and undo said comment, using hash.
noremap <silent> <leader>co mmI#<Esc>`m
noremap <silent> <leader>uc mm0x`m

" Add a header at the current position.
noremap <silent> <leader>header :call Header()<CR>

" Use VIM's window splitting and switching.
noremap <silent> <leader>ws :split<CR>
noremap <silent> <leader>wvs :vsplit<CR>
noremap <silent> <leader>wc :close<CR>
noremap <silent> <leader>ac :center<CR>
noremap <silent> <leader>ar :right<CR>
noremap <silent> <leader>al :left<CR>

" Jump to the next or previous file.
noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>

" Toggle the spellchecking feature.
noremap <leader>spell :set spell!<CR>

" Toggle the search highlighting.
noremap <leader>hl :set hlsearch!<CR>

" Display a comment bar, using a hash.
noremap <silent> <leader>bar 0i#<Esc>82a-<Esc>0

" Sets Jump Points
noremap <silent> K 10j
noremap <silent> L 10k

" Sets Visual Remappings
vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

" Function Calls
silent call AutoScroll()
silent call ExtraColorSets()
silent call MoreMode()

" Adds security.
set secure