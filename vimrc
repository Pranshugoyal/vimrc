
let $VIMHOME = $HOME."/.vim"
exec "source ".$VIMHOME."/pluginInit.vim"

"UI Settings
call NetrwConfig()
colorscheme monochrome
set number relativenumber
set noequalalways scrolloff=2 signcolumn=number
set secure exrc 

if has('nvim')
	set noincsearch nohlsearch
	set guicursor=n-v-c-i-ci-ve:ver25-blinkon100,r-cr:hor20,o:hor50
    tnoremap <Esc> <C-\><C-n>
else
	set ruler showcmd
	set wildmenu
endif

filetype plugin on

"Editing settings
set mouse=i
nnoremap Y y$
set ignorecase
set clipboard=unnamed
set whichwrap+=<,>,h,l
set completeopt+=noselect
set smartindent tabstop=4 shiftwidth=4

com! EditFTPlugin exe 'e ~/.vim/after/ftplugin/' . &filetype . '.vim'
com! Sonokai exe 'call SonokaiLoad()'
com! Drawer exe '35vs . | wincmd l'

if &diff
	call PluginSetupvimgitgutter()
endif

augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END 

augroup RelativeNumberingOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal relativenumber
	autocmd WinLeave * setlocal norelativenumber
augroup END 

