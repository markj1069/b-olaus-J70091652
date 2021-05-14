# is - compare two arguments with equal to determine success

function is()
{
    if [[ $# -eq 0 ]]
    then
        olserr 7000 $EX_SOFTWARE "${FUNCNAME}: missing arguments 1–3, got, expected and test_name"
    fi
    if [[ $# -eq 1 ]]
    then
        olserr 7000 $EX_SOFTWARE "${FUNCNAME}: missing arguments 2–3, expected and test_name"
    fi
    if [[ $# -eq 2 ]]
    then
        olserr 7000 $EX_SOFTWARE "${FUNCNAME}: missing arguments 3, test_name"
    fi

    got="$1"
    expected="$2"
    test_name="$3"

    if [[ $# -ge 3 ]]                            # Diagnostic message argument is optional.
    then
        shift 3
        local diagnostic_message="$*"
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
            printf "%s" "ok"
        else
            printf "%s" "not ok"
        fi
    else
        if [[ "$got" == "$expected" ]]     # Got or expected is a string
        then                           # use the bash string comparison.
            printf "%s" "ok"
        else                    
            printf "%s" "not ok"
        fi
    fi

    OLSTST_NO=$((OLSTST_NO+1))
    printf "%s" " $OLSTST_NO - $test_name"
    if [[ -n "$diagnostic_message" ]]
    then
        printf "%s"  " # $diagnostic_message"
    fi
    printf "\n"
 
    return $EX_OK
} # end is
