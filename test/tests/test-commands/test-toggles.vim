set nocompatible
let &rtp = '../../..,' . &rtp
filetype plugin on
syntax on

set nomore
set autoindent

setfiletype tex

" tsd  /  Toggle surrounding delimiter
call vimtex#test#keys('3jtsd', [
      \ '$\bigl(\begin{smallmatrix}',
      \ '  \Q^* &   \\',
      \ '       & 1 \\',
      \ '\end{smallmatrix}\bigr)$',
      \], [
      \ '$(\begin{smallmatrix}',
      \ '  \Q^* &   \\',
      \ '       & 1 \\',
      \ '\end{smallmatrix})$',
      \])

" tsd  /  Toggle surrounding fraction
for [s:in, s:out] in [
      \ ['$\frac{x+1}{x-1}$', '$(x+1)/(x-1)$'],
      \ ['$\frac {x+1}  {x-1}$', '$(x+1)/(x-1)$'],
      \ ['$\frac {x-1} x$', '$(x-1)/x$'],
      \ ['$\frac x  {x-1}$', '$x/(x-1)$'],
      \ ['$x / (x-1)$', '$\frac x {x-1}$'],
      \ ['$(x-1) /x$', '$\frac {x-1} x$'],
      \ ['$(x+1)  /(x-1)$', '$\frac{x+1}{x-1}$'],
      \ ['$(x+1)/ (x-1)$', '$\frac{x+1}{x-1}$'],
      \]
  call vimtex#test#keys('3ltsf', [s:in], [s:out])
endfor

quit!
