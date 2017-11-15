" Highlight SQL blocks within python code.
syntax on
let s:current_syntax = b:current_syntax
unlet b:current_syntax

syntax include @PYTHON syntax/python.vim
unlet b:current_syntax

syntax include @SQL syntax/sql.vim

syntax region sqlWith   start=/\C^\s*WITH/   end=/"""/ containedin=@PYTHON contains=@SQL
syntax region sqlSelect start=/\C^\s*SELECT/ end=/"""/ containedin=@PYTHON contains=@SQL
syntax region sqlDelete start=/\C^\s*DELETE/ end=/"""/ containedin=@PYTHON contains=@SQL
syntax region sqlInsert start=/\C^\s*INSERT/ end=/"""/ containedin=@PYTHON contains=@SQL
syntax region sqlCreate start=/\C^\s*CREATE/ end=/"""/ containedin=@PYTHON contains=@SQL
syntax region sqlDrop   start=/\C^\s*DROP/ end=/"""/ containedin=@PYTHON contains=@SQL

let b:current_syntax = s:current_syntax
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=233 guibg=#121212
endif
syntax sync fromstart
