
" {{{  Command mapping

" map <F5> :setlocal spell! spelllang=en_us<cr>
noremap <silent> <F7> :cal VimCommanderToggle()<CR>
nmap <silent> <F11> :NERDTreeToggle<CR>

nmap <silent> <C-j> :tabprevious<CR>
nmap <silent> <C-k> :tabnext<CR>

"copy the current visual selection to ~/.vbuf 
vmap <F4> :w! ~/.vbuf<CR> 
"copy the current line to the buffer file if no visual selection 
nmap <F4> :.w! ~/.vbuf<CR> 
"paste the contents of the buffer file 
nmap <F5> :r ~/.vbuf<CR>

":command -range -nargs=* RunSQL :<line1>,<line2>w !psql -U user dbname | less
:command -range -nargs=* RunSQL :<line1>,<line2>w !mysql -u kuba -preksio pasart | less

" }}}

" {{{  Read skeleton files
"
" Reads the skeleton php file
" Note: The normal command afterwards deletes an ugly pending line and moves
" the cursor to the middle of the file.
autocmd BufNewFile [^.]\+.php 0r ~/.vim/skeleton.php | normal Gdd^[OA^[OA
autocmd BufNewFile *.class.php 0r ~/.vim/skeleton.class.php | normal Gdd^[OA^[OA
autocmd BufNewFile [^.]\+.sh 0r ~/.vim/skeleton.sh | normal Gdd^[OA^[OA

" }}}

" {{{  Settings

set encoding=utf-8
set nocompatible
syntax on

" Use filetype plugins, e.g. for PHP
filetype plugin on

" Show nice info in ruler
set ruler
set laststatus=2

" Set standard setting for PEAR coding standards
set expandtab
set tabstop=2
set shiftwidth=2

" Show line numbers by default
set number

" Enable folding by fold markers
set foldmethod=marker
" set foldminlines=3

" Autoclose folds, when moving out of them
set foldclose=all

" Use incremental searching
set incsearch

" Do not highlight search results
set nohlsearch

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" Allow file inline modelines to provide settings
set modeline

" MovingThroughCamelCaseWords
nnoremap <silent><C-h>  :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" Highlight current line in insert mode.
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" Set status line
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

set wildmenu

" }}}

" {{{ File types

au BufNewFile,BufRead *.txt setf textile  
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/ftplugin/yaml.vim

" }}}"

" {{{ snipMate

let g:snips_author = 'Jakub Zalas <jakub@zalas.pl>'
let g:snips_package = 'zLib'
let g:snips_subpackage = 'lib'

" }}}"

" {{{ Taglist

" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=0

" Automatically start script
let generate_tags=1

" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0

" Shorter commands to toggle Taglist display
map <F10> :TlistToggle<CR>

" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" }}}"

source ~/.vimlocalrc

