# Remove Temporary Files

# Dummy Function for Now

function ols_rmtemp ()
{

return $EX_OK

 # Remove any temporary files.
    if [[ -n $OLSMKT ]]; then
        while read file; do
            if [[ -e "$file" ]]; then
                rm -f "$file" \
                    || ols_err $EX_ERROR 2004 "ols_clean: cannot remove temporary file, $OLSMKT" >&2
            fi
        done <$OLSMKT
    fi
return

} # ols_rmtemp
