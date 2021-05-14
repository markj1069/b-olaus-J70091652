# olsusage.sh test function

source ../lib/OLSLIB
source ../lib/OLSTST

PGMID=OLSTST

olsversion "$1" "$2" "$3"

exit $EX_FATAL               # Should never get here.
