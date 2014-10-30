set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/ZoomWin'
Plugin 'rodjek/vim-puppet'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'mbbill/undotree'

filetype plugin indent on

autocmd FileType puppet autocmd BufWritePre <buffer> :%s/\s\+$//e

let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1

" neocomplcache keybindings
let g:neocomplcache_enable_at_startup = 1

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

set number
syntax enable
syn on

" Dark colored theme
" set background=dark
colorscheme molokai

" Light colored theme
" set background=light
" colorscheme lucius

let g:gitgutter_enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1


" source /Library/Python/2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_theme="short"
" let g:Powerline_colorscheme="solarized256"
" let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set ttimeoutlen=50

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif
