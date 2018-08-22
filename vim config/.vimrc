" set vim colors
set background=dark
colorscheme darkblue

" highlight current line
set cursorline

" convert tabs to spaces
set expandtab

" enable mouse in all modes
set mouse=a

" enable line numbers
set number

" show the cursor position
set ruler

" make indentations width 4 spaces wide
set shiftwidth=4

" show the current mode
set showmode

" make tabs as wide as 4 spaces while performing editing operations
set softtabstop=4

" make tabs as wide as 4 spaces
set tabstop=4

" show the filename in the window titlebar
set title

" enable syntax highlighting
syntax on

" create custom command to turn spellcheck on/off
func! TurnSpellCheckOn()
  setlocal spell spelllang=en_us
endfu
com! SC call TurnSpellCheckOn()

" turns off expandtab (which converts tabs to spaces) ONLY for make files
autocmd FileType make setlocal noexpandtab 
