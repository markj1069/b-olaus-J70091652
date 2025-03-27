function is_ureal() {

#   Synopsis - is_ureal NUM
    
    if [[ "$1" =~ ^[[:digit:]]+[.][[:digit:]]*$ ]]; then
        return $SUCCESS
    else
        return $FAIL
    fi

} # is_real

function is_uint() {

#   Synopsis - is_uint

    if [[ "$1" =~ ^[[:digit:]]+$ ]]; then
        return $SUCCESS
    else
        return $FAIL
    fi

} # is_unit

function is_int {
#   Synopsis - is_int

    if [[ "$1" =~ ^[+-]*[[:digit:]]+$ ]]; then
        return $SUCCESS
    else
        return $FAIL
    fi

}



function is_real() {

#   Synopsis - is_real NUM
    
    if [[ "$1" =~ ^[+-]*[[:digit:]]+[.][[:digit:]]*$ ]]; then
        return $SUCCESS
    else
       return $FAIL
    fi

} # is_real
