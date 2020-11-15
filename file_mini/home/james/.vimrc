" ===========================
" ========= Keymap ==========
" ===========================

" 双逗号当<ESC>
inoremap ,, <ESC>

" let mapleader = ";"

" 映射上下左右的光标移动
" 上下左右(ikhl)
" 屏内首行末行(IK)
" 插入a前f后，A行首F行末
" J合并行 L帮助
" h-H行内前-后方向查找
map i <Up>
map j <Left>
map k <Down>
noremap h f
noremap f a
noremap a i

noremap H F
noremap F A
noremap A I
noremap I H
noremap K L
noremap L K

" ===========================
" ========Appearence=========
" ===========================
set rnu
set nu
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set hlsearch
" ===========================
" =========Spelling==========
" ===========================
" setlocal spell
" set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" ===========================
" ======== Plug-ins =========
" ===========================

call plug#begin()
Plug 'lervag/vimtex'
 let g:tex_flavor='xelatex'
 let g:vimtex_view_method='zathura'
 let g:vimtex_quickfix_mode=0
 set conceallevel=1
 let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
 let g:UltiSnipsExpandTrigger = '<tab>'
 let g:UltiSnipsJumpForwardTrigger = '<tab>'
 let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'honza/vim-snippets'
Plug 'suan/vim-instant-markdown'
call plug#end()

