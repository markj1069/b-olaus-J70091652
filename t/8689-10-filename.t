#! /usr/lib/env bash

source ../lib/filename.sh
source ../lib/is.sh

# Unit test for filename function

FL="/qqq/rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filename "$FL")
is "$FN" "vvv_www.yyy.zzz" "Extract filename from absolute filename"

FL="rrr/sss/ttt.uuu/vvv_www.yyy.zzz"
FN=$(filename "$FL")
is "$FN" "vvv_www.yyy.zzz" "Extract filename from partial filename"

FL="vvv_www.yyy.zzz"
FN=$(filename "$FL")
is "$FN" "vvv_www.yyy.zzz" "Extract filename from simple filename"

FL="rrr/sss/ttt.uuu/vvv_www"
FN=$(filename "$FL")
is "$FN" "vvv_www" "Extract filename from partial filename w/o suffix"

FL="."
FN=$(filename "$FL")
is "$FN" "." "Extract filename from home directory, '.'"

FL="~"
FN=$(filename "$FL")
is "$FN" "~" "Extract filename from home directory, '~'"

FL=""
FN=$(filename "$FL")
is "$FN" "" "Extract filename from empty string. Returns null string."

FL="/qqq/rrr/sss/ttt.uuu/vvv www.yyy.zzz"
FN=$(filename "$FL")
is "$FN" "vvv www.yyy.zzz" "Extract filename with blank in filename"

FL="/qqq/rrr/sss/ttt uuu/vvv www.yyy.zzz"
FN=$(filename "$FL")
is "$FN" "vvv www.yyy.zzz" "Extract filename with blank in filename and path"
