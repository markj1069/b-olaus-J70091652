#  Return filename w/o suffix and path
#
function filexsfx {           # What is the suffex on a filename?
    local FN
    local SX
    local FL="$1"              # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
    local RC
    FN=${FL##*/}             # vvv_www.yyy.zzz
    SX=${FN##*\.}            # SX=zzz with bash pattern matching
    if [ "$SX" = "$FN" ]
    then
        SX=""                # There may not be a suffex.
        RC=EX_WARNING        # Set return code to warning.
    else
        SX=".$SX"            # Capture the suffix
        RC=EX_OK             # Return code OK.
    fi
    builtin printf "%s" "$SX" # Return the suffex.
    return $RC               # Set return code.
} # filesfx
