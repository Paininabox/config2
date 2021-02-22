"start of vundle information
set nocompatible
filetype on
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'zhou13/vim-easyescape'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-pencil'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-surround'
Plugin 'reedes/vim-litecorrect'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'preservim/nerdcommenter'
Plugin 'vimwiki/vimwiki'

call vundle#end()
filetype plugin indent on
"end of vundle information, keep this on top

au BufRead,BufNewFile *.md set filetype=md

set hlsearch
set undodir=~/.vim
set undofile
set laststatus=2
set clipboard+=unnamed
set scrolloff=3
set textwidth=200
set linebreak
set nolist
set linespace=2
set scrolloff=0

"start goyo and pencil at the beginning
"augroup pencil
"	autocmd VimEnter * SoftPencil
"	autocmd VimEnter * Goyo
"autocmd Filetype markdown Goyo | SoftPencil
"augroup END

autocmd FileType md source ~/.vim/ftplugin/md.vim

"navigate splits better
" Use ctrl-[helect the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"easymotion plugin stuff
map <Space> <Plug>(easymotion-bd-w)
let g:EasyMotion_keys =  'alskdjfhgpqowieurtyzmxncbv'

"make quotes great again
"let g:textobj#quote#educate = 1
"map <silent> <leader>qc <Plug>ReplaceWithCurly


"Limelight config
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
let g:goyo_width = 135
let g:goyo_height = 80


autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:easyescape_chars = { "j": 1, "k": 1}
let g:easyescape_timeout = 150
cnoremap jk <ESC>
cnoremap kj <ESC> 


"testing prose settings
set formatoptions=a2tqw
"options mean: a sets text to wrap when it reahes textwidth, w defines paragraphs as separated by blank line, t sets text to format to text width and q lets gq reformat text

"pathogen stuff
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

"solarized colorscheme
syntax enable
colorscheme solarized
set t_Co=256
filetype plugin on
