set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
let g:jedi#popup_on_dot = 0
:syntax on
:set incsearch
:set hlsearch
:set rnu
:set nu

:map <up> gk
:map <down> gj
:map <C-l> w
:map <C-h> b

:command Vimrc vsp ~/.vimrc
:command NN set rnu nu
:command NONN set nornu nonu 

function! Hashbang(portable, permission, RemExt)
let shells = { 
        \    'awk': "awk",
        \     'sh': "bash",
        \     'hs': "runhaskell",
        \     'jl': "julia",
        \    'lua': "lua",
        \    'mak': "make",
        \     'js': "node",
        \      'm': "octave",
        \     'pl': "perl", 
        \    'php': "php",
        \     'py': "python3",
        \      'r': "Rscript",
        \     'rb': "ruby",
        \  'scala': "scala",
        \    'tcl': "tclsh",
        \     'tk': "wish"
        \    }

let extension = expand("%:e")

if has_key(shells,extension)
	let fileshell = shells[extension]

	if a:portable
		let line =  "#! /usr/bin/env " . fileshell 
	else 
		let line = "#!" . system("which " . fileshell)
	endif

	0put = line

	if a:permission
		:autocmd BufWritePost * :autocmd VimLeave * :!chmod u+x %
	endif


	if a:RemExt
		:autocmd BufWritePost * :autocmd VimLeave * :!mv % "%:p:r"
	endif

endif

endfunction

:autocmd BufNewFile *.* :call Hashbang(0,1,0)
