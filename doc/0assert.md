%title assert—Test a variable or condition at critical points in a script
%author Mark Jensen
%date 30 APR 2020

# Name assert

**assert**—Test a variable or condition at critical points in a script.

## Synopsys

**assert** *var1* *op* *var2* *line_no*

## Description

The **assert** function is used to test a variable or condition at critical points in a script.
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

## NOTES

In the original incantation of **assert** the test is passed as a single string.

```shell
assert "$i -lt $j" $LINENO
```

The shell uses blanks in their parsing algrothim so variables with blank values would not operate correctly.
The breaking the condition into three parts, var1, var2 and op, solves this problem.
It does mean that more complicated operations can not be passed to **assert**.

=head1 CAVEATS

=head1 DIAGNOSTICS

assert: missing argument 1, condition

assert: missing argument 2, line_no

Assertion failed:
%title 
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