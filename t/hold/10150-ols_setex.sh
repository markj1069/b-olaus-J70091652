#! /usr/env bash

# Test ols_tap_print_assertion

source $OLS_LIB/olslib

PGMID=OLS
    
ols_tst_plan 5

ols_tap_print_assertion $((0==0)) "Good Test 1" "The assertion of 0==0 should pass."

exit $EX_CODE