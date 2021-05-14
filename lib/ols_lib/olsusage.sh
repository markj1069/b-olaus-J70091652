# olsusage--Print Program Synopsys and Exit

function olsusage()
{
    if [[ $# -eq 0 ]]        # At least one argument is required by olsusage
    then
        olserr 7000 $EX_SOFTWARE  "olsusage: Missing required synopsys argument"
        olsend               # Exit program with EX_CODE of $EX_SOFTWARE
    fi

    printf "%s\n" "Usage:"   # Print usage tag
    printf "%s\n" "$*"       # Print the usage string

    olssetex $EX_OK
    olsend                   # Exit program
    
} # end olsusage

