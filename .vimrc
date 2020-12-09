" ============================
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" ============================
"
" WELCOME TO MY VIMRC.
"


let mapleader=" "


"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/
"
" I use vimplug which you can find more
" description on ???
"

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdcommenter'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'mboughaba/i3config.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'baskerville/vim-sxhkdrc'
	Plug 'etdev/vim-hexcolor'
	Plug 'gi1242/vim-tex-syntax'
call plug#end()

	" Comment coc
		let g:coc_disable_startup_warning = 1
		map <C-c> <leader>c<space>

	"airline
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif
		let g:airline_symbols.maxlinenr = ' col'

	" i3 syntax
		aug i3config_ft_detection
			au!
			au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
		aug end

	" Goyo
		let g:goyo_width=90
		map <leader>f :Goyo<CR>:source ~/.vimrc<CR>


"   ____                           _
"  / ___| ___ _ __   ___ _ __ __ _| |
" | |  _ / _ \ '_ \ / _ \ '__/ _` | |
" | |_| |  __/ | | |  __/ | | (_| | |
"  \____|\___|_| |_|\___|_|  \__,_|_|
"

syntax on
set number
set ruler
set relativenumber
set noexpandtab
set autoindent
set smarttab
set tabstop=2
set shiftwidth=2
set splitbelow splitright
set showcmd
set noshowmode

highlight LineNr ctermfg=DarkGrey
highlight CursorLineNr cterm=bold ctermfg=white

let &t_SI="\<Esc>[5 q" "blink I-beam in --INSERT-- mode
let &t_SR="\<Esc>[3 q" "blink underline in --REPLACE-- mode
let &t_EI="\<Esc>[ q"  "default cursor


" split window
noremap <C-H>   <C-W>h
noremap <C-J>   <C-W>j
noremap <C-K>   <C-W>k
noremap <C-L>   <C-W>l
noremap <Left>  <C-W>H
noremap <Down>  <C-W>J
noremap <Up>    <C-W>K
noremap <Right> <C-W>L

" copy/paste (require gvim)
vnoremap <C-y> "+y
noremap  <C-p> "+P
inoremap <C-p> <Esc>"+P<CR>i

map     Q :q<CR>
noremap <C-S> :w<CR>
noremap <C-s> :w<CR>
map     <leader><leader> /(++)<Enter>"_d4l
imap    `` <Esc>/(++)<Enter>"_c4l

" my own define command
command! -nargs=0 B vsplit ~/Documents/mybib.bib

" delete white space
autocmd BufWritePre * %s/\s\+$//e

" auto run
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &





"===========================================================


"  ____        _                  _
" / ___| _ __ (_)_ __  _ __   ___| |_ ___
" \___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
"  ___) | | | | | |_) | |_) |  __/ |_\__ \
" |____/|_| |_|_| .__/| .__/ \___|\__|___/
"               |_|   |_|

""""""" tex
let b:tex_stylish=1

autocmd FileType tex map <F2> :w<CR> :!pdflatex % <CR><CR>
autocmd FileType tex map <F3> :w<CR> :!xelatex % <CR><CR>
autocmd FileType tex map <F4> :!zathura %:r.pdf & <CR><CR>
autocmd FileType tex inoremap 'b  \textbf{}<Esc>i
autocmd FileType tex inoremap 'i \textit{}<Esc>i
autocmd FileType tex inoremap 'e \emph{}<Esc>i
autocmd FileType tex inoremap 'u \usepackage{}<Esc>i
autocmd FileType tex inoremap \frac \frac{}{(++)}<Esc>ba
autocmd FileType tex inoremap {} {}<Esc>i
autocmd FileType tex inoremap [] []<Esc>i
autocmd FileType tex inoremap () ()<Esc>i
autocmd FileType tex inoremap '' ''<Esc>i
autocmd FileType tex inoremap "" ""<Esc>i
autocmd FileType tex inoremap {<Enter> {<Enter><BS>}<Esc>ko
autocmd FileType tex inoremap <C-E> <space>(++)<Esc>2bdwi\begin{<Esc>pi}<Enter><BS>\end{<Esc>pi}<Enter><Esc>2ko
"""""""

""""""" c program
autocmd FileType c map <F2> :w<CR>:!clear &&  gcc % -o %:r.out <CR> :! ./%:r.out <CR>
autocmd FileType c inoremap 'p printf();(++)<Esc>5hi

autocmd FileType c inoremap '' ''<Esc>i
autocmd FileType c inoremap "" ""<Esc>i
autocmd FileType c inoremap () ()<Esc>i
autocmd FileType c inoremap {} {}<Esc>i
autocmd FileType c inoremap [] []<Esc>i
autocmd FileType c inoremap {<Enter> {<Enter><BS>}<Esc>ko
"""""""

""""""" cpp
autocmd FileType cpp map <F2> :w <CR> :! clear<CR> :! g++ % -o %:r.out<CR> :! ./%:r.out<CR>
autocmd FileType cpp map <F3> :!g++ -c % <CR><CR> :!g++ %:r.o -o sfml-%:r -lsfml-graphics -lsfml-window -lsfml-system<CR><CR>
autocmd FileType cpp inoremap "" ""(++)<Esc>4hi
autocmd FileType cpp inoremap () ()<Esc>i
autocmd FileType cpp inoremap {} {}<Esc>i
autocmd FileType cpp inoremap [] []<Esc>i
autocmd FileType cpp inoremap {<Enter> {<Enter><BS>}<Esc>ko

" for sfml files
command! -nargs=0 SF !./sfml-%:r &
"""""""

""""""" asymptote
au BufRead,BufNewFile *.asy set filetype=asy
autocmd FileType asy map <F2> :w<CR>:!clear<CR> :!asy % <CR>
autocmd FileType asy map <F4> :!zathura %:r.pdf & <CR><CR>
autocmd FileType asy inoremap () ()(++)<Esc>4hi
autocmd FileType asy inoremap {} {}(++)<Esc>4hi
autocmd FileType asy inoremap [] [](++)<Esc>4hi
autocmd FileType asy inoremap {<Enter> {<Enter>}<Esc>ko<Tab>
"""""""

""""""" html
autocmd FileType html inoremap <C-E>i <space>(++)<Esc>2bdwi<<Esc>pi></<Esc>pi><Esc>l2x?<<Enter>i
autocmd FileType html inoremap <C-E><Enter> <space>(++)<Esc>2bdwi<<Esc>pi><Enter></<Esc>pi><Enter><Esc>2ko<Tab>
autocmd FileType html inoremap <> <>(++)<Esc>4hi
autocmd FileType html inoremap "" ""<Esc>i
"""""""

""""""" css
autocmd FileType css inoremap {<Enter> {<Enter><BS>}<Esc>ko
"""""""


""""""" javascript (js)
autocmd FileType javascript inoremap "" ""(++)<Esc>4hi
autocmd FileType javascript inoremap () ()<Esc>i
autocmd FileType javascript inoremap {} {}<Esc>i
autocmd FileType javascript inoremap [] []<Esc>i
autocmd FileType javascript inoremap {<Enter> {<Enter><BS>}<Esc>ko
"""""""
