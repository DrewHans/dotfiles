colorscheme darkblue

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

func! TurnSpellCheckOn()
  setlocal spell spelllang=en_us
endfu

com! SC call TurnSpellCheckOn()


