execute pathogen#infect()
filetype plugin indent on
syntax on
" colorscheme koelher
colorscheme zellner
set softtabstop=2 shiftwidth=2 expandtab
set nowrap
let mapleader = "-"

" Normal Mode Mappings
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>hh a# <esc>70a-<esc>0  R
nnoremap <leader>hl :set hlsearch!<CR>
nnoremap <leader>sb {V}
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>c :%y*<CR>
nnoremap <leader>v ggdG"*P

" Insert Mode Mappings
inoremap kj <esc>
" inoremap <esc> <nop>
iabbrev >>> %>%

" Nvim-R parameters
let maplocalleader = "\\"
let R_assign = 2
" let R_in_buffer = 0

" ip fix from Jackson
"let $NVIM_IP_ADDRESS = split(system("ifconfig | grep -C 1 wlan0 | tail -n 1 | sed -e 's/^ *inet \\(.*\\) netmask.*/\\1/'"), "\n")[0]
"let R_app = "sshR"

" Settings for Syntastic
" let g:syntastic_enable_r_lintr_checker = 1
" let g:syntastic_r_checkers = ['lintr']
" let g:syntastic_r_lintr_linters = "with_defaults(line_length_linter(90))"
" 
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" KEEP AT END OF VIMRC
" Run a local vimrc if it exists
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
