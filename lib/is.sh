# is - compare two arguments with equal to determine success

function is() {

# Synopsis: is got expected test_name dianostic_message    
    if [[ $# -eq 0 ]]
    then
        ols_err $OLSID 7000 $EX_USAGE"${FUNCNAME}: Arguments 1-3 missing, got, expected and test_name"
    fi
    if [[ $# -eq 1 ]]
    then
        ols_err $OLSID 7000 $EX_USAGE "${FUNCNAME}: Arguments 2-3, expected and test_name"
    fi
    if [[ $# -eq 2 ]]
    then
        ols_err $OLSID 7000 $EX_USAGE "${FUNCNAME}: Argument 3 missing, test_name"
    fi

    got="$1"
    expected="$2"
    test_name="$3"

    if [[ $# -ge 3 ]]                            # Diagnostic message argument is optional.
    then
        shift 3
        local diagnostic_message="$@"
    else
        local diagnostic_message=""
    fi

    
    # BASH has different equal operators for strings and integers.
    # Figure out which one to use.
    # If both got and expected are integers use "-eq" inside "[["
    # otherwise use "==" inside "[[".
    # Use the Bash extended pattern matching to check for integer.

    if [[ "$got" == ?(-)+([0-9]) ]]
    then
        local ngot=$TRUE
    else
        local ngot=$FALSE
    fi
    if [[ "$expected" == ?(-)+([0-9]) ]]
    then
        local nexpected=$TRUE
    else
        local nexpected=$FALSE
    fi

    # Now that the preliminaries are out of the way,
    # let's do the test.

    if [[ $ngot == $TRUE && $nexpected == $TRUE ]]
    then

        if [[ $got -eq $expected ]]    # Both got and expected are integers
        then                           # use the bash numerial comparison
            ols_tap_print $TRUE  $test_name $diagnostic_message
        else
            ols_tap_print $FALSE $test_name $diagnostic_message
        fi
    else
        if [[ "$got" == "$expected" ]]     # Got or expected is a string
        then                               # use the bash string comparison.
            ols_tap_print $TRUE  $test_name $diagnostic_message
        else                    
            ols_tap_print $FALSE $test_name $diagnostic_message
        fi
    fi
 
    return $EX_OK
} # end is
