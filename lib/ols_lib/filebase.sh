# Return the basename of filename
#
function filebase {          # What is the basename?
    local BN
    local FN
    local FL="$1"            # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
    FN=${FL##*/}             # vvv_www.yyy.zzz
    BN=${FN%.*}              # vvv_www.yyy
    builtin printf "%s" "$BN" # Return the basename
    return $EX_OK            # Set return code
} # filebase
