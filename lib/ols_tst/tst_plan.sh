# plan - declare number of tests you are going to run

function tst_plan() {

    if [[ -z "$1" ]]; then
        ols_err 7001 $EX_SOFTWARE "${FUNCNAME}: missing argument 1, tst_no"
        return $EX_SOFTWARE
    else
        local -i tst_no=$1
    fi

    if [[ $tst_no -lt $OLSTST_NOPLAN ]]
    then
        ols_err 7002 $EX_SOFTWARE "tst_plan: tst_no less than 0"
        return $EX_SOFTWARE;
    fi

    if [[ $tst_no -eq $OLSTST_NOPLAN ]]
    then
        printf "\n" >&1                # Send the TAP no test plan.
        return $EX_OK
    fi
    
    printf "1..$tst_no\n" >&1          # Send the TAP test plan to STDOUT.
    return $EX_OK

} # end plan
