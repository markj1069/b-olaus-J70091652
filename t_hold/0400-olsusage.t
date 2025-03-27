#! /usr/bin/env bash

PGMID=OLSTST

source ../lib/ols_lib/olsdef.sh
source ../lib/ols_lib/olsusage.sh
source ../lib/OLSTST

    SYNOPSIS1="cat [OPTION]... [FILE]..."
    USAGE1=$'Usage: \ncat [OPTION]... [FILE]...'

    strhold=$(mktemp)
    cat > $strhold << '/*'
grep [-E|-F] [-c|-l|-q] [-insvx] -e pattern_list
     [-e pattern_list]... [-f pattern_file]... [file...]

grep [-E|-F] [-c|-l|-q] [-insvx] [-e pattern_list]

grep [-E|-F] [-c|-l|-q] [-insvx] pattern_list [file...]
/*
    SYNOPSIS2=$( cat "$strhold" )
    rm "$strhold"

    USAGE2=$'Usage: \n'
    USAGE2=$( printf "%s" "$USAGE2$SYNOPSIS2" )


    tst_plan 8         

# call olsusage with simple string.
    pl=$( bash 0410-olsusage.sh "$SYNOPSIS1" 2>&1 )
    RC=$?
    is  $RC   $EX_OK    "simple-string-rc"
    is "$pl" "$USAGE1"  "simple-string-usage"


# call olsusage with a long synopsis containing newlines.
    pl=$( bash 0410-olsusage.sh "$SYNOPSIS2" )
    RC=$?
    is  $RC   $EX_OK    "multi-line-synopsis-rc"
    is "$pl" "$USAGE2"  "multi-line-synopsis"


# call olsusage without an argument.
    pl=$( bash 0420-olsusage.sh )
    RC=$?
    is  $RC  $EX_SOFTWARE     "missing-arguement-rc-1"
    is "$pl" ""               "missing-arguement-null-string"

# call olsusage without an argument test error message.
    pl=$( bash 0430-olsusage.sh )
    RC=$?
    error_message="OLSTST7000F olsusage: Missing required synopsys argument"
    is  $RC   $EX_SOFTWARE     "missing-arguement-rc-2"
    is "$pl" "$error_message"  "missing-arguement-error-message"
