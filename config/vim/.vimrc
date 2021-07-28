" set vim to use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " For Neovim 0.1.3 and 0.1.4
  endif
  if (has("termguicolors"))
    set termguicolors " For Neovim > 0.1.5 and Vim > patch 7.4.1799
  endif
endif

" set vim colors
set background=dark " for the dark version
syntax on " enable syntax highlighting

" set vim behavior
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
set laststatus=2 " show status bar at the bottom
autocmd FileType make setlocal noexpandtab " turn off expandtab ONLY for make files

" set vim functions
func! TurnSpellCheckOn()
  setlocal spell spelllang=en_us
endfu

" set vim commands
com! SC call TurnSpellCheckOn() " toggle spellcheck on/off with :SC command
