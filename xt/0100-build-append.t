#! /usr/bin/env bash

source $OLSLIB/ols_def.sh

printf "%s\n" "1..1"

if [[ -f bin/build-append.sh ]]; then
    printf "%s\n" "ok 1 - build-append: build-append.sh exists."
else
    printf "%s\n" "not ok 1 - build-append: build-append.sh missing."
fi

touch xt/library

bin/build-append.sh xt/0110-build-append-source.sh xt/libary



exit
