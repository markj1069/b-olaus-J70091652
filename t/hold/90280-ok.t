#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh
. ../lib/ols_rmtemp.sh
. ../lib/ok.sh
. ../lib/test_plan.sh

PGMID=OLSTST
test_plan 12

i=0
j=1

a="tuv"
b="tuv"
c="wxy"

expected="ok 1 - i-eq-i # I is equal to I test."
got=$( bash 0282-ok.sh "$i -eq $i" i-eq-i "I is equal to I test." )
RC=$?
is "$got" "$expected" i-eq-i I is equal to I test.
is $RC $EX_OK i-eq-i-rc "Expect a EX_OK exit code."

expected="ok 1 - i-lt-j # I is less than J test."
got=$( bash 0282-ok.sh "$i -lt $j" i-lt-j "I is less than J test." )
RC=$?
is "$got" "$expected" i-lt-j I is less than J test.
is $RC $EX_OK i-lt-j-rc "Expect a EX_OK exit code."

expected="ok 1 - a-eq-b # A is equal to B test."
got=$( bash 0282-ok.sh "$a == $b" a-eq-b "A is equal to B test." )
RC=$?
is "$got" "$expected" a-eq-b A is equal to B test..
is $RC $EX_OK a-eq-b-rc "Expect a EX_OK exit code."

expected="ok 1 - a-ne-c # A is not equal than C test."
got=$( bash 0282-ok.sh "$a != $c" a-ne-c "A is not equal than C test." )
RC=$?
is "$got" "$expected" a-ne-c A is not equal than CB test.
is $RC $EX_OK a-ne-c-rc "Expect a EX_OK exit code."

expected="ok 1 - not-i-lt-j # Not I is less than J test."
got=$( bash 0282-ok.sh "! $i -eq $j" not-i-lt-j "Not I is less than J test." )
RC=$?
is "$got" "$expected" not-i-lt-j Not I is less than J test.
is $RC $EX_OK not-i-lt-j-rc "Expect a EX_OK exit code."

expected="ok 1 - not-a-eq-b # Not A is equal to B test."
got=$( bash 0282-ok.sh "! $a != $b" not-a-eq-b "Not A is equal to B test." )
RC=$?
is "$got" "$expected" not-a-eq-b Not A is equal to B test.
is $RC $EX_OK not-a-eq-b-rc "Expect a EX_OK exit code."

expected="ok 1 - not-a-ne-c # Not A is not equal than C test."
got=$( bash 0282-ok.sh "! $a == $c" not-a-ne-c "Not A is not equal than C test." )
RC=$?
is "$got" "$expected" not-a-ne-c Not A is not equal than C test.
is $RC $EX_OK not-a-ne-c-rc "Expect a EX_OK exit code."
