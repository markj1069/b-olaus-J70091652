# olsusage.sh test function with no arguments

source ../lib/OLSLIB

PGMID=OLSTST

olsusage 2>&1

exit $EX_FATAL
