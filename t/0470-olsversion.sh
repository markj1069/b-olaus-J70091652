# olsusage.sh Test Function with Copyright and License Arguments Missing

source ../lib/OLSLIB
source ../lib/OLSTST

PGMID=OLSTST

olsversion "$1" 2>&1

exit $EX_FATAL               # Should never get here.
