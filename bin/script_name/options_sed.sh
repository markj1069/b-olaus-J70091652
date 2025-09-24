#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Name: option_sed.sh - Create man version of options file.
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB
sed_file="$OLS_TMP_DIR/sed_file.sed"

cat >$sed_file <</*
1s/^.*$/| B<Options>      | B<Option Value> | B<Description>                               |/
/Arguments/s/Arguments   /B<Arguments>/
/*

cat $sed_file

sed --file=$sed_file options_src.txt >options_man.txt

exit
