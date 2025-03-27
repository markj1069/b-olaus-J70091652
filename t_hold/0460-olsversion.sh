# olsusage.sh Test Function with License Argument Missing

source ../lib/OLSLIB
source ../lib/OLSTST

PGMID=OLSTST

olsversion "$1" "$2" 2>&1

exit $EX_FATAL               # Should never get here.
