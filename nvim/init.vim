lua require("plugins")
lua require("treesitter")
lua require("keys")

set ts=2 sw=2

nnoremap <leader>e <cmd>TroubleToggle<cr>
nnoremap <C-t> :Neotree toggle<CR>
nnoremap <leader>bd :bd<CR>

filetype plugin indent on

syntax enable

let g:vimtex_view_method = 'zathura'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

let g:vimtex_compiler_method = 'latexmk'

let maplocalleader = ","

let g:airline_extensions = ['ale', 'branch', 'vimtex']
let g:airline_theme = "onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_right_sep = ""
let g:airline_left_sep = ""
