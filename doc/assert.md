% title **assert**&mdash;Test a variable or condition at critical points in a script.
% author Mark Jensen
% date 26 APR 2020

# Name assert

**assert**&mdash;Test a variable or condition at critical points in a script.

## SYNOPSIS

**assert** condition line_no

## Description

The **assert** function is used to test a variable or condition at critical points in a script. (This is an idea borrowed from C.)

The pseudocode for this function is:

```pseudocode
if ! condition then
    print "Assertion Fail."
    exit with assert fail
```

### ARGUMENTS

*condition*

Assert the condition (required)

*line_no*

Line number of the assertion (required)


## EXAMPLES

### One

```bash
    source $OLSLIB/assert.sh

    a=5
    b=4

    condition="$a -ge $b"

    echo assert "\"$condition\""
    assert "$condition" $LINENO

    condition="$a -lt $b"

    echo assert "\"$condition\""
    assert "$condition" $LINENO

    echo "This statement echoes only if the \"assert\" does not fail."
```

results in

```console
    assert "5 -ge 4" $LINENO
    assert "5 -lt 4" $LINENO
    Assertion failed:  "5 -lt 4", File "ex1.sh", line 14
```

on stderr.

### Two

```bash
    source $OLSLIB/assert.sh
    declare -i x=8
    declare -i y=4

    assert "$x -ge 0" $LINENO
    assert "$y -le 0" $LINENO
```

results in

```console
    Assertion failed:  "4 -le 0", File "ex2.sh", line 8
```

on stderr.

## Notes

## Cavets

## Diagnostics

assert: missing argument 1, condition

assert: missing argument 2, line_no

Assertion failed:

## VERSION

Version 1.0.0 26 APR 2020 Olaus Script Library Update
Version 0.0.0 14 SEP 2006 Initial Release

## Author

[Mark Jensen](mailto:mark@jensen.net)

## History

26 APR 2020 - Moved documentation to Markdown format.
**assert** updated to use Olaus Script Library errmsg.

2006-09-14 - Function created by nuf ver. 3.0.0. Based upon Mendel Cooper's assert.

## Resources

Mendel Cooper, *Advanced Bash-Scripting Guide*, Revision 4.0, 2006-06-18.

Wikipedia, *Assertion (computing)*,
[http://en.wikipedia.org/wiki/Assertion_(computing)](http://en.wikipedia.org/wiki/Assertion_(computing))
