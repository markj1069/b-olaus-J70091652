#================== Olaus General Symbol Definitions ===================

# $Id: olaus_def.sh 203 2007-05-09 17:38:51Z a0214394 $
# $URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/lib/olaus_def.sh $

if [[ -z "$OLSDEF" ]]; then

    declare    -r TRUE="T"
    declare    -r FALSE="F"

  # Exit code definitions:
    declare -i -r EX_OK=0               # Successful termination
    declare -i -r EX_WARNING=4          # Warning
    declare -i -r EX_ERROR=8            # Error
    declare -i -r EX_SEVERE=12          # Severe error
    declare -i -r EX_FATAL=16           # Fatal error
    declare -i -r EX_BASE=64            # Base value for error messages
    declare -i -r EX_USAGE=64           # Command line usage error
    declare -i -r EX_DATAERR=65         # Data format error
    declare -i -r EX_NOINPUT=66         # Cannot open input
    declare -i -r EX_NOUSER=67          # Addressee unknown
    declare -i -r EX_NOHOST=68          # Host name unknown 
    declare -i -r EX_UNAVAILABLE=69     # Service unavailable
    declare -i -r EX_SOFTWARE=70        # Internal software error
    declare -i -r EX_OSERR=71           # System error (e.g., can't fork)
    declare -i -r EX_OSFILE=72          # Critical OS file missing
    declare -i -r EX_CANTCREAT=73       # Can't create (user) output file
    declare -i -r EX_IOERR=74           # Input/output error
    declare -i -r EX_TEMPFAIL=75        # Temp failure; user is invited to retry
    declare -i -r EX_PROTOCOL=76        # Remote error in protocol
    declare -i -r EX_NOPERM=77          # Permission denied
    declare -i -r EX_CONFIG=78          # Configuration error
    declare -i -r EX_MISSINGFILE=79     # A file is missing
    declare -i -r EX_CANTC8TEMP=80      # Can't create temporary file
    declare -i -r EX_ASSERTFAIL=81      # Assertion failed
    declare -i -r EX_CANTC8LOCK=82      # Can't create lock file.
    declare -i -r EX_USERABORT=83       # Aborted by user
    declare -i -r EX_TERMINATION=84     # Trapped termination interrupt
    declare -i -r EX_TRAPINT=85         # Trapped interrupt
    declare -i -r EX_TESTMAXERR=254     # Maximum error count for Olaus Test
    declare -i -r EX_TESTBAIL=255       # BAIL_OUT function terminated script
    declare -i    EX_CODE=$EX_OK        # Initialize Exit Code to OK

  # Special Linear List definitions:
  # declare -i -r OLSSTACK=236887691    # Stack Magic Identifier
  # declare -i -r OLSQUEUE=256203221    # Queue Magic Identifier 
  # declare -i -r OLSDEQUE=275604541    # Deque Magic Identifier
  # declare -i -r OLSMAXQ=2147483647    # Maximum Number of Elements
  # declare -i -r OLSMINQ=3             # Initial index value
  # declare       OLSELEMENT            # List routine return value
  # declare -i    OLSLISTSIZE           # Number of elements returned by list_size

  # Temporary file definitions:
    declare -a    OLSTMPQUEUE           # Temporary filename queue
    declare       OLSTMPFILE            # Return the temporary filename

  # Test harness definitions:
    declare -i -r OLSTST_NOPLAN=0       # Signal no test plan
    declare -i    OLSTST_NO=0           # Initialize test plan number.
    
  # Switch to load definitions one time.
    declare    -r OLSDEF=$TRUE          # OLSDEF=T ==> olaus_def loaded.

fi # if [[ -z "$OLSDEF" ]]
