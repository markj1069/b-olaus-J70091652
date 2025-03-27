#! /usr/bin/env bash

PGMID=OLSTST
OLSLIB="../lib/OLSLIB"
OLSTST="../lib/OLSTST"
source "$OLSLIB"
source "$OLSTST"

VERSION="A4.2.9"
COPYRIGHT="(c) 2020. Mark Jensen, All Rights Reserved."
LICENSE="BSD 2-Clause License"

strhold=$(mktemp)
cat > $strhold << '/*'
Version:   A4.2.9
Copyright: (c) 2020. Mark Jensen, All Rights Reserved.
License:   BSD 2-Clause License
/*
v1=$( cat "$strhold" )
rm "$strhold"

tst_plan 8         

# call olsusage with simple string.
pl=$( bash 0450-olsversion.sh "$VERSION" "$COPYRIGHT" "$LICENSE" 2>&1 )
RC=$?
is  $RC   $EX_OK    "version-rc"
is "$pl" "$v1"  "version-output"


# call olsusage with a long synopsis containing newlines.
pl=$( bash 0460-olsversion.sh "$VERSION" "$COPYRIGHT" )
RC=$?
v2="OLSTST7000F olsversion: missing argument: 3, license"
is  $RC   $EX_SOFTWARE "version-missing-license-rc"
is "$pl" "$v2"         "version-missing-license"


# call olsusage without an argument.
pl=$( bash 0470-olsversion.sh "$VERSION" )
RC=$?
v3="OLSTST7000F olsversion: missing arguments: 2–3, copyright and license"
is  $RC  $EX_SOFTWARE  "version-missing-copyright-license-rc"
is "$pl" "$v3"         "version-missing-copyright-license"


# call olsusage without an argument test error message.
pl=$( bash 0480-olsversion.sh )
RC=$?
v4="OLSTST7000F olsversion: missing arguments: 1–3, version, copyright and license"
is  $RC   $EX_SOFTWARE "version-missing-version-copyright-license-rc"
is "$pl" "$v4"         "version-missing-version-copyright-license"
