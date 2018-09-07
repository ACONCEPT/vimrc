set nocompatible              " required
filetype off                  " required
" get vundle into vim
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" other vundle plugins
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
"run :BundleInstall to install all on vim
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"automatically resource Vimrc when saved
augroup automaticallySourceVimrc
      au!
      au bufwritepost .vimrc source ~/.vimrc
augroup END

"I don't remember what this does?
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"highlighting, encoding, color, and base formatting 
let python_highlight_all=1
syntax on
set encoding=utf-8
set fileencoding=utf-8
set number
set nowrap
set textwidth=0 wrapmargin=0
colorscheme slate

"mute windows 10 beeping shit
set visualbell
set t_vb=

" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
	execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  	execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"from the readme at https://github.com/amix/vimrc====================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"for managing vim tabs
map  tn :tabnew<cr>
map  to :tabonly<cr>
map  tc :tabclose<cr>
map  tm :tabmove

"switch to CWD to the dirctory of the current file
noremap ,cd :cd %:p:h<cr>:pwd<cr>CR>

"search what is selected in visual block
vnoremap <silent> * :call VisualSelection('f' )<CR>

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"universal_registers
let @t="    "
let @r="<CR>"
let @g="mayyGp'a}jma"
let @a="$a,\\i			"


"convenience mapping
:command! WQ wq
:command! Wq wq
:command! Q q
:command! W w
:command! Vrc :tabedit $HOME/.vimrc
:command! Rsp :vertical resize +25
:command! Rsm :vertical resize -25
noremap ,sw :vertical resize +200<CR>
noremap ,ee $
noremap ,er ^
noremap ,op <CR>p
noremap ,ra ^d0k$Jxij
noremap ,gb gT


"let mapleader="`"
let mapleader=","
noremap <SPACE> <Nop>
"comments

function! Comment(variant)
	if a:variant=="cc"
		echo"variant cc" 
		:normal 0"cPj0
	elseif a:variant--"cv"
		:normal 0"cPa
	elseif a:variant=="cf"
		:normal $"cpA
	elseif a:variant=="cg"
		:normal $"cpj$
	elseif a:variant=="ce"
		:normal $"cp$p
	endif
endfunction

noremap ,ff <Esc>
noremap ,cc :call Comment("cc")<CR> 
noremap ,cv :call Comment("cv")<CR>
noremap ,cf :call Comment("cf")<CR>
noremap ,cg :call Comment("cg")<CR>
noremap ,ce :call Comment("ce")<CR>
noremap ,rw "_diwP
noremap ,rib @m
let @m="lF(pldt)"

"misc 
let mapleader="`"
noremap <CR> o<ESC>

function! DeleteStuff(variant)
	if a:variant=="nn"
		:normal 0xj0
	elseif a:variant=="nm"
		:normal 0xja
	elseif a:variant=="nj"
		:normal $xj$
	elseif a:variant=="nk"
		:normal $xA
	elseif a:variant=="nt"
		:normal 04xj0
	endif
endfunction

"delete first and last char
noremap ,nn :call DeleteStuff("nn")<CR>
noremap ,nm :call DeleteStuff("nm")<CR>
noremap ,nj :call DeleteStuff("nj")<CR>
noremap ,nk :call DeleteStuff("nk")<CR>
noremap ,nt :call DeleteStuff("nt")<CR>
function! TabOver(variant)
	if a:variant=="tt"
		:normal 0"tPj0
	elseif a:variant=="tr"
		:normal 0"tP
	elseif a:variant=="ta"
		:normal 0"tPA
	endif
endfunction

"tab over
noremap ,tt :call TabOver("tt")<CR>
noremap ,tr :call TabOver("tr")<CR>
noremap ,ta :call TabOver("ta")<CR>


noremap ,bc f,a\
"reset filerun argument register
function! SelfArg()
    let @==expand("%")
endfunction

noremap ,sa :call SelfArg()<CR>

function! VimRegisters()
	let @c="\""
endfunction

