# ols_test - Bash implementation of Perl's Test::More

declare -r -i OLSTST_NOPLAN=0 # Define a "No Plan" request to tst_plan.
declare    -i OLSTST_NO=0     # Test counter.

cat >/dev/null <<'/*'

=head1 NAME

ols_plan - specify the number of tests to be run.

=head1 SYNOPSIS

B<ols_plan> I<number>

B<ok> I<condition> I<description> I<directive>

B<is> I<variable_a> I<variable_b> I<description> I<directive>

=head1 DESCRIPTION

The B<ok> function evaluates the condition and prints a message on STDOUT.
B<ok> operates much like B<assert> with the exception that B<ok> does not
exit the script.

    ok 42 this is a description of the test
    not ok 43 This is a description of another test

=head1 ARGUMENTS

=over 4

=item I<condition>

The test condition (required)

=item I<test_name>

Name or description of test (optional)

=item I<line_no>

The which line is this test being called from (optional)

=item I<test_directive>

When necessary, a "TODO explanation of this todo"
or "SKIP reason for skipping test"
(optional)

=back

=head1 EXAMPLES

=head2 One


    a=5
    b=4

    condition="$a -ge $b"     

    echo assert "\"$condition\""
    ok "$a -gt $b" "Test a > b" $LINENO

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

2006-09-14 - Function created by nuf ver. 3.0.0.

=head1 RESOURCES

Michael Schwem,
I<Test::More - yet another framework for writing test scripts>, 2004,
L<http://search.cpan.org/~mschwern/Test-Simple-0.64/lib/Test/More.pm>

Andy Lester,
I<Test::Harness - Run Perl standard test scripts with statistics>, 2006,
L<http://search.cpan.org/~petdance/Test-Harness/lib/Test/Harness.pm>

Andy Lester and Michael Schwem,
I<Test::Harness::TAP - Documentation of the Test Anything Protocol>, 2005,
L<http://search.cpan.org/~petdance/Test-Harness-2.62/lib/Test/Harness/TAP.pod>

=cut

/*
function tst_plan() {
    if [[ -z "$1" ]]; then return $EX_OK
    else                   local -i tst_no=$1
    fi

    if [[ $tst_no -le $OLSTST_NOPLAN ]]; then return $EX_OK; fi

    echo "1..$tst_no" # Send the TAP test plan to STDOUT.

    return $EX_OK
} # end plan

function ok() {
    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2007 "ok: missing argument 1, condition"
    fi

    OLSTST_NO=$((OLSTST_NO+1))
    if [ $1 ]; then echo -n "ok"
    else            echo -n "not ok"
    fi
    echo -n " $OLSTST_NO"
    if [[ -n "$2" ]]; then echo -n " $2";         fi
    if [[ -n "$3" ]]; then echo -n " # $3";       fi
    echo ""

    return $EX_OK
} # end ok

function is() {

    OLSTST_NO=$((OLSTST_NO+1))
    if [ "$1" = "$2" ]; then echo -n "ok"
    else                     echo -n "not ok"
    fi
    echo -n " $OLSTST_NO $3"
    if [[ -n "$4" ]]; then echo -n " # $4"; fi
    echo ""
 
    return $EX_OK
} # end is

function isnt() {

    OLSTST_NO=$((OLSTST_NO+1))
    if [ "$1" != "$2" ]; then echo -n "ok"
    else                      echo -n "not ok"
    fi
    echo -n " $OLSTST_NO $3"
    if [[ -n "$4" ]]; then echo -n " # $4"; fi
    echo ""
 
    return $EX_OK
} # end isnt

function like() {
    echo 1: $1
    echo 2: $2
    echo 3: $3
    echo 4: $4
    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2010 "like: missing argument 1, string"
    fi
    if [[ -z "$2" ]]; then
        errmsg $EX_USAGE 2011 "like: missing argument 2, pattern"
    fi

    OLSTST_NO=$((OLSTST_NO+1))
    echo -n "not ok"

    echo -n " $OLSTST_NO $3 at line $4 # SKIP like() not implemented."
 
    echo ""
    return $EX_OK
} # end like

function unlike() {
    echo 1: $1
    echo 2: $2
    echo 3: $3
    echo 4: $4
    echo 5: $5
    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2012 "unlike: missing argument 1, string"
    fi
    if [[ -z "$2" ]]; then
        errmsg $EX_USAGE 2013 "unlike: missing argument 2, pattern"
    fi

    OLSTST_NO=$((OLSTST_NO+1))
    echo -n "not ok"

    echo -n " $OLSTST_NO $3 at line $4 # SKIP unlike() not implemented."
 
    echo ""
    return $EX_OK
} # end unlike

function cmp_ok() {
    echo 1: $1
    echo 2: $2
    echo 3: $3
    echo 4: $4
    echo 5: $5
    echo 6: $6
    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2014 "cmp_ok: missing argument 1, a"
    fi
    if [[ -z "$2" ]]; then
        errmsg $EX_USAGE 2015 "cmp_ok: missing argument 2, op"
    fi
    if [[ -z "$3" ]]; then
        errmsg $EX_USAGE 2016 "cmp_ok: missing argument 3, b"
    fi

    OLSTST_NO=$((OLSTST_NO+1))
    echo -n "not ok"

    echo -n " $OLSTST_NO $4 at line $6 # SKIP cmp_ok() not implemented."
 
    echo ""
    return $EX_OK
} # end cmp_ok

function BAIL_OUT() {

    echo "# BAIL_OUT: $*"
    errmsg $EX_TESTBAIL 2017 "BAIL_OUT: $*" 

} # BAIL_OUT

function diag() {

    echo "# $*"

} # diag

function pass() {

    OLSTST_NO=$((OLSTST_NO+1))
    echo -n "ok"
    echo -n " $OLSTST_NO $1"
    if [[ -n "$2" ]]; then echo -n " # $2"; fi
    echo ""
 
    return $EX_OK
} # pass

function fail() {

    OLSTST_NO=$((OLSTST_NO+1))
    echo -n "not ok"
    echo -n " $OLSTST_NO $1"
    if [[ -n "$2" ]]; then echo -n " # $2"; fi
    echo ""
 
    return $EX_OK
} # fail



