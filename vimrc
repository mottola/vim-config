if has('autocmd')
	filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

" Font and Colorscheme {{{
if has("gui_running")
	colorscheme visualstudio
	"colorscheme solarized
	"set background=light

	"colorscheme molokai
	"hi Folded guifg=#dddddd guibg=#222222

	"colorscheme softlight
	"hi Special gui=NONE guifg=#0E8ED3 guibg=#ffffff

	"colorscheme softblue

	"colorscheme google
	"hi Statement guifg=#2a5db0 guibg=#ffffff gui=bold

	if has("win32")
		set gfn=DejaVu_Sans_Mono:h12
	elseif has("unix")
		if has("macunix")
			set gfn=DejaVu\ Sans\ Mono:h18
		else
			set gfn=Ubuntu\ Mono\ 16
		endif
	endif

else
	if &t_Co == 8 && $TERM !~# '^linux'
		set t_Co=16
	endif

	colorscheme molokai
	"hi Folded guifg=#dddddd guibg=#1B1D1E
	hi Folded guifg=#dddddd guibg=#222222

	"colorscheme inkpot
	"hi Folded guibg=#1c314c guifg=#dddddd

	set mouse=a
end
" }}}

" Option Settings {{{
set tabstop=8

" cindent
set cindent
set cinoptions=
set cinoptions+=t0
set cinoptions+=j1
set cinoptions+=m1
set cinoptions+=(s
set cinoptions+=N-s

" general
set hidden
set wildmenu
set nocompatible
set number
set ruler
set showcmd
set autoread
set winaltkeys=no
set guioptions=aegimrLtT

if has("win32") && has("gui_running")
	set encoding=utf-8
end

" I  like this personally
if !has("win32") || has("gui_running")
	set list
	set listchars=tab:\→\ ,trail:\‣,extends:\↷,precedes:\↶
end

" other examples
" set listchars=tab:\⇒\─,trail:\‣,extends:\↷,precedes:\↶
" set listchars=tab:\→\ ,trail:\‣,extends:\↷,precedes:\↶
" set listchars=tab:\↴\⇒,trail:\⎕,extends:\↻,precedes:\↺,eol:\↵
" set listchars=tab:\┼\─,trail:\˽,extends:\↷,precedes:\↶

if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

if !&scrolloff
	set scrolloff=1
endif

if !&sidescrolloff
	set sidescrolloff=5
endif

" search
set nosmartindent
set ignorecase
set smartcase
set incsearch
set nohlsearch
set nowrap
set showmatch

" window splits
set winminheight=0
set winminwidth=0

" keys
set backspace=2
set whichwrap=b,s,h,l,[,],<,>

" misc
set foldmethod=marker
set display=lastline,uhex
set sessionoptions+=resize

set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{fugitive#statusline()}%=%-16(\ %l,%c\ %)%P

" Sophisticated Swap Files
if has("win32")
	if exists("my_diff_mode_flag") && my_diff_mode_flag == 1
		set directory=C:\WINDOWS\Temp,~\tmp,~,~\vimfiles\swpdiff,.
	else
		set directory=C:\WINDOWS\Temp,~\tmp,~,~\vimfiles\swp,.
	endif
elseif has("unix")
	if exists("my_diff_mode_flag") && my_diff_mode_flag == 1
		set directory=/tmp,~/.swpdiff,~/tmp,~/.vim/.swpdiff,~/.vim/swpdiff,~,.
	else
		set directory=/tmp,~/.swp,~/tmp,~/.vim/.swp,~/.vim/swp,~,.
	endif
endif
" }}}

if has("win32")
	set shell=C:\Windows\System32\cmd.exe
	set shellcmdflag=/c
	set shellxquote=(
	"set shellredir=>%s 2>&1
endif

" Plugin Settings {{{

let g:cpp_class_scope_highlight = 1
let g:cpp_concepts_highlight = 1

"let g:tagbar_ctags_bin = 'jsctags -r'

let g:jsx_ext_required = 1

"let g:syntastic_debug = 1

"if !has("win32")
"  let g:syntastic_c_checkers = ['clang_check']
"  let g:syntastic_clang_check_config_file = '.syntastic_clang_check_config'
"end
"
"let g:syntastic_scala_checkers = ['fsc']
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

if has("unix") && !has("macunix")
	let g:clang_library_path = '/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
end

" prevent annoying warnings from nerdtree
let g:NERDShutUp = 1

" don't load the matchparen plugin
let loaded_matchparen = 1

" filetype plugin settings
let g:no_html_tab_mapping = 1 " let me insert tabs when i press the freakin tab key!
let g:html_tag_case = 'lowercase'

" use a vertical window split
let g:yankring_window_use_horiz   = 0

" don't include single character deletes
let g:yankring_min_element_length = 2

" truncate each paste at 50 chars to keep the window width small
let g:yankring_max_display        = 50

" don't bother to colorize end tags differently
" based on what type of block is being ended
" hopefully this means faster loads and better
" syntax hilite with folds
let ruby_no_expensive = 1
" }}}

" Auto Commands {{{
" keep relative line number on permanently/by default
autocmd BufNew,BufRead * setlocal relativenumber
"autocmd BufLeave,FocusLost * silent! wall
" }}}

" Key Mappings {{{
let maplocalleader = "\\"
let mapleader = " "

let g:ctrlp_map = "<Leader>p"

let g:my_vim_folder = split(&rtp, ",")[0]

" fast .vimrc access
execute "nnoremap <Leader>htm :read " . g:my_vim_folder . "/template.html<CR>"
execute "nnoremap <Leader>c :read " . g:my_vim_folder . "/template.cpp<CR>"
nnoremap <LocalLeader>v :e $MYVIMRC<CR>
nnoremap <LocalLeader>o :source $MYVIMRC<CR>

" update plugins
nnoremap <Leader>upd :!~/.vim/bin/update.sh<CR>

nnoremap <LocalLeader>f  :botright copen<CR>
nnoremap <LocalLeader>x  :cclose<CR>
nnoremap <LocalLeader>t  :TagbarToggle<CR>
nnoremap <LocalLeader>n  :NERDTreeToggle<CR>
nnoremap <LocalLeader>h  :set hls!<CR>
nnoremap <LocalLeader>rn :call ToggleRelativeNumber()<CR>
vnoremap <LocalLeader>rn :call ToggleRelativeNumberVisual()<CR>
nnoremap <LocalLeader>w  :call ToggleWrap()<CR>
nnoremap <LocalLeader>m  :call ToggleMousePaste()<CR>

" filters
nnoremap <LocalLeader>s :call StripWhitespace()<CR>

" js [Y]ourself, output a token's name and it's value
nmap <Leader>jsy :call QuickLoggerVar()<CR>
nmap <Leader>jsl :call QuickLoggerLine()<CR>
nmap <Leader>jsc :call GetClosure()<CR>

" auto insert curly braces on Control-F
inoremap <C-F> {<CR>}<C-O>O

" alt key substitutions for normal style
" editor things like copy paste save
" close and quit
nnoremap <M-a> ggVG
nnoremap <M-v> "+P
nnoremap <M-V> "+p
vnoremap <M-c> "+y
vnoremap <M-x> "+x
nnoremap <M-s> :w<CR>
nnoremap <M-w> :BD<CR>
nnoremap <M-W> :bd<CR>

" make indentation easier by default
nnoremap < <<
nnoremap > >>

" make indentation keep selection intact
vnoremap > >gv
vnoremap < <gv

nnoremap <C-e> j<C-e>
nnoremap <C-y> k<C-y>

map <F5> :!run<CR>
" }}}

" Functions {{{
function! ToggleMousePaste()
	if &mouse == 'a'
		set paste
		set mouse=
		set nonumber
		echo 'Mouse Paste ON'
	else
		set nopaste
		set number
		set mouse=a
		echo 'Mouse Paste OFF'
	endif
endfunction

function! ToggleRelativeNumberVisual()
	call ToggleRelativeNumber()
	normal gvj
endfunction

function! ToggleRelativeNumber()
	if( &nu == 1 )
		set nonu
		set rnu
	else
		set nu
		set nornu
	endif
endfunction

function! ToggleWrap()
	set wrap!

	if( &wrap == 1 )
		nmap j gj
		nmap k gk
	else
		unmap j
		unmap k
	endif
endfunction

function! ToggleFold()
	if foldlevel('.') == 0
		normal! l
	else
		if foldclosed('.') < 0
			. foldclose
		else
			. foldopen
		endif
	endif
	" Clear status line
	echo
endfunction

function! StripWhitespace()
	let currPos=Mark()
	exe 'v:^--\s*$:s:\s\+$::e'
	exe currPos
endfunction

function! Mark(...)
	if a:0 == 0
		let mark = line(".") . "G" . virtcol(".") . "|"
		normal! H
		let mark = "normal!" . line(".") . "Gzt" . mark
		execute mark
		return mark
	elseif a:0 == 1
		return "normal!" . a:1 . "G1|"
	else
		return "normal!" . a:1 . "G" . a:2 . "|"
	endif
endfunction

function! GetLoggingStatement(token, label)
	let token = a:token
	let label = a:label

	let joiner = ""
	let log_line = ""
	let line_prefix = ""
	let line_suffix = ""

	let syntax_type = &ft
	if syntax_type == "python"
		let line_prefix = "print("
		let line_suffix = ")"

		if strlen(token) > 0 && strlen(label) <= 0
			let label = "\"" . token . "\""
		elseif  strlen(token) <= 0 && strlen(label) > 0
			let label = "\"" . label . "\""
		else
			let label = label
		endif

		if strlen(token) > 0 && strlen(label) > 0
			let joiner = line_suffix . "\n" . line_prefix
		else
			let joiner = ""
		endif

	elseif syntax_type == "cpp"
		if g:is_logger
			let line_prefix = "LOGGER << "
			let line_suffix = ";"
		else
			let line_prefix = "std::cout << "
			let line_suffix = " << std::endl;"
		endif

		if strlen(token) > 0 && strlen(label) <= 0
			let label = "\"" . token . " = \""
		elseif  strlen(token) <= 0 && strlen(label) > 0
			let label = "\"" . label . "\""
		else
			let label = label
		endif

		if strlen(token) > 0 && strlen(label) > 0
			let joiner = " << "
		else
			let joiner = ""
		endif

	elseif syntax_type == "java"
		let line_prefix = "System.out.println("
		let line_suffix = ");"

		if strlen(token) > 0 && strlen(label) <= 0
			let label = "\"" . token . "\""
		elseif strlen(token) <= 0 && strlen(label) > 0
			let label = "\"" . label . "\""
		else
			let label = label
		endif

		if strlen(token) > 0 && strlen(label) > 0
			let joiner = line_suffix . "\n" . line_prefix
		else
			let joiner = ""
		endif
	elseif syntax_type == "javascript"
		let line_prefix = "console.log("
		let line_suffix = ");"

		if strlen(token) > 0 && strlen(label) <= 0
			let label = "\"" . token . "\""
		elseif strlen(token) <= 0 && strlen(label) > 0
			let label = "\"" . label . "\""
		else
			let label = label
		endif

		if strlen(token) > 0 && strlen(label) > 0
			let joiner = line_suffix . "\n" . line_prefix
		else
			let joiner = ""
		endif
	endif

	let log_line = line_prefix . label . joiner  . token . line_suffix

	return log_line
endfunction

function! GetVarLogOutput()
	let loggingTarget = expand("<cWORD>")
	let loggingOutput = GetLoggingStatement(loggingTarget, "")
	return loggingOutput
endfunction

function! GetLineLogOutput()
	let curLine = getline(".")
	let loggingTarget = substitute(curLine, "^\\s*\\(.*\\)\\s*$", "\\1", "")
	let loggingOutput = GetLoggingStatement("", loggingTarget)
	return loggingOutput
endfunction

function! QuickLoggerVar()
	let result = GetVarLogOutput()
	normal ma
	put =result
	normal 'a
	normal dd
	normal =j
endfunction

function! QuickLoggerLine()
	let result = GetLineLogOutput()
	normal ma
	put =result
	normal 'a
	normal dd
	normal ==
endfunction

function! GetClosure()
	let closure = ""
	let syntax_type = &ft

	normal ma
	if syntax_type == "cpp"
		let closure = "[](auto &x) {\nreturn x;\n}"
	elseif syntax_type == "javascript"
		let closure = "(x) => {\nreturn x;\n}"
	elseif syntax_type == "ruby"
		let closure = "{ |x| x * x }"
	endif

	exe "normal i" . closure
	normal k^
endfunction
" }}} Functions
