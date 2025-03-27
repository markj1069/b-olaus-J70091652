#! /usr/lib/env bash

source ../lib/ols_def.sh
source ../lib/filesfx.sh
source ../lib/is.sh

# Unit test for filebase function

FL="/qqq/rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filesfx "$FL")
RC=$?
is "$FN" "zzz" "Extract suffix from absolute filename"
is $RC 0 "Expected RC=EX_OK"

FL="rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filesfx "$FL")
RC=$?
is "$FN" "zzz" "Extract suffix from partial filename"
is $RC 0 "Expected RC=EX_OK"

FL="vvv_www.yyy.zzz"
FN=$(filesfx "$FL")
RC=$?
is "$FN" "zzz" "Extract suffix from simple filename"
is $RC 0 "Expected RC=EX_OK"

FL="rrr/sss/ttt.uuu/vvv_www"
FN=$(filesfx "$FL")
RC=$?
is "$FN" "" "Extract suffix from partial filename w/o suffix"
is $RC $EX_WARNING "Expected RC=EX_WARNING"

FL="."
FN=$(filesfx "$FL")
RC=$?
is "$FN" "" "Extract suffix from home directory, '.'" "FN='$FN'"
is $RC $EX_WARNING "Expected RC=EX_WARNING"

FL="~"
FN=$(filesfx "$FL")
RC=$?
is "$FN" "" "Extract suffix from home directory, '~'" "FN='$FN'"
is $RC $EX_WARNING "Expected RC=EX_WARNING"

FL=""
FN=$(filesfx "$FL")
RC=$?
is "$FN" "" "Extract suffix from empty string. Returns null string." "FN='$FN'"
is $RC $EX_WARNING "Expected RC=EX_WARNING"

FL="/qqq/rrr/sss/ttt.uuu/vvv www.yyy.zzz"
FN=$(filesfx "$FL")
RC=$?
is "$FN" "zzz" "Extract suffix with blank in filename" "FN='$FN'"
is $RC 0 "Expected RC=EX_OK"

FL="/qqq/rrr/sss/ttt uuu/vvv www.yyy.zzz"
FN=$(filesfx "$FL")
RC=$?
is "$FN" "zzz" "Extract suffix with blank in filename and path" "FN='$FN'"
is $RC 0 "Expected RC=EX_OK"
