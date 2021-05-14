#! /usr/bin/env bash

. ../lib/ols_def.sh
. ../lib/ols_err.sh
. ../lib/is.sh


    ONE=$(printf "%s\n" "1..1")
    NULL=$(printf "%s\n" "")

    printf "%s\n" "1..6"          

    pl=$(bash 0211-plan.sh 1)
    RC=$?
    is  $RC   0      1 "RC='$RC' Plan exit code should be 0"
    is "$pl" "$ONE"  2 "pl='$pl' Plan Tap output should be 1..1"

    pl=$(bash 0211-plan.sh 0)
    RC=$?
    is  $RC   0      3 "RC='$RC' No Plan exit code should be 0"
    is "$pl" "$NULL" 4 "pl='$pl' No Plan Tap output should be the null string"

    pl=$(bash 0211-plan.sh -1)
    RC=$?
    is  $RC  70      5 "RC='$RC' Negative Plan exit code should be 70"
    is "$pl" "$NULL" 6 "pl='$pl' Negative Plan Tap output should be the null string"
