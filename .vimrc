"        _                    
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|
"

" Vundle config
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'cocopon/iceberg.vim'
Plugin 'mattn/emmet-vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'drmikehenry/vim-headerguard'

call vundle#end()            
filetype plugin indent on

" etc config
language en_US.utf-8
syntax enable
set number
set cursorline
set smartindent
set showmatch
set laststatus=2
set list listchars=tab:\▸\-,space:\·
set tabstop=2
set shiftwidth=2
set shiftround
set encoding=UTF-8
set backspace=2
set mouse=a
set hidden
set background=dark

" git commit 時にはプラグインは読み込まない
if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
  finish
end

" folding
" set foldmethod=indent
" set foldlevel=2
" set foldcolumn=3

" color
colorscheme iceberg

" vim-devicons config
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" vim-airline config
let g:airline_theme = 'iceberg'

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <F2> :HeaderguardAdd<CR>
nnoremap <F12> :LspDefinition<CR>
nnoremap <S-F12> :LspDeclaration<CR>
nnoremap gd :LspDefinition<CR>

" indent
filetype on
augroup vimrc
	autocmd!
	autocmd FileType c,cpp setl cindent
	autocmd FileType c setl tabstop=4 shiftwidth=4
	autocmd FileType cpp setl expandtab tabstop=2 shiftwidth=2
augroup END
