"                           ______     ______________
"                          |######|   |#############W
"                          |######|   |############W
"                          |######|   |###########'
"                          |######|   |###### ¯¯¯
"                          |#####################|
"                          |#####################|
"                          |######|   |######|
"                          |######|   |######|
"                          |######|   |######|
"                          |######|   |######|
"                           ¯¯¯¯¯¯     ¯¯¯¯¯¯
"
"
"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

let mapleader = " "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/git-worktree.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/harpoon.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/peekaboo.vim " a degager peut etre
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/rooter.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/tmux.vim
source ~/.config/nvim/plugins/vim-test.vim
" source ~/.config/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded

" Can't be in source file cause of order of loading
colorscheme gruvbox-material
filetype plugin on

if executable('rg')
    let g:rg_derive_root='true'
endif

lua require("taloud")
