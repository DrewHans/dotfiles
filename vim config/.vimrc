" set vim colors
set background=dark
colorscheme darkblue

set cursorline " highlight current line
set encoding=utf-8 " set the encoding displayed in terminal
set expandtab " convert tabs to spaces
set fileencoding=utf-8 " set the encoding written to file
set mouse=a " enable mouse in all modes
set number " show line numbers
set ruler " show the cursor position
set shiftwidth=4 " make indentations width 4 spaces wide
set showmode " show the current mode
set softtabstop=4 " while editing files, make new tabs as wide as 4 spaces
set tabstop=4 " when viewing files, make existing tabs as wide as 4 spaces
set title " show the filename in the window titlebar
syntax on " enable syntax highlighting

" custom function to turn spellcheck on/off
func! TurnSpellCheckOn()
  setlocal spell spelllang=en_us
endfu
com! SC call TurnSpellCheckOn() " toggle spellcheck on/off with :SC command

" turns off expandtab (which converts tabs to spaces) ONLY for make files
autocmd FileType make setlocal noexpandtab 
