" Name: minimalistic.vim
" Version: 0.1
" Maintainer: github.com/koin612
" License: The MIT License (MIT)
"
" Colors based on https://github.com/8bitslime/Minimalistic-vscode
" Structure based on https://github.com/andreypopp/vim-colors-plain

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name="minimalistic"

let s:fg        = { "gui": "#cccccc", "cterm": "252" }
let s:bg        = { "gui": "#1d1d1d", "cterm": "234" }
let s:constant  = { "gui": "#aaaadd", "cterm": "146" }
let s:comment   = { "gui": "#66aa66", "cterm": "71" }
let s:statement = { "gui": "#999999", "cterm": "247" }
let s:error     = { "gui": "#ee3322", "cterm": "202" }
let s:warning   = { "gui": "#f3e430", "cterm": "11" }

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

hi ColorColumn     guibg=#333333
hi MatchParen      guibg=#3c3c3c guifg=#cccccc

hi Visual          guifg=#cccccc guibg=#3c3c3c
hi! link Search    Visual
hi! link IncSearch Visual

hi VertSplit       guifg=#333333
hi PreProc         guifg=#7777aa
hi! link Define    PreProc
hi! link Macro     PreProc
hi! link PreCondit PreProc
hi! link Include   PreProc

" __Normal__
call s:h("Normal", { "fg": s:fg, "bg": s:bg })
call s:h("Cursor", { "fg": s:bg, "bg": s:fg })
hi! link Identifier       Normal
hi! link Type             Normal

" __Operator__
call s:h("Noise", { "fg": s:statement, "gui": "NONE" })
hi! link Operator   Noise
hi LineNr           guifg=#444444
hi CursorLineNr     guifg=#aaaaaa
hi! link FoldColumn LineNr
hi! link SignColumn LineNr

" __Comment__
call s:h("Comment", { "fg": s:comment })
hi! link SpecialComment Comment

" __Constant__
call s:h("Constant", { "fg": s:constant })
hi! link SpecialChar      Constant
hi! link Character        Constant
hi! link Number           Constant
hi! link Float            Constant
hi! link String           Constant
hi! link Directory        Constant
hi! link Title            Constant
hi! link Tag              Constant
hi! link Debug            Constant

" __Statement__
call s:h("Statement", { "fg": s:statement })
hi! link Function         Statement
hi! link Special          Statement
hi! link Delimiter        Statement
hi! link StorageClass     Function
hi! link Structure        Function
hi! link Typedef          Function
hi! link Boolean          Statement
hi! link Keyword          Statement
hi! link Conditional      Keyword
hi! link Repeat           Keyword
hi! link Label            Keyword
hi! link Exception        Statement

" __ErrorMsg__
call s:h("ErrorMsg", { "fg": s:error })
hi! link Error    ErrorMsg
hi! link Question ErrorMsg

" __WarningMsg__
call s:h("WarningMsg",    {"fg": s:warning})

" __StatusLine__
call s:h("StatusLine", { "gui": "underline", "bg": s:bg, "fg": s:statement })
call s:h("WildMenu",   { "gui": "underline", "bg": s:bg, "fg": s:statement })
