# is - compare two arguments with = to determine success

function is() {

    OLSTST_NO=$((OLSTST_NO+1))
    if [ "$1" = "$2" ]; then printf "ok"
    else                     printf "not ok"
    fi
    printf " $OLSTST_NO $3"
    if [[ -n "$4" ]]; then printf " # $4"; fi
    printf "\n"
 
    return $EX_OK
} # end is

cat << "/*"


/*
