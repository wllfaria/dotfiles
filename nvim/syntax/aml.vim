" Language: AML
" Maintainer: Togglebit

if exists("b:current_syntax")
    finish
endif

" Todo
syn match tinyComment "\/\/.*$" contains=tinyTodo
syn keyword tinyTodo TODO HACK NOTE contained

" Attributes
syn region tinyAttributes start="\["hs=s+1 end="\]"he=s-1 contains=tinyAttribute,tinyValue,tinyString,tinyData
syn match tinyAttribute "\(\w\|-\)\+:"me=e-1 contained
syn match tinyValue ":\s*\(\w\|-\||\)\+"hs=s+1 contained

" Element
syn match tinyElement "^\s*\w\+\s*"he=e contains=TOP

" Component
syn match tinyComponent "^\s*@\w\+\s*"he=e contains=TOP

" String
syn region tinyString start='"' end='"' contains=tinyData

" Variables
syn region tinyAssocEvents start='(' end=')'

let b:current_syntax = "aml"

hi def link tinyElement         Statement
hi def link tinyComponent       Identifier
hi def link tinyValue           Constant
hi def link tinyAttribute       Identifier
hi def link tinyString          String
hi def link tinyTodo            Todo
hi def link tinyComment         Comment
hi def link tinyAssocEvents     Special
