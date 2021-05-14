# olsversion -- Process version option

function olsversion()
{
    if [[ $# -eq 0 ]]
    then
        olserr 7000 $EX_SOFTWARE "${FUNCNAME}: missing arguments: 1–3, version, copyright and license"
    fi
    if [[ $# -ge 1 ]]
    then
        printf "%s\n" "Version:   $1"  # We do have a version argument.
        olserr 7000 $EX_WARNING "${FUNCNAME}: missing arguments: 2–3, copyright and license"
    fi
    if [[ $# -ge 2 ]]
    then
        printf "%s\n" "Copyright: $2"  # We now know that we have a copyright argument as well.
        olserr 7000 $EX_WARNING "${FUNCNAME}: missing argument: 3, license"
    fi
    
    printf "%s\n" "License:   $3"      # We now know that we also have a license argument.

    olsend

} # olsversion
