#================== Olaus General Symbol Definitions ===================

if [[ -z "$OLS_DEF" ]]; then

    declare    -r -x TRUE=1
    declare    -r -x FALSE=0
    declare    -r -x SUCCESS=0
    declare    -r -x FAIL=1

  # Exit code definitions:
    declare -i -r -x EX_OK=0            # Successful termination
    declare -i -r -x EX_WARNING=4       # Warning
    declare -i -r -x EX_ERROR=8         # Error
    declare -i -r -x EX_SEVERE=12       # Severe error
    declare -i -r -x EX_FATAL=16        # Fatal error
    declare -i -r -x EX_BASE=64         # Base value for error messages
    declare -i -r -x EX_USAGE=64        # Command line usage error
    declare -i -r -x EX_DATAERR=65      # Data format error
    declare -i -r -x EX_NOINPUT=66      # Cannot open input
    declare -i -r -x EX_NOUSER=67       # Addressee unknown
    declare -i -r -x EX_NOHOST=68       # Host name unknown 
    declare -i -r -x EX_UNAVAILABLE=69  # Service unavailable
    declare -i -r -x EX_SOFTWARE=70     # Internal software error
    declare -i -r -x EX_OSERR=71        # System error (e.g., can't fork)
    declare -i -r -x EX_OSFILE=72       # Critical OS file missing
    declare -i -r -x EX_CANTCREAT=73    # Can't create (user) output file
    declare -i -r -x EX_IOERR=74        # Input/output error
    declare -i -r -x EX_TEMPFAIL=75     # Temp failure; user is invited to retry
    declare -i -r -x EX_PROTOCOL=76     # Remote error in protocol
    declare -i -r -x EX_NOPERM=77       # Permission denied
    declare -i -r -x EX_CONFIG=78       # Configuration error
    declare -i -r -x EX_MISSINGFILE=79  # A file is missing
    declare -i -r -x EX_CANTC8TEMP=80   # Can't create temporary file
    declare -i -r -x EX_ASSERTFAIL=81   # Assertion failed
    declare -i -r -x EX_CANTC8LOCK=82   # Can't create lock file.
    declare -i -r -x EX_USERABORT=83    # Aborted by user
    declare -i -r -x EX_TERMINATION=84  # Trapped termination interrupt
    declare -i -r -x EX_TRAPINT=85      # Trapped interrupt
    declare -i -r -x EX_TESTMAXERR=254  # Maximum error count for Olaus Test
    declare -i -r -x EX_TESTBAIL=255    # BAIL_OUT function terminated script
    declare -i    -x EX_CODE=$EX_OK     # Initialize Exit Code to OK

  # Test harness definitions:
    declare -i -r -x OLS_TST_INIT=0     # Start with test number zero.
    
  # Switch to load definitions one time.
    declare    -r -x OLS_DEF=$TRUE          # OLSDEF=T ==> ols_def has been loaded.

fi # if [[ -z "$OLS_DEF" ]]
