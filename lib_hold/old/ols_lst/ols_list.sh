#$Id: nuf.sh 94 2006-09-15 11:54:07Z a0214394 $

cat >/dev/null <<'/*'

=head1 NAME

ols_list - Special Linear lists

=head1 SYNOPSIS

ols_list 

=head1 DESCRIPTION

Olaus Library implementation of the three special linear lists:

=over 4

=item Stack

=item Queue

=item Deque

=back

    X[1], X[2], ... X[M]
    T points to the tail of the list.
    H points to an empty cell before the head of the list
    There must be at least one empty element in X.

=head2 X <== Y: Insert into Tail of List

    if T = M then T <-- 1 else T <-- T + 1
    if T = H then OVERFLOW
    X[T] <-- Y

=head2 Y <== X: Delete from Head of List

    if H = T then UNDERFLOW
    Y <-- X[H]
    if H = M then H <-- 1 else H <-- H + 1

=head2 X <== Y: Insert onto Head of List

    X[H] <-- Y
    if H = 1 then H <-- M else H <-- H - 1
    if H = T then OVERFLOW

=head2 Y <== X: Delete from Tail of List

    if T = H then UNDERFLOW
    Y <-- X[T]
    if T = 1 then T <-- M else T <-- T - 1

=head1 SUBROUTINES/FUNCTIONS/METHODS

=head2 Stack

Linear list with all insertions, deleations, and accesses
are all made at one end of the list

=head3 Valid Queue Operations

=over 4

=item list_new_stack

=item list_push

=item list_pop

=itme list_head

=item list_push_head

=item list_pop_head

=item list_size

=item list_empty

=item list_type

=back


=head3 list_new_stack STACK

=head3 list_new_queue QUEUE

=head3 list_new_deque DEQUE

=head3 stack_push STACK item

=head3 stack_top STACK

=head3 stack_pop STACK

=head3 stack_empty STACK

=head3 list_size STACK

=head3 list_push_head

=head3 list_push_tail

=head3 list_pop_head

=head3 list_pop_tail

=head3 list_type

=head2 Queue

Linear list with all insertions are made at one end of the list and
deleations and accesses are made at the other end of the list.

=head3 Valid Queue Operations

=over 4

=item list_new_queue

=item list_push

=item list_pop

=item list_head

=item list_push_tail

=item list_pop_head

=item list_size

=item list_empty

=item list_type

=back


=head2 Deque

Linear list with all inserstions, deleations, and accesses
are made at both ends of the list.

=head3 Valid Queue Operations

=over 4

=item list_new_deque

=item list_push

=item list_pop

=item list_head

=item list_tail

=item list_push_head

=item list_push_tail

=item list_pop_head

=item list_pop_tail

=item list_size

=item list_empty

=item list_type

=back

=head1 ARGUMENTS

=over 4

=back

=head1 SECURITY

=head1 AVAILABILITY

=head1 EXAMPLES

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=head1 ENVIRONMENT

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-23 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

Donald E. Knuth, I<The Art of Computer Programming, Volume 1 /
Fundamental Algorithms>, Second Edition,
Addison-Wesley, Reading, 1978

=head1 BUGS

=head1 SEE ALSO

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2006 Texas Instruments. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

=over 4

=item 1.

Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

=item 2.

Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

=back

THIS SOFTWARE IS PROVIDED BY TEXAS INSTRUMENTS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL TEXAS INSTRUMENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

The views and conclusions contained in the software and
documentation are those of the authors and should not be interpreted
as representing official policies, either expressed or implied, of
Texas Instruments.

=cut

