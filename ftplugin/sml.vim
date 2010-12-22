if exists("loaded_matchit")
    let b:match_ignorecase=0
    let old = exists('b:match_words') ? b:match_words.',' : ''

     " 1) struct .. end
     " 2) let .. in .. end
     " 3) sig .. end
     " 3) local .. end
     " TODO
     let b:match_words =
     \  '\<\%(let\|local\|struct\|sig\)\>:\<in\>:\<end\>'

     " jump to next functions
     let b:match_words .=
     \  ',^\<fun\>:^\<and\|fun\|val\>:DOES_NOT_EXIST'

     " () [] {} <>
     " why do I have to add them ? Shouldn't they be default?
     let b:match_words .=
     \  ',(:),\[:\],{:},<:>'
endif
