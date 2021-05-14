# Return filename path
#
function filepath {          # What is the path on a filename?
    local FP
    local FL="$1"            # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
    FP=${FL%/*}              # rrr/sss/ttt.uuu
    if [ "$FP" = "$FL" ]     # If path is missing
    then 
        FP="$PWD"               #   set path to .
    fi
    builtin printf "%s" "$FP" # Return the path
    return $EX_OK           # Set return code.
} # filepath
