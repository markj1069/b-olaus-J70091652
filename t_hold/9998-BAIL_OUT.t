#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh
. ../lib/ols_rmtemp.sh
. ../lib/assert.sh
. ../lib/ols_setex.sh
. ../lib/ols_end.sh
. ../lib/BAIL_OUT.sh
. ../lib/tst_plan.sh

PGMID=OLSTST

tst_plan 2
expected="BAIL_OUT: Bail Out Message"
got=$( bash 9999-BAIL_OUT.sh "Bail Out Message" )
RC=$?
is $RC $EX_TESTBAIL "Expect a EX_TESTBAIL exit code."
is "$got" "$expected" bail-out-msg 

exit $EX_OK