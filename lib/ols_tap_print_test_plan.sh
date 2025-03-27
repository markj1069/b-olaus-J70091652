# ols_tap_test_plan - Write TAP test_plan results to stdout.

# Synopsis: ols_tap_test_plan no_tests

function ols_tap_print_test_plan() {

    # Check for missing arguments.
    if [[ $# -eq 0 ]]; then
        ols_err 7000 $EX_SOFTWARE "${FUNCNAME}: Arguments 1 missing, no_tests"
    fi
    
    no_tests="$1"

    if ! [[no_tests =~ ^[[:digits:]]+$ ]]; then
        ols_err 7000 $EX_SOFTWARE "${FUNCNAME}: Argument no_test must be whold number."
    fi

    if (( no_tests <= 0 )); then
        ols_err 7000 $EX_SOFTWARE "${FUNCNAME}: Argument no_test must be greater then 0."
    fi

    printf "%s\n" "1..$no_tests"
 
    return $EX_OK

} # end ols_tap_print_test_plan
