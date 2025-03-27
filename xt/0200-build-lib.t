#! /usr/bin/env bash

printf "%s\n" "1..1"

if [[ -f bin/build-lib.sh ]]; then
    printf "%s\n" "ok 1 - build-lib: build-lib.sh exists."
else
    printf "%s\n" "not ok 1 - build-lib: build-lib.sh missing."
fi

bin/build-lib.sh

exit
