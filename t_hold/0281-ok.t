#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh
. ../lib/ols_rmtemp.sh
. ../lib/assert.sh
. ../lib/ols_setex.sh
. ../lib/ols_end.sh
. ../lib/ok.sh
. ../lib/tst_plan.sh

PGMID=OLSTST

i=0
j=0
k=1

a="tuv"
b="tuv"
c="wxy"

tst_plan 5

expected="ok 1"
got=$( ok "$i -eq $i" )
RC=$?
echo "RC: $RC"
is "$got" "$expected" cond-only Only condition argument supplied.
is $RC $EX_OK cond-only-rc "Expect a EX_OK exit code."

expected="ok 3 - three"
got=$( ok "$i -eq $i" "three" )
RC=$?
echo "RC: $RC"
is "$got" "$expected" test_name_inc "Include Condition and Test Name."
is $RC $EX_OK cond-only-rc "Expect a EX_OK exit code."

