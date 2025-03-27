

function fail()
{
    OLSTST_NO=$((OLSTST_NO+1))
    printf "not ok $OLSTST - Fail: $*"
 
    return $EX_OK
} # fail
