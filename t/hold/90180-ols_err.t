#! /usr/bin/env bash


echo "OLS_LIB: $OLS_LIB"
source $OLS_LIB/ols_def.sh
source $OLS_LIB/ols_begin.sh
source $OLS_LIB/ols_err.sh
source $OLS_LIB/ols_set_excode.sh
source $OLS_LIB/ols_rd_excode.sh
source $OLS_LIB/ols_wt_excode.sh


PGMID=OLS

ols_err "OLS" 9999 $EX_OK Informational Message

ols_err "OLS" 9998 $EX_WARNING Warning Message

ols_err "OLS" 9997 $EX_ERROR Error Message

ols_err "OLS" 9996 $EX_SEVERE Severe Error Message

ols_err "OLS" 9995 $EX_FATAL Fatal Error Message
