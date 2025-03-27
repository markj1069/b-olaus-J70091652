#! /usr/bin/env bash

. lib/ols_def.sh
. lib/ols_tst_plan.sh
. lib/ols_wt_tstno.sh
. lib/ols_err.sh
. lib/is.sh

echo "OLS_TSTFILE: $OLS_TSTFILE"

cat $OLS_TSTFILE

ols_tst_plan 2

cat $OLS_TSTFILE
