
cat >/dev/null <<'/*'

=head1 NAME

assert - test a variable or condition at critical points in a script.

=head1 SYNOPSIS

assert condition line_no

=head1 DESCRIPTION

The B<assert> function is used to test a variable or condition at critical points in a script.
(This is an idea borrowed from C.)

=head1 ARGUMENTS

=over 4

=item I<condition>

Assert the condition (required)

=item I<line_no>

Line number of the assertion (required)

=back

=head1 EXAMPLES

=head2 One

    . assert.sh

    a=5
    b=4

    condition="$a -ge $b"     

    echo assert "\"$condition\""
    assert "$condition" $LINENO

    condition="$a -lt $b"

    echo assert "\"$condition\""
    assert "$condition" $LINENO

    echo "This statement echoes only if the \"assert\" does not fail."

results in

    assert "5 -ge 4"
    assert "5 -lt 4"
    Assertion failed:  "5 -lt 4", File "ex1.sh", line 14

on stderr.

=head Two

    declare -i x=8
    declare -i y=4

    assert "$x -ge 0" $LINENO

    assert "$y -le 0" $LINENO

results in

    Assertion failed:  "4 -le 0", File "ex2.sh", line 8

on stderr.

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

assert: missing argument 1, condition

assert: missing argument 2, line_no

Assertion failed:

=head1 VERSION

$Revision: 95 $

$Id: nuf.sh 87 2006-09-13 17:06:10Z a0214394 $

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-14 - Function created by nuf ver. 3.0.0. Based upon Mendel Cooper's assert.

=head1 RESOURCES

Mendel Cooper, I<Advanced Bash-Scripting Guide>, Revision 4.0, 2006-06-18.

Wikipedia, I<Assertion (computing)>,
L<http://en.wikipedia.org/wiki/Assertion_(computing)>

=cut

/*

function ok () {


    if [[ $# -eq 0 ]]                            # The Condition arguemnt is required.
    then
        ols_err $EX_USAGE 7001 "ok: missing argument 1, condition"
    else
        local CONDITION="$1"
    fi
    if [[ $# -ge 2 ]]                            # The Test Name argument is optional.
    then
        local TEST_NAME="$2"
    else
        local TEST_NAME=""
    fi
    if [[ $# -ge 3 ]]                            # Diagnostic message argument is optional.
    then
        shift 2
        local DIAGNOSTIC_MESSAGE="$*"
    else
        local DIAGNOSTIC_MESSAGE=""
    fi

    if [[ $CONDITION ]]
    then
        printf "%s" "ok"
    else
        printf "%s" "not ok"
    fi

    OLSTST_NO=$((OLSTST_NO+1))

    printf "%s" " $OLSTST_NO"
    
    if [[ -n $TEST_NAME ]]
    then
        printf "%s" " - $TEST_NAME"
    fi
    if [[ -n "$DIAGNOSTIC_MESSAGE" ]]
    then
        printf "%s"  " # $DIAGNOSTIC_MESSAGE"
    fi
    printf "\n"
 
    return
} # end ok

