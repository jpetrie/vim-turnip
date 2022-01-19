" turnip.vim - by Josh Petrie
" https://github.com/jpetrie/vim-turnip

" Setup
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'turnip'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette
let s:colors = {}
let s:colors.dirt = ['816160', 95]
let s:colors.blue = ['000080', 18]
let s:colors.paleBlue = ['5f5fab', 61]
let s:colors.mutedPurple = ['816185', 96]
let s:colors.deepPurple = ['7b165d', 89]
let s:colors.goldYellow = ['a9892c', 136]
let s:colors.paleYellow = ['d7d791', 186]
let s:colors.leafGreen = ['688663', 65]
let s:colors.seaGreen = ['275d16', 22]
let s:colors.richRed = ['a02016', 124]
let s:colors.burntOrange = ['c86627', 166]
let s:colors.chalk = ['b2b2b2', 249]
let s:colors.slate = ['1c1c1c', 234]

let s:colors.white = ['ffffff', 231]
let s:colors.lightestGray = ['eeeeee', 255]
let s:colors.lighterGray = ['c6c6c6', 251]
let s:colors.lightGray = ['a7a7a7', 248]
let s:colors.middleGray = ['8a8a8a', 245]
let s:colors.darkGray = ['6c6c6c', 242]
let s:colors.darkerGray = ['303030', 236]
let s:colors.darkestGray = ['262626', 235]
let s:colors.black = ['000000', 16]

function! s:hi(group, fg, ...)
  let command = 'hi ' . a:group . ' '

  if strlen(a:fg) > 0
    if a:fg == '@fg'
      let command .= 'guifg=fg ctermfg=fg '
    else
      let value = get(s:colors, a:fg)
      let command .= 'guifg=#' . value[0] . ' ctermfg=' . value[1] . ' '
    endif
  endif

  if a:0 >= 1 && strlen(a:1) > 0
    if a:1 == '@bg'
      let command .= 'guibg=bg ctermbg=bg '
    else
      let value = get(s:colors, a:1)
      let command .= 'guibg=#' . value[0] . ' ctermbg=' . value[1] . ' '
    endif
  endif

  if a:0 >= 2 && strlen(a:2) > 0
    let command .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
  endif

  execute command
endfunction

" Core Theme
if &background == 'light'
  call s:hi('Normal', 'black', 'white')
  call s:hi('Cursor', 'white', 'darkGray')
  call s:hi('Special', 'mutedPurple')

  call s:hi('StatusLine', 'darkGray', 'lighterGray', 'bold')
  call s:hi('StatusLineNC', 'darkGray', 'lighterGray', 'none')
  call s:hi('VertSplit', 'lighterGray', 'lighterGray', 'none')
  call s:hi('EndOfBuffer', 'white', 'white')
  call s:hi('ErrorMsg', 'richRed', 'white')
  call s:hi('WarningMsg', 'burntOrange', 'white')
  call s:hi('ModeMsg', 'darkGray', 'white')
  call s:hi('MoreMsg', 'seaGreen', 'white')
  call s:hi('Question', 'leafGreen', 'white')

  call s:hi('Search', 'black', 'paleYellow', '')
  call s:hi('IncSearch', 'black', 'goldYellow', 'bold')
  call s:hi('MatchParen', 'black', 'paleYellow', 'none')
  call s:hi('WildMenu', 'black', 'goldYellow')

  call s:hi('ColorColumn', '', 'lightestGray')
  call s:hi('CursorLine', '', 'lightestGray')
  call s:hi('CursorLineNr', 'lightGray', '', 'bold')
  call s:hi('LineNr', 'lightGray')
  call s:hi('LineNrAbove', 'lightGray')
  call s:hi('LineNrBelow', 'lightGray')
  call s:hi('NonText', 'lightestGray')
  call s:hi('SpecialKey', 'lightestGray')

  call s:hi('Comment', 'leafGreen')
  call s:hi('SpecialComment', 'leafGreen')
  call s:hi('Type', 'deepPurple', '', 'none')
  call s:hi('Statement', 'deepPurple', '', 'bold')
  call s:hi('Constant', 'blue')
  call s:hi('PreProc', 'dirt')
  call s:hi('Identifier', 'mutedPurple')

  call s:hi('Todo', 'seaGreen', 'white', 'bold')
  call s:hi('Title', 'deepPurple', 'white', 'bold')
  call s:hi('Directory', 'dirt')
else
  call s:hi('Normal', 'chalk', 'slate')
  call s:hi('Cursor', 'slate', 'lightGray')
  call s:hi('Special', 'mutedPurple')

  call s:hi('StatusLine', 'middleGray', 'darkerGray', 'bold')
  call s:hi('StatusLineNC', 'middleGray', 'darkerGray', 'none')
  call s:hi('VertSplit', 'darkerGray', 'darkerGray', 'none')
  call s:hi('EndOfBuffer', 'slate', 'slate')
  call s:hi('ErrorMsg', 'richRed', 'slate', 'bold')
  call s:hi('WarningMsg', 'burntOrange', 'slate', 'bold')
  call s:hi('ModeMsg', 'lightGray', 'slate')
  call s:hi('MoreMsg', 'seaGreen', 'slate')
  call s:hi('Question', 'leafGreen', 'slate')

  call s:hi('Search', 'slate', 'darkGray', 'none')
  call s:hi('IncSearch', 'slate', 'goldYellow', 'bold')
  call s:hi('MatchParen', 'slate', 'paleYellow', 'none')
  call s:hi('WildMenu', 'slate', 'goldYellow')

  call s:hi('ColorColumn', '', 'darkestGray')
  call s:hi('CursorLine', '', 'darkestGray')
  call s:hi('CursorLineNr', 'darkGray', '', 'bold')
  call s:hi('LineNr', 'darkGray')
  call s:hi('LineNrAbove', 'darkGray')
  call s:hi('LineNrBelow', 'darkGray')
  call s:hi('NonText', 'darkestGray')
  call s:hi('SpecialKey', 'darkestGray')

  call s:hi('Comment', 'leafGreen')
  call s:hi('SpecialComment', 'leafGreen')
  call s:hi('Type', 'deepPurple', '', 'none')
  call s:hi('Statement', 'deepPurple', '', 'bold')
  call s:hi('Constant', 'paleBlue')
  call s:hi('PreProc', 'dirt')
  call s:hi('Identifier', 'mutedPurple')

  call s:hi('Todo', 'seaGreen', 'slate', 'bold')
  call s:hi('Title', 'deepPurple', 'slate', 'bold')
  call s:hi('Directory', 'dirt')
endif

" C and C++
hi link cIncluded PreProc

" CMake
hi link cmakeKWExternalProject Identifier
hi link cmakeKWfind_package cmakeKWExternalProject
hi link cmakeKWfind_program cmakeKWExternalProject
hi link cmakeKWset cmakeKWExternalProject
hi link cmakeKWunset cmakeKWExternalProject
hi link cmakeKWset_property cmakeKWExternalProject
hi link cmakeKWproject cmakeKWExternalProject
hi link cmakeGeneratorExpressions cmakeKWExternalProject

" Markdown
call s:hi('markdownBold', '', '', 'bold')
call s:hi('markdownItalic', '', '', 'italic')

" Vim
hi link vimCommentTitle Comment
hi link vimNotation Constant
hi link vimOption Type
