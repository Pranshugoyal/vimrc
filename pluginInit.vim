
function PackageManagerInit()
	if !isdirectory(expand('~/.vim/pack/minpac'))
		echo "Package Manager not installed"
		return
	endif

	packadd minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type':'opt'})

	"Colorschemes
	call minpac#add('sainnhe/sonokai', {'type': 'opt'})
	call minpac#add('arzg/vim-colors-xcode', {'type': 'opt'})

	"Features
	call minpac#add('vim-syntastic/syntastic', {'type': 'opt'})
	call minpac#add('yegappan/taglist', {'type': 'opt'})

	"Language support
	call minpac#add('rust-lang/rust.vim', {'type': 'opt'})
	call minpac#add('fatih/vim-go', {'type': 'opt'})

	"Git support
	call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
	call minpac#add('tpope/vim-fugitive', {'type': 'opt'})

	"Debug support
	call minpac#add('puremourning/vimspector', {'type': 'opt'})

	"Nvim specific tree-sitter plugins
	call minpac#add('nvim-treesitter/nvim-treesitter-textobjects', {'type': 'opt'})
	call minpac#add('nvim-treesitter/nvim-treesitter', {'type': 'opt'})

	call minpac#update()
endfunction

function SonokaiLoad()
	syntax on
	packadd sonokai
	let g:sonokai_show_eob=0
	let g:sonokai_disable_italic_comment = 1
	let g:sonokai_better_performance = 1
	"let g:sonokai_style='atlantis'
	colorscheme sonokai
endfunction

function SyntasticLoad()
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_error_symbol = "\u2717"
	let g:syntastic_warning_symbol = "\u26A0"
    highlight link SyntasticErrorLine error
    highlight link SyntasticErrorSign error
	packadd syntastic
endfunction

function NetrwConfig()
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
	let g:netrw_altv = 1
	let g:netrw_winsize = 13
endfunction

function PluginSetupvimgitgutter()
	set updatetime=100
	highlight GitGutterAdd ctermfg=203
	packadd vim-gitgutter
endfunction

if has('nvim')
    function TreeSitterTurnOn()
        packadd nvim-treesitter
        lua require('treesitter-config')
    endfunction
endif
