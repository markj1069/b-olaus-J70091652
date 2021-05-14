% title **assert**&mdash;Test a variable or condition at critical points in a script.
% author Mark Jensen
% date 26 APR 2020

# Name assert

**assert**&mdash;Test a variable or condition at critical points in a script.

## SYNOPSIS

**assert** *var1* *op* *var2* *line_no*

## Description

The **assert** function is used to test a variable or condition at critical points in a script. (This is an idea borrowed from C.)

The pseudocode for this function is:

```pseudocode
if ! var1 op var2 then
    print "Assertion Fail."
    exit with assert fail
```

### ARGUMENTS

* *var1* &mdash; Variable 1 in condition (required)
* *op* &mdash; Comparison operator (required)
* *var2* &mdash; Variable 2 in condition (required)
* *line_no* &mdash; line number of the assertion (required)
Assert the condition (required)


## EXAMPLES

### One

```bash
    source $OLSLIB

    i=5
    j=4

    assert "$i" "-ge" "$j" $LINENO

    a="abc def"
    g="ghi jkl"

    assert "$a" "==" "$g" $LINENO

    echo "This statement echoes only if the \"assert\" does not fail."
```

results in

```console
    Assertion failed:  "5 -lt 4", File "ex1.sh", line 14
```

on stderr.

### Two

```bash
    source $OLSLIB
    declare -i x=8
    declare -i y=4

    assert "$x" "-ge" "0" $LINENO
    assert "$y" "-le" "0" $LINENO
```

results in

```console
    Assertion failed:  "4 -le 0", File "ex2.sh", line 8
```

on stderr.

## Notes

## Cavets

## Diagnostics

assert: missing argument 1, var1

assert: missing argument 2, op

assert: missing argument 3, var2

assert: missing argument 4, line_no

Assertion failed:

## Dependencies

The global variable $OLSLIB needs to be set to your installations Olaus Script Library
and sourced before this function executes.
The default location is _/usr/local/lib/olaus/olslib_.

## VERSION

Version 0.2.0 30 APR 2020 Fix *condition* passing with blank strings
Version 0.1.0 26 APR 2020 Olaus Script Library Update
Version 0.0.0 14 SEP 2006 Initial Release

## Author

[Mark Jensen](mailto:mark@jensen.net)

## History

30 APR 2020 - Converted condition from a single argument to three.
old: **assert** *condition* *line_no*
new: **assert** *var1* *op* *var2* *line_no*

The shell uses blanks in their parsing algrothim so variables with blank values would not operate correctly.
The breaking the condition into three parts, *var1*, *var2* and *op*, solves this problem.
It does mean that more complicated operations can not be passed to **assert**.

26 APR 2020 - Moved documentation to Markdown format.
**assert** updated to use Olaus Script Library errmsg.

2006-09-14 - Function created by nuf ver. 3.0.0. Based upon Mendel Cooper's assert.

## Resources

Mendel Cooper, *Advanced Bash-Scripting Guide*, Revision 4.0, 2006-06-18.

Wikipedia, *Assertion (computing)*,
[http://en.wikipedia.org/wiki/Assertion_(computing)](http://en.wikipedia.org/wiki/Assertion_(computing))
