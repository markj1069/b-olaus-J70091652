function filebase {                            # What is the basename?
  local BN; local FN; local FL=$1              # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
  FN=${FL##*/}                                 # vvv_www.yyy.zzz
  BN=${FN%.*}                                  # vvv_www.yyy
  builtin echo $BN                             # Return the basename
  return $EX_OK
} # filebase

function filename {                            # What is the filename?
  local FN; local FL=$1                        # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
  FN=${FL##*/}                                 # vvv_www.yyy.zzz
  builtin echo $FN                             # Return the filename.
  return $EX_OK
} # filename

function filepath {                            # What is the path on a filename?
  local FP; local FL=$1                        # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
  FP=${FL%/*}                                  # rrr/sss/ttt.uuu
  if [ "$FP" = "$FL" ]; then FP="."; fi        # Set path to . if missing
  builtin echo $FP                             # Return the path
  return $EX_OK
} # filepath

function filesffx {                            # What is the suffex on a filename?
  local SX; local FL=$1                        # rrr/sss/ttt.uuu/vvv_www.yyy.zzz
  SX=${FL##*\.}                                # SX=zzz with bash pattern matching
  if [ "$SX" = "$FL" ]; then SX=""; fi         # There may not be a suffex.
  builtin echo $SX                             # Return the suffex.
  return $EX_OK
} # filesfx

function fileabs {                             # What is the absolute filename?
  local FN, FP
  FP=$(filepath $1)
  FN=$(filename $1)
  pushd $FP
  FP=$PWD
  popd
  builtin echo $FP/$FN
  return $EX_OK
} # fileabs