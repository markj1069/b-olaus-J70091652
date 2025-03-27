#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh
. ../lib/ols_rmtemp.sh
. ../lib/assert.sh
. ../lib/ols_setex.sh
. ../lib/ols_end.sh
. ../lib/diag.sh
. ../lib/tst_plan.sh

PGMID=OLSTST

tst_plan 4
expected="Simple Diagnostic Message"
EX_CODE=$EX_OK
got=$( bash 0271-diag.sh Simple Diagnostic Message )
is $EX_CODE $EX_OK "Expect no change in exit code."
is "$got" "$expected" diag-simple Simple Diagnostic Message

expected="EX_ERROR Diagnostic Message"
EX_CODE=$EX_ERROR
got=$( bash 0271-diag.sh EX_ERROR Diagnostic Message )
is $EX_CODE $EX_ERROR "Expect no change in exit code, EX_ERROR this time."
is "$got" "$expected" diag-ex-error EX_ERROR Diagnostic Message 
