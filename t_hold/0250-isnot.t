#! /usr/bin/env bash

. ../lib/ols_begin.sh
. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh
. ../lib/isnot.sh
. ../lib/ols_end.sh
. ../lib/ols_setex.sh
. ../lib/ols_rmtemp.sh
. ../lib/tst_plan.sh

PGMID=OLSTST

i=0
j=0
k=1
l=1
m=-1
n=-1
o=-2
p=2

a="tuv"
b="tuv"
c="wxy"
d="abc def"
e="abc def"
f='ghi jkl'

tst_plan 12

expected="not ok 1 - not-equal-zero # Test 0 != 0"
got=$( isnot $i $j not-equal-zero "Test 0 != 0" )
is "$got" "$expected" not-equal-zero "Test 0 != 0"

expected="not ok 2 - not-equal-one # Test 1 == 1"
got=$( isnot $k $l not-equal-one "Test 1 == 1" )
is "$got" "$expected" not-equal-one "Test 1 == 1"

expected="not ok 3 - not-equal-mone # Test -1 == -1"
got=$( isnot $m $n not-equal-mone "Test -1 == -1" )
is "$got" "$expected" not-equal-mone "Test -1 == -1"

expected="ok 4 - not-equal-zero-one # Test 0 == 1"
got=$( isnot $i $k not-equal-zero-one "Test 0 == 1" )
is "$got" "$expected" not-equal-zero-one  "Test 0 == 1"

expected="ok 5 - not-equal-zero-mone # Test 0 == -1"
got=$( isnot $i $k not-equal-zero-mone "Test 0 == -1" )
is "$got" "$expected" not-equal-zero-mone  "Test 0 == -1"

expected="ok 6 - not-equal-one-mone # Test 1 == -1"
got=$( isnot $i $k not-equal-one-mone "Test 1 == -1" )
is "$got" "$expected" not-equal-one-mone  "Test 1 == -1"

expected="ok 7 - not-equal-one-two # Test 2 == 2"
got=$( isnot $i $k not-equal-one-two "Test 2 == 2" )
is "$got" "$expected" not-equal-one-two  "Test 2 == 2"

expected="ok 8 - not-equal-two-two # Test 2 == -2"
got=$( isnot $i $k not-equal-two-two "Test 2 == -2" )
is "$got" "$expected" not-equal-two-two  "Test 2 == -2"

expected="not ok 9 - not-equal-tuv-tuv # Test tuv == tuv"
got=$( isnot "$a" "$b" not-equal-tuv-tuv "Test tuv == tuv" )
is "$got" "$expected" not-equal-tuv-tuv  "Test tuv == tuv"

expected="ok 10 - not-equal-tuv-wxy # Test tuv == wxy"
got=$( isnot "$a" "$c" not-equal-tuv-wxy "Test tuv == wxy" )
is "$got" "$expected" not-equal-tuv-wxy  "Test tuv == wxy"

expected="not ok 11 - not-equal-def-def # Test def == def w/blanks"
got=$( isnot "$d" "$e" not-equal-def-def "Test def == def w/blanks" )
is "$got" "$expected" not-equal-def-def  "Test def == def w/blanks"

expected="ok 12 - not-equal-def-ghi # Test def == ghi w/blanks"
got=$( isnot "$d" "$f" not-equal-def-ghi "Test def == ghi w/blanks" )
is "$got" "$expected" not-equal-def-ghi "Test def == ghi w/blanks"
