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

call plug#begin('~/.vim/plugged')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/harpoon.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/peekaboo.vim " a degager peut etre
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/rooter.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/tmux.vim
source ~/.config/nvim/plugins/vim-test.vim
" source ~/.config/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded

if (has("termguicolors"))
  set termguicolors
endif

" Can't be in source file cause of order of loading
colorscheme gruvbox-material
filetype plugin on

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

lua require("groot")

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = " "

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Make Y behave like the other capitals
nnoremap Y y$

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <silent> <C-f> : silent !tmux neww tmux-sessionizer<CR>

nnoremap <leader>by :Format<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep the search centered in the screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nmap <leader>Q :bufdo bdelete<cr>

" Quick fix list up and down
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz

inoremap <C-c> <esc>

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------
command Ggfl :Gpush --force-with-lease

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" ES
com! W w

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    " autocmd VimEnter * :VimApm
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
