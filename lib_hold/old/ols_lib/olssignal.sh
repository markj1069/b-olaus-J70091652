# olssignal -- Process interupts

function olssignal() {

    case "$1" in
        EXIT    )   ols_end;;
        i       )   echo $OPTOPT: $OPTARG;;
        output  )   echo $OPTOPT: $OPTARG;;
        o       )   echo $OPTOPT: $OPTARG;;
        help    )   ols_help;;
        h       )   ols_help;;
        man     )   ols_man;;
        m       )   ols_man;;
        usage   )   ols_usage;;
        u       )   ols_usage;;
        debug   )   DEBUG=Y;;
        d       )   DEBUG=Y;;
        version )   ols_version;;
        V       )   ols_version;;
        verbose )   VERBOSE=Y;;
        v       )   VERBOSE=Y;;
    esac

    olsend

} # olssignal