:command! Tovim :call VimRegisters()

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"BASH================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"bash registers
function! BashRegisters()
	let @b="#! /usr/bin/env bash"
 	let @p="bash"
	let @d="DIR=\"$(cd -P \"$(dirname \"${BASH_SOURCE[0]}\")\" && pwd)\""
	let @c="#"
"	let @e=f"i\ll
endfunction

"
:command! Tosh :execute BashRegisters()<CR>
noremap ,tp :Tosh

noremap <F8> :exec 'bash' shellescape(@%,1)<CR>
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"PYTHON================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"python_registers
function! PythonRegisters()
	let @b="#! usr/bin/env python3\n\ndef main():\n\tpass\n\nif __name__ == '__main__':\n\tmain()"
	let @t="\t"
	let @c="#" 
  	let @p='python3'
	let @==""
    let @l="print()"
    noremap ,pp "lPi"
	noremap ,mm ^d0i	def A(self):
	noremap ,mc
	noremap ,pl ^iprint(A)
endfunction
"let @l='python3'
"command to activate python registers
:command! Topy :execute PythonRegisters()<CR>

"default python buffer settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
"    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"ENVIRONMENT AND EXECUTION ================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function! SetInterpreter(interpreter)
	let b:interpreter=a:interpreter
endfunction

function! SetCurrentBuffer()
	let b:buffer=shellescape(@%)
endfunction

function! SetBuffer(buffer)
	let b:buffer=a:buffer
endfunction

function! SetArgs(args)
	let b:args=a:args
endfunction

function! Run()
	:call SetBuffer(@i)
	:call SetInterpreter(@p)
	:call SetArgs(@o)
	:exec '!'b:interpreter b:buffer b:args
endfunction

function! RunFile(file)
	SetBuffer(a:file)
	Run()	
endfunction

function! SetArgsRunFile(file,args)
	let @i=a:file
	let @o=a:args
	Run()
endfunction

function! RunCurrentFile()
	let @i=expand("%")
    :wa
	:call Run()
endfunction

function! RunConfig(interpreter,buffer,args)
	let @p=a:interpreter
	let @o=a:args
	let @i=a:buffer
	:call Run()
endfunction

noremap <F5> :call RunCurrentFile()<CR>
noremap <F6> :call RunConfig(@p,"~/repos/sims/src/main.py",@o)<CR>
":command Commit :execute "!bash" "~/bin/commit_vimrc.sh"
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"ENVIRONMENT ACTIVATION================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function! ActivateENV()
    let @p= $VIMENV
    echo $VIMENV
endfunction
noremap ,e0 :call DfEnv()<CR> 

function! AnacondaEnv()
	let @p='/home/ubuntu/anaconda3/bin/'
	echo @p
endfunction

noremap ,e9 :call AnacondaEnv()<CR>

"execute DfEnv()
execute AnacondaEnv()

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"set register sets based on file type
function! AssignRegisters()
	let b:python=match(expand('%'),'\.py') 
	if b:python !=  -1
	        echo "activating python registers"
		execute PythonRegisters()
	endif
        let b:bash=match(expand('%'),'\.sh')
	if b:bash != -1
		echo "activating bash registers"
		execute BashRegisters()
        endif
	if (b:python + b:bash) == -2
		echo "activating Vim Registers"
		execute VimRegisters()
	endif
endfunction
execute AssignRegisters()

"sets subdirectory specific settings
function! BelowDir(thedir)
	let b:current_dir=expand("%:p")
	let b:bdmatch = match(b:current_dir,"\\".a:thedir)
endfunction	

function! AssignSettings()
	execute BelowDir($HOME)
	if b:bdmatch != -1
		echo "in home dir"
	endif
	execute BelowDir($GEOFH)
	if b:bdmatch != -1
		echo "in geofence dir"
	endif
endfunction
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"file shortcuts and run configuration================================================================
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:command! Oafs :vsp /home/joe/bin/add_file_shortcut.py
:command! Oatb :vsp /home/joe/bin/home/joe/bin/add_to_bp.py
