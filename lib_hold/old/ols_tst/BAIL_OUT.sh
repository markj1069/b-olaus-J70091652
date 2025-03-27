# is - compare two arguments with = to determine success

function BAIL_OUT() {
    printf "%s\n" "BAIL_OUT: $*"
    exit $EX_TESTBAIL
} # end BAIL_OUT
