" operator-ankicloze - Operator to surround text for Anki cloze deletion.
" Version: 0.0.1
" Copyright (C) 2016 id:ampmmn <https://github.com/ampmmn>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('g:loaded_operator_ankicloze')
  finish
endif

call operator#user#define('ankicloze1', 'operator#ankicloze#do', 'call operator#ankicloze#setno(1)')
call operator#user#define('ankicloze2', 'operator#ankicloze#do', 'call operator#ankicloze#setno(2)')
call operator#user#define('ankicloze3', 'operator#ankicloze#do', 'call operator#ankicloze#setno(3)')
call operator#user#define('ankicloze4', 'operator#ankicloze#do', 'call operator#ankicloze#setno(4)')
call operator#user#define('ankicloze5', 'operator#ankicloze#do', 'call operator#ankicloze#setno(5)')

let g:loaded_operator_ankicloze = 1

" vim: ts=4 sts=4 sw=4 noet foldmethod=marker
