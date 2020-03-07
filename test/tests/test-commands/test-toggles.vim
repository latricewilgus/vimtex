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

function! Test(keys, context, expected) abort " {{{1
  normal! gg0dG
  call append(1, a:context)
  normal! ggdd

  silent execute 'normal' a:keys

  echo printf(" %20s | %20s | %20s | %4s\n",
        \ a:context[0], getline(1), a:expected[0],
        \ getline(1) ==# a:expected[0] ? 'OK' : 'FAIL')
endfunction

" }}}1

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
  call Test('3ltsf', [s:in], [s:out])
endfor

quit!
