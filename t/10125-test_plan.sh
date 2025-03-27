#! /usr/bin/env bash

source $OLS_LIB

PGMID=OLS

test_plan "$1" 2>/dev/null            # Set the plan from 1st option
