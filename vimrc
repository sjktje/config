" sjks .vimrc
set nocompatible		" I don't like vi
set history=50			" Keep 50 lines of command line history.
set ts=4
set si					" Smart indent
set cindent				" Do c-style indenting
set noexpandtab			" Real tabs please!
"set smarttab			" Use tabs at the start of a line, spaces elsewhere
set shiftwidth=4
set softtabstop=4
set tabstop=4			" Compatible tab settings
set history=50
set ai
set bs=2
set ruler				" ruler enables the line count etc thing at the bottom of the window.
set nowrap				" Don't wrap text at window width
set nohlsearch			" Don't make search results red
set incsearch			" But do hilight as you type search phrase
set noerrorbells		" don't make noise
set foldenable			" Enable {{{ folding }}}
set foldmethod=marker	" Fold stuff within {{{ and }}}
set showmatch			" show matching brackets
set mat=5				" how many tenths of a second to blink matching brackets for
set pastetoggle=<F2>
set grepprg=grep\ -nH\ $* " Required by Latex-Suite
set textwidth=80		" I like 80 char long rows.
set number				" Show line numbers
syntax enable			" syntax hilighting is nice
"colo elflord			" change the colorscheme to 'elflord'. Murphy is cool too, though.
colo desert				" And desert is too.

map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal

highlight Folded guibg=Black guifg=blue
highlight FoldColumn guibg=darkgrey guifg=white

"nmap = o<Esc>			" Press = to insert an empty line without going into insert mode

"autocmd BufWrite *.pl %s/changed\(\s\+\)=> '.*/\="changed\1=> '" . strftime("%c") . "',"/e
filetype plugin on

filetype plugin indent on
syntax on

function! UPDSERIAL(date, num)
	if (strftime("%Y%m%d") == a:date)
		return a:date . a:num+1
	endif
	return strftime("%Y%m%d") . '01'
endfunction

command Soa :%s/\(2[0-9]\{7}\)\([0-9]\{2}\)\s*;\s*serial/\=UPDSERIAL(submatch(1), submatch(2)) . '; Serial'/gc
command Aao :%s,å,\&aring;,eg | :%s,Å,\&Aring;,eg | :%s,ä,\&auml;,eg | :%s,Ä,\&Auml;,eg | :%s,ö,\&ouml;,eg | :%s,Ö,\&ouml;,eg

let g:tex_flavor='latex'
let html_use_css = 1            " the ':%TOhtml' command generates html without <font> tags
let mapleader="\\"			

nnoremap <leader>l :ls<CR>:b<space>
