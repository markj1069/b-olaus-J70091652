#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_begin.sh
. ../lib/is.sh
. ../lib/pass.sh
. ../lib/tst_plan.sh

tst_plan 3


expected='ok 1 - pass'
got=$( pass )
RC=$?
echo "got:      '$got'"
echo "expected: '$expected'"
is "$got" "$expected" pass-none "Test pass without arguments."
is $RC $EX_OK pass-none-rc "Expect return code to be EX_OK."

pass Diagnostic Message
