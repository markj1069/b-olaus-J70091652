# ols_tap_print - Write the TAP line to STDOUT.

function ols_tap_print() {

# Synopsis: ols_tap_print test_result test_name [diagnostic_message]

    # Check for missing arguments.
    if [[ $# -eq 0 ]]
    then
        ols_err $OLSID 7000 $EX_USAGE "ols_tap_print: Arguments 1-3 missing, test_result, test_name and diagnostic_message"
    fi
    if [[ $# -eq 1 ]]
    then
        ols_err $OLSID 7000 $EX_USAGE "ols_tap_print: Arguments 2-3 missing, test_name and diagnostic_message"
    fi

    test_result="$1"
    test_name="$2"

    # Process test results
    if [[ $test_result == $TRUE ]]; then
        tap_flag="ok"
    else
        tap_flag="not ok"
    fi

    # Process diagnostic message if present.
    if [[ $# -gt 2 ]]                            # Diagnostic message argument is optional.
    then
        shift 2
        local diagnostic_message="$@"  # Add the hash between the test number
        local diagnostic_sep=": "     # and diagnostic message here.
    else
        local diagnostic_message=""    # No disgnostic message and
        local disgnostic_sep=""        # no need for a separator.
    fi

    ols_bmp_tstno                     # Increment TAP test number.
    tst_no=$(ols_rd_tstno)            # Read the incremented TAP test number

    printf "%s%s%s%s%s%s%s\n" "$tap_flag" " " $tst_no " - " "$test_name" "$diagnostic_sep" "$diagnostic_message"
 

} # end ols_tap_print
