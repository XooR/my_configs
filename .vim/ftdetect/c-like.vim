if has("autocmd")
  autocmd FileType java,jflex setlocal omnifunc=javacomplete#Complete
"  autocmd FileType java setlocal omnifunc=javacomplete#CompleteParamsInfo
  autocmd FileType java,jflex setlocal sw=4
  autocmd FileType java,jflex setlocal cindent
  autocmd FileType java,jflex setlocal tabstop=8
  autocmd FileType java,jflex setlocal softtabstop=4
  autocmd FileType java,jflex setlocal expandtab
  autocmd FileType java,jflex setlocal cindent

  autocmd FileType c,cpp,h setlocal sw=3
  autocmd FileType c,cpp,h setlocal cindent

  autocmd FileType pl setlocal shiftwidth=4
  autocmd FileType pl setlocal cindent
  autocmd FileType pl setlocal tabstop=8
  autocmd FileType pl setlocal softtabstop=4
  autocmd FileType pl setlocal expandtab
endif
