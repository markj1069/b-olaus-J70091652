

function pass()
{
    OLSTST_NO=$(($OLSTST_NO+1))
    if [[ $# -eq 0 ]]
    then
        printf "ok $OLSTST_NO - pass"
    else
        printf "ok $OLSTST_NO - pass $*"
    fi
    return $EX_OK
} # pass
