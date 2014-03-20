if !exists('g:kato_command')
	let g:kato_command = 'kato'
endif

if !executable(g:kato_command)
	finish
endif

function! s:kato(line1, line2, args)
	let renderer = &filetype == 'markdown' ? 'markdown' : 'code'
	execute a:line1.', '.a:line2.'write !'.g:kato_command.' -f '.renderer.' '.a:args
endfunction

command! -range -nargs=* Kato call s:kato(<line1>, <line2>, "<args>")
