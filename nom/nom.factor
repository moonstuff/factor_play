! Copyright (C) 2011 moonstuff
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences io splitting locals prettyprint 
combinators hashtables namespaces assocs ;
IN: nom

ERROR: invalid-record record ;
ERROR: unknown-event-type event-type ;

SYMBOL: appearances
SYMBOL: stats


: record-appearance ( row -- ) 
    4 swap nth ! get the url
    appearances get-global inc-at
    "appearances" stats get-global inc-at
    ;

: record-search ( row -- )
    drop
    "searches" stats get-global inc-at
    ;

: record-click ( row -- )
    drop
    "clicks" stats get-global inc-at
    ;

: aggregate-line ( ... line -- ... )
    dup "," split
    3 swap nth ! index 3 (4th column) is event type
    { 
        { "appearance" [ record-appearance ] }
        { "search" [ record-search ] }
        { "click" [ record-click ] }
        [ \ unknown-event-type boa throw ]
    } case
    ;

: print-stats ( -- )
    appearances get-global .
    stats get-global .
    ;

: nom-clear ( -- )
    appearances get-global clear-assoc
    stats get-global clear-assoc
    ;

: nom-init ( -- )
    1000000 <hashtable> appearances set-global 
    5 <hashtable> stats set-global 
    ;
    
: nom-cleanup ( -- )
    appearances global delete-at
    stats global delete-at
    ;

: nom ( -- )
    nom-init
    [ aggregate-line ] each-line
    print-stats
    nom-cleanup
    ;

MAIN: nom
