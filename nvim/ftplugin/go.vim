setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

function! s:golang_fmt()
  exec ":!go fmt " . expand("%")
endfunction

if executable('go')
  augroup go_format
    autocmd!
    autocmd BufWritePost,FileWritePost,FileAppendPost *.go call s:golang_fmt()
    " autocmd BufWrite,FileWritePre,FileAppendPre *.go checktime
  augroup END
endif
