" vim:sw=3:
set nocompatible

if has("syntax")
  syntax on
endif
filetype plugin on
filetype indent on

" Read indenting from current file, for adding lines
set autoindent
" For putting new lines
set smartindent

"Different colo scheme for cmnd line and GUI
if has("gui_running")
   colo vividchalk
   set guifont=DejaVu\ Sans\ Mono\ 11
   "Turn off blinking of cursor
   set guicursor+=a:blinkon0
   set guioptions-=T
else
   colo desert256
endif

"Spaces for TAB and '>', '<'
"For real TAB use C-V TAB
set expandtab

"I want a real tab :)
set tabstop=8

"Set numbering
set number

"set textwidth=78

"""" STATUS LINE """"
if has('statusline')
   set statusline=%o\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [Byte=%03b\ hex=%03B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
   set laststatus=2
endif

" COMMANDS
imap <silent> <C-s> <ESC>:if &keymap =~ 'serbian' <Bar>
                    \set keymap= <Bar>
                \else <Bar>
                    \set keymap=serbian <Bar>
                \endif <Enter>a

"""" FOLDING """"
"Set folding
if has('folding')
   set foldmethod=indent
   set foldlevelstart=99
endif
" Fold current field
map <C-x> <ESC>zC
"Unfold it
map <SPACE> <ESC>zO

"set highlight search and incremental
set hls is
nmap <C-n> <ESC>:noh<Enter>

"""" PLUGINS OPTIONS """"

"VSTreeExplore normal mode Ctrl-F
nmap <C-f> <ESC>:NERDTreeToggle<Enter>

" Tag list
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_Menu = 1
"let Tlist_Sort_Type = 'name'
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 50
nmap <C-a> <ESC>:TlistToggle<Enter>

