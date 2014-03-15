if !exists('g:kato_command')
	let g:kato_command = 'kato'
endif

function! s:kato(line1, line2, ...)
	let renderer = &filetype == 'markdown' ? 'markdown' : 'code'
	execute a:line1.', '.a:line2.'write !'.g:kato_command.' -f '.renderer
endfunction

command! -range=% -nargs=* Kato call s:kato(<line1>, <line2>, <q-args>)
