#! /usr/bin/env bash

export OLSLIB=../lib/olslib

source $OLSLIB
declare -i x=8
declare -i y=4

assert "$x" "-ge" "$y" $LINENO
assert "$y" "-le" "$y" $LINENO