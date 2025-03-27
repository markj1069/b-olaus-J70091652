# Return simple filename w/o path
#
function filename () {       # What is the filename?
    local FN
    local FL="$1"            # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
    FN=${FL##*/}             # vvv_www.yyy.zzz
    builtin printf "%s" "$FN" # Return the filename.
    return $EX_OK            # Set return code.
} # filename
