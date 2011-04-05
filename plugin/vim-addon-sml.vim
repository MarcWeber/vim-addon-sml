" note: for Linux use beta version. The 3.6 has a broken exit code!

" this error format is good enough for me
"
"Coq < 
let s:efm = 'set efm=%f:%l.%c%m'

" smlnj
call actions#AddAction('run smlnj', {'action': funcref#Function('actions#CompileRHSSimple', {'args': [[s:efm], ["sml", funcref#Function('return expand("%")')]]})})
call actions#AddAction('run heap sml @SMLload', {'action': funcref#Function('actions#CompileRHSSimple', {'args': [[s:efm], ["sml", funcref#Function('return "@SMLload=".actions#AskFile(".86-linux heap file:", ["*.x86-linux"])')]]})})
call actions#AddAction('run ml-build', {'action': funcref#Function('actions#CompileRHSSimple', {'args': [[s:efm], ["ml-build", funcref#Function('return actions#AskFile(".cm file:", ["*.cm"])')]]})})

"mlton
let s:efm_mlton = 'set efm=Error:\ %f\ %l.%c.'
call actions#AddAction('run mlton', {'action': funcref#Function('actions#CompileRHSSimple', {'args': [[s:efm_mlton], ["mlton", funcref#Function('return actions#AskFile(".cm file:", ["*.sml"])')]]})})


" toggle .sig <-> .sml
exec vam#DefineAndBind('s:l','g:vim_addon_toggle_buffer','{}')
let s:l['sml_sml'] = funcref#Function('return vim_addon_toggle#Substitute('.string('\.sml').','.string('.sig').')')
let s:l['sml_sig'] = funcref#Function('return vim_addon_toggle#Substitute('.string('\.sig').','.string('.sml').')')

" default for sig is lprolog
augroup VIM_ADDON_SML
  autocmd BufRead,BufNewFile *.sig  setlocal ft=sml
  autocmd BufRead,BufNewFile *.cm  setlocal ft=compilation_manager
augroup end
