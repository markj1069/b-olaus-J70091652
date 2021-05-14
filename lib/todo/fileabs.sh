# Return the absolute filename with path.
#
function fileabs {                # What is the absolute filename?

    local FL="$1"                 # Capture the arguement.
    local FN=$(filename "$FL")    # Grab the filename.
    local FP=$(filepath "$FL")    # Grab the filepath.
    local RC=$EX_OK               # Set the default return code.


    if [[ "$FL" = "." ]]          # Process current directory
    then
        len=${#PWD}               # Remove trailing NL
        FILEABS=${PWD:0:$len}     # using zero origin indexing.
    else
        builtin pushd "$FL" >/dev/null
        RC=$?
        if [[ $RC = 0 ]]
        then
            RC=$EX_MISSINGFILE
            errmsg 7004 $EX_MISSINGFILE "${FUNCNAME}: Desired directory missing from system."
        else
            len=${#PWD}               # Remove trailing NL
            FILEABS=${PWD:0:$len}     # using zero origin indexing.
            builtin popd       >/dev/null
            RC=$?
            if [[ $RC != $EX_OK ]]
            then
                errmsg 7005 $EX_OSERR "${FUNCNAME}: Cannot return to original directory."
            fi
    fi

    builtin printf "%s" "$FILEABS"            # Return the absolute filename.
    return $EX_OK                              # Set return code.
} # fileabs
