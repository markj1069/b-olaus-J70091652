# isnot - compare two arguments with not equal to determine success

function isnot()
{

#local -a a                   # Hold arguments in an array
#local -i i                   # Index into that array
#local    s                   # Hold argument before array

    if [[ -z $1 ]]
    then
        ols_err 7000 $EX_SOFTWARE "${FUNCNAME}: missing argument 1, got"
    else
        local got="$1"
    fi
    if [[ -z $2 ]]
    then
        ols_err 7000 $EX_SOFTWARE "${FUNCNAME}: missing argument 2, expected"
    else
        local expected="$2"
    fi
    if [[ -z $3 ]]
    then
        ols_err 7000 $EX_SOFTWARE "${FUNCNAME}: missing argument 3, test_name"
    else
        local test_name="$3"
    fi
    shift 3
    if [[ -z $1 ]]                            # Diagnostic message argument is optional.
    then
        local diagnostic_message=''
    else
        local diagnostic_message="$*"
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
        if [[ $got -ne $expected ]]    # Both got and expected are integers
        then                           # use the bash numerial comparison
            printf "%s" "ok"
        else
            printf "%s" "not ok"
        fi
    else
        if [[ $got != $expected ]]     # Got or expected is a string
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