/*
declare -i -r OLSSTACK=236887691 # Stack Magic Identifier
declare -i -r OLSQUEUE=256203221 # Queue Magic Identifier 
declare -i -r OLSDEQUE=275604541 # Deque Magic Identifier
declare -i -r OLSMAXQ=2147483647 # Maximum Number of Elements
declare -i -r OLSMINQ=3  # Initial index value

function list_stack_new() {      # Create an empty stack
    if [[ -z "$1" ]]; then
        error_exit "list_stack_new: missing argument 1, stack"
    else
        local stack=$1
    fi

    eval "${stack}[0]=$OLSSTACK" # Identify this list as a stack
    eval "${stack}[1]=$OLSMINQ"  # Head index of list
    eval "${stack}[2]=$OLSMINQ"  # Tail index of list

    return $EX_OK
} # end list_stack_new

function list_queue_new() {      # Create an empty queue
    if [[ -z "$1" ]]; then
        error_exit "list_queue_new: missing argument 1, queue"
    else
        local queue=$1
    fi

    eval "${queue}[0]=$OLSQUEUE" # Identify this list as a queue
    eval "${queue}[1]=$OLSMINQ"  # Head index of list
    eval "${queue}[2]=$OLSMINQ"  # Tail index of list
    
    return $EX_OK
} # end list_queue_new

function list_deque_new() {      # Create an empty deque
    if [[ -z "$1" ]]; then
        error_exit "list_deque_new: missing argument 1, deque"
    else
        local deque=$1
    fi

    eval "${deque}[0]=$OLSDEQUE" # Identify this list as a deque
    eval "${deque}[1]=$OLSMINQ"  # Head index of list
    eval "${deque}[2]=$OLSMINQ"  # Tail index of list
    
    return $EX_OK
} # end list_deque_new

function list_push_head() {      # Insert into Head of List
  # X <== Y: Insert into Head of List

  # X[H] <-- Y
  # if H = 1 then H <-- M else H <-- H - 1
  # if H = T then OVERFLOW

    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2001 "list_push_head: missing argument 1, list"
    else
        local list=$1
    fi
    local element="$2"

    local -i magic
    eval "magic=\${${list}[0]}"  # Checking on the list ID.
    [[ "$magic" -eq "$OLSSTACK" ]] || [[ "$magic" -eq "$OLSQUEUE" ]] || \
    [[ "$magic" -eq "$OLSDEQUE" ]] || \
    errmsg $EX_DATAERR 2027 "list_pop_head: $list is not a valid LIST."

    local -i head                # Head index of list
    local -i tail                # Tail index of list
    eval "head=\${${list}[1]}"
    eval "tail=\${${list}[2]}"

  # X[H] <-- Y
    eval "${list}[$head]='$element'" # Save the element in the list

  # if H = 1 then H <-- M else H <-- H - 1
    if [[ $head -eq $OLSMINQ ]]; then
        head=$OLSMAXQ
    else
        head=$((head-1))
    fi

  # if H = T then OVERFLOW
    if [[ $head -eq $tail    ]]; then
        errmsg $EX_DATAERR 2026 "list_push_head: $list List Overflow"
    fi

    eval "${list}[1]=$head"      # Save the tail index in the array
    return $EX_OK
} # end list_push_head

function list_push_tail() {      # Insert into Tail of List

  # X <== Y: Insert into Tail of List
  # if T = M then T <-- 1 else T <-- T + 1
  # if T = H then OVERFLOW
  # X[T] <-- Y

    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2001 "list_push_tail: missing argument 1, list"
    else
        local list=$1
    fi
    local element="$2"

    local -i magic
    eval "magic=\${${list}[0]}"  # Checking on the list ID.
    [[ "$magic" -eq "$OLSQUEUE" ]] || [[ "$magic" -eq "$OLSDEQUE" ]] || \
    errmsg $EX_DATAERR 2025 "list_push_tail: $list is a STACK. Can't push at tail of stack."

    local -i head                # Head index of list
    local -i tail                # Tail index of list
    eval "head=\${${list}[1]}"
    eval "tail=\${${list}[2]}"

  # if T = M then T <-- 1 else T <-- T + 1
    if [[ $tail -eq $OLSMAXQ ]]; then
        tail=$OLSMINQ
    else
        tail=$((tail+1))
    fi

  # if T = H then OVERFLOW
    if [[ $tail -eq $head    ]]; then
        errmsg $EX_DATAERR 2026 "list_push_tail: $list List Overflow"
    fi

  # X[T] <-- Y
    eval "${list}[$tail]='$element'"

    eval "${list}[2]=$tail"      # Save the tail index in the array
    return $EX_OK
} # end list_push_tail

function list_pop_head() {       # Remove element from head of list
  # Y <== X: Delete from Head of List

  # if H = T then UNDERFLOW
  # if H = M then H <-- 1 else H <-- H + 1
  # Y <-- X[H]

    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2001 "list_pop_head: missing argument 1, list"
    else
        local list=$1
    fi

    local -i magic
    eval "magic=\${${list}[0]}"  # Checking on the list ID.

    [[ "$magic" -eq "$OLSSTACK" ]] || [[ "$magic" -eq "$OLSQUEUE" ]] || \
    [[ "$magic" -eq "$OLSDEQUE" ]] || \
    errmsg $EX_DATAERR 2027 "list_pop_head: $list is not a valid LIST."

    local -i head                # Head index of list
    local -i tail                # Tail index of list
    eval "head=\${${list}[1]}"   # Pull the head from the array
    eval "tail=\${${list}[2]}"   # Pull the tail from the array

  # if H = T then UNDERFLOW
    if [[ $head -eq $tail ]]; then  # Signal an UNDERFLOW through
        return $EX_WARNING          # the exit code.
    fi

  # if H = M then H <-- 1 else H <-- H + 1
    if [[ $head -eq $OLSMAXQ ]]; then
        head=$OLSMINQ
    else
        head=$((head+1))
    fi

  # Y <-- X[H]
    eval "OLSELEMENT=\${$list[$head]}" # Save the element from the list
    eval "unset $list[$head]"    # Remove the element from the list

    eval "${list}[1]=$head"      # Save the head index in the array
    return $EX_OK
} # end list_pop_head

function list_pop_tail() {       # Remove element from tail of list
  # Y <== X: Delete from Tail of List

  # if T = H then UNDERFLOW
  # Y <-- X[T]
  # if T = 1 then T <-- M else T <-- T - 1

    if [[ -z "$1" ]]; then
        errmsg $EX_USAGE 2001 "list_pop_tail: missing argument 1, list"
    else
        local list=$1
    fi

    local -i magic
    eval "magic=\${${list}[0]}"  # Checking on the list ID.
    [[ "$magic" -eq "$OLSQUEUE" ]] || [[ "$magic" -eq "$OLSDEQUE" ]] || \
    errmsg $EX_DATAERR 2027 "list_pop_tail: $list is not a valid LIST."

    local -i head                # Head index of list
    local -i tail                # Tail index of list
    eval "head=\${${list}[1]}"   # Pull the head from the array
    eval "tail=\${${list}[2]}"   # Pull the tail from the array

  # if T = H then UNDERFLOW
    if [[ $tail -eq $head ]]; then  # Signal an UNDERFLOW through
        return $EX_WARNING          # the exit code.
    fi

  # Y <-- X[T]
    eval "OLSELEMENT=\${$list[$tail]}" # Save the element in the list
    eval "unset $list[$tail]"    # Remove the element from the list

  # if T = 1 then T <-- M else T <-- T - 1
    if [[ $tail -eq $OLSMINQ ]]; then
        tail=$OLSMAXQ
    else
        tail=$((tail-1))
    fi

    eval "${list}[2]=$tail"      # Save the head index in the array
    return $EX_OK
} # end list_pop_tail

function list_stack_del() {      # Create an empty stack
    if [[ -z "$1" ]]; then
        errmsg EX_USAGE 2001 "list_stack_del: missing argument 1, stack"
    else
        local stack=$1
    fi

    local magic
    eval "magic=\${${stack}[0]}"
    if [[ "$magic" = "$OLSSTACK" ]]; then
        eval "unset $stack"
    else
        errmsg $EX_DATAERR 2024 "list_stack_del: $stack is not a STACK."
    fi

    return $EX_OK
} # end list_stack_del

function list_queue_del() {      # Create an empty queue
    if [[ -z "$1" ]]; then
        error_exit "list_queue_del: missing argument 1, queue"
    else
        local queue=$1
    fi

    local magic
    eval "magic=\${${queue}[0]}"
    if [[ "$magic" = "$OLSQUEUE" ]]; then
        eval "unset $queue"
    else
        errmsg $EX_DATAERR 2025 "list_queue_del: $queue is not a QUEUE."
    fi
   
    return $EX_OK
} # end list_queue_del

function list_deque_del() {      # Create an empty deque
    if [[ -z "$1" ]]; then
        error_exit "list_deque_del: missing argument 1, deque"
    else
        local deque=$1
    fi

    local magic
    eval "magic=\${${deque}[0]}"
    if [[ "$magic" = "$OLSDEQUE" ]]; then
        eval "unset $deque"
    else
        errmsg $EX_DATAERR 2026 "list_deque_del: $deque is not a DEQUE."
    fi
   
    return $EX_OK
} # end list_deque_del

function list_queue_push() {
    if [[ -z "$1" ]]; then
        errmsg EX_USAGE 2001 "list_queue_push: missing argument 1, queue"
    else
        local queue=$1
    fi
    local element="$2"

    list_push_tail $1 "$2"

} # end list_queue_push

function list_queue_pop() {
    if [[ -z "$1" ]]; then
        errmsg EX_USAGE 2001 "list_queue_pop: missing argument 1, queue"
    else
        local queue=$1
    fi

    list_pop_head $1

} # end list_queue_pop

