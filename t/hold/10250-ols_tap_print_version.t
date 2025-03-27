#!/usr/bin/env bash

source $OLS_LIB/olslib

PGMID=OLS

VERSION=$(bash 10300-ols_tap_print_version.sh)
EX=$?
is $EX $EX_OK "TAP Version RC" "Expect EX_OK exit code."

printf "%s" "VERSION: $VERSION" | cat -A
printf "\n"

printf "%s" "OLS_TAP_VERSION: $OLS_TAP_VERSION"   | cat -A
printf "\n"

if [[ "$VERSION" == "OLS_TAP_VERSION" ]]; then
    echo "OK"
else
    echo "NOT OK"
fi

is "$VERSION" "$OLS_TAP_VERSION" "TAP Version" "Check that the TAP version is correctly returned."
