#! /usr/bin/env bash

source ../lib/tst_plan.sh
source ../lib/ols_err.sh
source ../lib/ols_def.sh
source ../lib/ols_setex.sh
source ../lib/ols_end.sh
source ../lib/tst_plan.sh
source ../lib/ols_rmtemp.sh

PGMID=OLSTST

tst_plan $1                      # Set the plan from 1st option
