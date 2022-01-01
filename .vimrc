"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"

" git commit 時にはプラグインは読み込まない
if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
  finish
end

" Vundle config
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

Plugin 'drmikehenry/vim-headerguard'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/vim-goimports'

call vundle#end()
filetype plugin indent on

" color
colorscheme iceberg

" vim-devicons config
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" vim-airline config
let g:airline_theme = 'iceberg'

" vim-goimports
let g:goimports = 1

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
	autocmd FileType c,h setl noexpandtab tabstop=4 shiftwidth=4
	autocmd FileType cpp,hpp setl expandtab tabstop=2 shiftwidth=2
	autocmd FileType js,ts setl expandtab tabstop=2 shiftwidth=2
	autocmd FileType go setl noexpandtab tabstop=2 shiftwidth=2
	autocmd FileType rust,php setl expandtab tabstop=4 shiftwidth=4
augroup END

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
set colorcolumn=80
set expandtab
