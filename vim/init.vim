" -------------
" Common
" -------------
set encoding=utf-8
set number
set splitbelow
set splitright
set wildmenu
set nowrap

set ruler
set cursorline


" -------------
" Tab
" -------------
set expandtab
set tabstop=4
set shiftwidth=2


" -------------
" DeinVim
" -------------
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/ib/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/ib/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/ib/.vim/dein/repos/github.com/Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('lambdalisue/fern.vim')
call dein#add('lambdalisue/nerdfont.vim')
call dein#add('lambdalisue/glyph-palette.vim')
call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
call dein#add('dracula/vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


" -------------
" Key Config
" -------------
nnoremap <silent>sf :Fern .<CR>
nnoremap <silent>ssg :Denite grep<CR>
nnoremap <silent>ssf :Denite -start-filter file/rec<CR>
inoremap <silent><C-j> <ESC>


" -------------
" Design
" -------------
" NerdFont
let g:fern#renderer = 'nerdfont'
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

set t_Co=256
colorscheme dracula


" -------------
" Denite
" -------------
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  " エンターキー: 垂直分割でファイルを開く
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action', 'vsplit')
  " スペースキー: 水平分割でファイルを開く
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('do_action', 'split')
  " エスケープキー: 終了
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  " Qキー: 終了
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  " Iキー: フィルター入力の開始
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  " Aキー: フィルター入力の開始
  nnoremap <silent><buffer><expr> a
  \ denite#do_map('open_filter_buffer')
endfunction

" Change file/rec command 
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
" Ripgrep command on grep source
call denite#custom#var('grep', {
           \ 'command': ['rg'],
           \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
           \ 'recursive_opts': [],
           \ 'pattern_opt': ['--regexp'],
           \ 'separator': ['--'],
           \ 'final_opts': [],
           \ })

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ })


