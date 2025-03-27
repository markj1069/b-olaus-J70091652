#! /usr/lib/env bash

source ../lib/ols_def.sh
source ../lib/filepath.sh
source ../lib/is.sh

FILEPATH="$PWD"

# Unit test for filebase function

FL="/qqq/rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filepath "$FL")
is "$FN" "/qqq/rrr/sss/ttt.uuu" "Extract path from absolute filename" "FN='$FN'"

FL="rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filepath "$FL")
is "$FN" "rrr/sss/ttt.uuu" "Extract path from partial filename"

FL="vvv_www.yyy.zzz"
FN=$(filepath "$FL")
is "$FN" "$FILEPATH" "Extract path from simple filename" "FN='$FN'"

FL="rrr/sss/ttt.uuu/vvv_www"
FN=$(filepath "$FL")
is "$FN" "rrr/sss/ttt.uuu" "Extract path from partial filename w/o suffix"

FL="."
FN=$(filepath "$FL")
is "$FN" "$FILEPATH" "Extract path from home directory, '.'" "FN='$FN'"

FL="~"
FN=$(filepath "$FL")
is "$FN" "$FILEPATH" "Extract path from home directory, '~'" "FN='$FN'"

FL=""
FN=$(filepath "$FL")
is "$FN" "$FILEPATH" "Extract path from empty string. Returns null string." "FN='$FN'"

FL="/qqq/rrr/sss/ttt.uuu/vvv www.yyy.zzz"
FN=$(filepath "$FL")
is "$FN" "/qqq/rrr/sss/ttt.uuu" "Extract path with blank in filename" "FN='$FN'"

FL="/qqq/rrr/sss/ttt uuu/vvv www.yyy.zzz"
FN=$(filepath "$FL")
is "$FN" "/qqq/rrr/sss/ttt uuu" "Extract path with blank in filename and path" "FN='$FN'"

FL="/qqq/rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filepath "$FL")
RC=$?
is "$RC" "$EX_OK" "Expected return code is EX_OK"
