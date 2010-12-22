" note: for Linux use beta version. The 3.6 has a broken exit code!

" this error format is good enough for me
"
"Coq < 
let s:efm = 'set efm=%f:%l.%c%m'
call actions#AddAction('run smlnj', {'action': funcref#Function('actions#CompileRHSSimple', {'args': [[s:efm], ["sml", funcref#Function('return expand("%")')]]})})
call actions#AddAction('run ml-build', {'action': funcref#Function('actions#CompileRHSSimple', {'args': [[s:efm], ["ml-build", funcref#Function('return actions#AskFile(".cm file:", ["*.cm"])')]]})})


" toggle .sig <-> .sml
exec scriptmanager#DefineAndBind('s:l','g:vim_addon_toggle_buffer','{}')
let s:l['sml_sml'] = funcref#Function('return vim_addon_toggle#Substitute('.string('\.sml').','.string('.sig').')')
let s:l['sml_sig'] = funcref#Function('return vim_addon_toggle#Substitute('.string('\.sig').','.string('.sml').')')
