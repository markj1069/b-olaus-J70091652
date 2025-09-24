#! /usr/bin/env bash

#---------------------------------------------------------------------------------------------------
#
# Name: option_sed.sh - Create man version of options file.
#
#---------------------------------------------------------------------------------------------------

source $OLSLIB
sed_file="$OLS_DIR_TMP/sed_file.sed"

cat >$sed_file <</*
1s/^*$/| B<Options>      |  B<Option Value> | B<Description>  |/ 
/Arguments/s/^*$/ | B<Arguments>    |                  |                                              |/
/*

sed --file=$OLS_TMP_DIR/sed_file.sed options_src.txt options_man.txt

exit
