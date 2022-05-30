" Install vim-plug plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox'      " Gruvbox theme
Plug 'tpope/vim-sensible'   " Set sensible defaults
Plug 'sheerun/vim-polyglot' " Language pack collection
call plug#end()

set relativenumber
set number
set showcmd

" Set gruvbox theme
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
	let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
	let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" Automatically enter paste mode when pasting from clipboard
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
