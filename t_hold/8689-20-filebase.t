#! /usr/lib/env bash

source ../lib/filebase.sh
source ../lib/is.sh

# Unit test for filebase function

FL="/qqq/rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filebase "$FL")
is "$FN" "vvv_www.yyy" "Extract base from absolute filename"

FL="rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filebase "$FL")
is "$FN" "vvv_www.yyy" "Extract base from partial filename"

FL="vvv_www.yyy.zzz"
FN=$(filebase "$FL")
is "$FN" "vvv_www.yyy" "Extract base from simple filename"

FL="rrr/sss/ttt.uuu/vvv_www"
FN=$(filebase "$FL")
is "$FN" "vvv_www" "Extract base from partial filename w/o suffix"

FL="."
FN=$(filebase "$FL")
is "$FN" "" "Extract base from home directory, '.'"

FL="~"
FN=$(filebase "$FL")
is "$FN" "~" "Extract base from home directory, '~'" "FN='$FN'"

FL=""
FN=$(filebase "$FL")
is "$FN" "" "Extract base from empty string. Returns null string." "FN='$FN'"

FL="/qqq/rrr/sss/ttt.uuu/vvv www.yyy.zzz"
FN=$(filebase "$FL")
is "$FN" "vvv www.yyy" "Extract filename with blank in filename" "FN='$FN'"

FL="/qqq/rrr/sss/ttt uuu/vvv www.yyy.zzz"
FN=$(filebase "$FL")
is "$FN" "vvv www.yyy" "Extract filename with blank in filename and path" "FN='$FN'"
