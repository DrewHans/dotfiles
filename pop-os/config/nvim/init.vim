" set nvim colors
set t_Co=256 " support 256 colors
set background=dark " protects your eyes from burning

" set nvim behavior
syntax enable " enables syntax highlightning
set nowrap " display long lines as just one line
set encoding=utf-8 " the encoding displayed on screen
set fileencoding=utf-8 " the encoding written to file
set ruler " show the cursor position all the time
set cmdheight=2 " more space for displaying messages
set mouse " enable the mouse
set conceallevel=0 " allows me to see `` in markdown files
set tabstop=2 " the number of spaces inserted on tab
set shiftwidth=2 " the number of spaces inserted for indentation
set smarttab " intelligent tabbing, RTFM
set expandtab " convert tabs to spaces
set smartindent "intelligent indenting, RTFM
set autoindent " auto indent on next line when appropriate
set laststatus=0 " display the status line
set number " display line numbers
set cursorline " highlight the current line
set showtabline=2 " always show tabs
set clipboard=unnamedplus " allow copy paste outside of nvim

" custom behavior settings
autocmd FileType make setlocal noexpandtab " turn off expandtab for make files