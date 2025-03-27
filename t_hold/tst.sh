#/usr/bin/env bash

function t () {
    echo "1: $1"
    echo "2: $2"
    echo "3: $3"
}


got=$(t one "2 two ii" three)

echo "got: $got"