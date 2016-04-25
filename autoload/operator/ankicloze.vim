" operator-ankicloze - Operator to surround text for Anki cloze deletion.
" Version: 0.0.2
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

let s:clozeNo=1

function! operator#ankicloze#do(motion_wise)

	normal! `[
	let spos = getpos(".")
	normal! `]
	let epos = getpos(".")

	if spos[2] > epos[2] || (spos[2] == epos[2] && spos[1] > epos[1])
		let tmppos = spos
		let spos = epos
		let epos = tmppos
	endif

	if a:motion_wise ==# 'char'
		call s:insert_cloze_tag(spos, epos, s:clozeNo)
	elseif a:motion_wise ==# 'line'
		normal! $
		let epos = getpos(".")
		call s:insert_cloze_tag(spos, epos, s:clozeNo)
	elseif a:motion_wise ==# 'block'
		let sline = spos[1] < epos[1] ? spos[1] : epos[1]
		let eline = spos[1] >=epos[1] ? spos[1] : epos[1]
		let scol = spos[2] < epos[2] ? spos[2] : epos[2]
		let ecol = spos[2] >=epos[2] ? spos[2] : epos[2]

		while sline <= eline
			call s:insert_cloze_tag([0, sline, scol, 0], [0, sline, ecol, 0], s:clozeNo)
			let sline += 1
		endwhile
	endif
endfunction

function! operator#ankicloze#setno(no)
	let s:clozeNo = a:no
endfunction


function! s:insert_cloze_tag(spos, epos, no)
	call setpos(".", a:epos)
	normal! a}}
	call setpos(".", a:spos)
	execute "normal! i{{c" . a:no . "::"
	normal! f}
endfunction

" vim: ts=4 sts=4 sw=4 noet foldmethod=marker
