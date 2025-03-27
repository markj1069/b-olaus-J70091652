function is_ureal() {

#   Synopsis - is_ureal NUM
    
    if [[ "$1" =~ '^[+-]?[[:digit:]]+([.][[:digit:]]+?$)' ]]; then
        echo "$1 Not a real number"
    else
        echo "$1 is a real number"
    fi
    return 0
} # is_real

function is_uint() {

#   Synopsis - is_ureal NUM

    if [[ "$1" =~ '^[[:digit:]]+$)' ]]; then
        echo "$1 Not an unsigned integer"
    else
        echo "$1 is a real number"
    fi
    exit 0
} # is_unit




function is_ureal() {

#   Synopsis - is_real NUM
    
    if [[ "$1" =~ '^[[:digit:]]+([.][[:digit:]]+?$)' ]]; then
        echo "$1 Not a real number"
    else
        echo "$1 is a real number"
    fi
    return 0

} # is_real
