#! /usr/bin/env bash

source $OLSLIB

# Create temporary CSV file
cat >$OLS_TMP_DIR/test.csv <</*
one,two,three
four,five,six
seven,eight,nine
/*
pwd
touch $OLS_TMP_DIR/test.txt

test_plan 5

t/20110-is_csv.sh $OLS_TMP_DIR/test.csv
EX=$?
is $EX   $EX_OK "Works" "Does is_csv pass a normal test?"

t/20110-is_csv.sh
EX=$?
is $EX   $EX_USAGE "Missing" "Does is_csv set EX_USAGE for a missing argument?"

t/20110-is_csv.sh $OLS_TMP_DIR/test.txt
EX=$?
is $EX    $EX_USAGE "NonCSV" "Does is_csv catch the non-CSV extention?"

t/20110-is_csv.sh $OLS_TMP_DIR/test.missing
EX=$?
is $EX    $EX_MISSINGFILE "Missing" "Does is_csv catch a non-existant file?"

t/20110-is_csv.sh $OLS_TMP_DIR
EX=$?
echo "EX: $EX"
is $EX    $EX_MISSINGFILE "Directory" "Does is_csv catch a non-normal file?"

ols_wt_excode $EX_OK
