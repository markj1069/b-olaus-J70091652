# olsusage.sh test function

source ../lib/OLSLIB
source ../lib/OLSTST

PGMID=OLSTST

olsusage "$1"

exit $EX_FATAL               # Should never get here.
