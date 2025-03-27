# olsusage.sh test function with no arguments

source ../lib/OLSLIB

PGMID=OLSTST

olsusage 2>/dev/null         # Discard error message for this test

exit $EX_FATAL
