# olsusage.sh Test Function with Version, Copyright and License Arguements Missing

source ../lib/OLSLIB
source ../lib/OLSTST

PGMID=OLSTST

olsversion 2>&1

exit $EX_FATAL               # Should never get here.
