"
" cfk's .vimrc
"

set nocompatible            " take advantage of vim; no vi emulation
set modelines=5             " recognize those 'vim:' comments in files
set number                  " turn on line numbering
set ruler                   " tells me the cursor position always
set ignorecase              " case-insensitive search patterns by default

set tabstop=2               " a tab character is 2 chars long
set softtabstop=2           " 2 spaces every time you hit the tab key
set shiftwidth=2            " 2 spaces for every '>>' command in normal mode
set expandtab               " tab key inserts spaces, not tab characters
set autoindent              " auto-indenting 
set guicursor+=a:blinkon0   " turn off cursor blink
                            " (turn off bell in .gvimrc)

set wrap                    " turn on wordwrap
set linebreak               " wrap @ the word, not in the middle of a word
set textwidth=76            " 76 chars max, by default

set hidden                  " I don't need to save before switching buffers
set undolevels=1000         " This is the default, it's just so I know.

syntax on
colorscheme default

" mappings in normal mode to switch between buffers quickly.
nmap tt :bn<CR>
nmap tr :bp<CR>

" :set list fun
nmap gl :set list!<CR>

" make vim recognize other file extensions
filetype on
autocmd BufNewFile,BufRead *.ru setlocal filetype=ruby
autocmd BufNewFile,BufRead *.atom setlocal filetype=xml
autocmd BufNewFile,BufRead *.ly setlocal filetype=tex
autocmd BufNewFile,BufRead *.svg setlocal filetype=xml
autocmd BufNewFile,BufRead *.pir,*.pasm setlocal filetype=parrot
autocmd BufNewFile,BufRead *.m setlocal filetype=objc
autocmd BufNewFile,BufRead *.spread setlocal filetype=spread
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
autocmd BufNewFile,BufRead *.mom setlocal filetype=groff
autocmd BufNewFile,BufRead *.go setlocal filetype=go

" these formats don't have 76-char limits
autocmd BufNewFile,BufRead *.html,*.erb,*.textile,*.spread setlocal textwidth=0
autocmd BufNewFile,BufRead *.screenplay setlocal textwidth=60

" these formats have spell-checking on by default
autocmd BufNewFile,BufRead *.txt,*.tex,*.md,*.markdown,*.screenplay setlocal spell

" Special indentation rules for these languages with finicky syntax 
autocmd FileType spread setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab nospell nolist nolinebreak nowrap
autocmd FileType make setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" force the default filetype to be no type at all for plain text files
autocmd BufNewFile,BufRead *.txt setlocal filetype=none

" more special things
autocmd BufNewFile,BufRead *.txt.bf setlocal cryptmethod=blowfish

" For whatever reason, these digraphs are missing
digraph i\" 239
digraph o\" 246
digraph u\" 252
digraph O\" 214
digraph U\" 220

" :hardcopy settings
set printoptions=
set printoptions+=paper:letter,formfeed:y
set printoptions+=left:1in,right:1in,top:1in,bottom:1in
set printoptions+=syntax:y

if has("gui_running")
  colorscheme molokai
endif
