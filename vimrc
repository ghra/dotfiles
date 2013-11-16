set t_Co=256


" load NeoBundle
if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

NeoBundle 'bling/vim-airline'

" git utility
NeoBundle 'tpope/vim-fugitive'

filetype on
filetype plugin on
filetype indent on

" NeoBundle installation check
NeoBundleCheck




" ============== Restore last position ============
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


"============== Airline Config ===================
"let g:airline_powerline_fonts = 1
set encoding=utf-8
"if $COLORTERM == 'gnome-terminal'
"  set t_Co=256
"endif
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
set laststatus=2





"Store lots of :cmdline history
set history=1000

set nowrap
set tabstop=4

"   set background=dark
"   highlight Comment guifg=DarkGreen ctermfg=DarkGreen
" Pracuje na jasnym tle. Komentarze chce miec zielone.
set background=light
highlight Comment guifg=Grey ctermfg=Grey

"   dwa ponizsze do oznaczania tabulacji oraz konczacych spacji
highlight SpecialKey guifg=LightGrey ctermfg=LightGrey
"set list listchars=trail:·,tab:»·
set list listchars=trail:.,tab:>.

set cindent
set ruler
syntax on

" Pokazywanie pasujacych nawiasow
" (przy wstawianiu, lub najezdzamy na klamerke i wciskamy Shift+5)
set showmatch

" Podswietlanie znalezionych
set hlsearch

" Pokazywanie numerkow lini
"set number

" Auto-zapis plikow
set autowrite

" Przy uzupelnianiem tabem czegokolwiek w lini polecen - wyswietla od razu wszystkie mozliwosci
set wildmenu

" Zeby backspace mozna bylo kasowac wszystko (a nie tylko
" na przyklad to co w ostatnim insercie zostalo dodane)
set bs=2

" Domyslne kodowanie znakow:
set encoding=utf8
"set encoding=iso8859-2
"set fileencoding=iso8859-2

" Nacisne F5 to przejdzie mi na ciemne tlo i ciemnosielone komentarze
" Nacisne F6 to przejdzie mi na jasne tlo i zielone komentarze
map <F5> :set background=dark<CR>:hi Comment guifg=DarkGrey ctermfg=DarkGrey<CR>:hi Pmenu ctermbg=Grey ctermfg=Black<CR>:hi PmenuSel ctermbg=Red ctermfg=White<CR>
map <F6> :set background=light<CR>:hi Comment guifg=Grey ctermfg=Grey<CR>:hi SpecialKey guifg=DarkBlue ctermfg=DarkBlue<CR>
map <F7> :set background=light<CR>:hi Comment guifg=LightBlue ctermfg=LightBlue<CR>:hi SpecialKey guifg=DarkBlue ctermfg=DarkBlue<CR>
map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" omni-complete, czyli Ctrl+X
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType as set omnifunc=actionscriptcomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete

" python pep8 compat
" "autocmd BufNewFile,BufRead *.py
autocmd FileType python setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4 
	\ textwidth=80
	\ smarttab
	\ expandtab

