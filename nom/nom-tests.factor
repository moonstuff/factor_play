! Copyright (C) 2011 moonstuff
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test nom ;
USING: kernel sequences namespaces locals assocs ;
IN: nom.tests

: nom-test ( q r -- ) nom-clear unit-test ;

! nom-init sets up a few big-ol assocs
{ t t }
[
    nom-init
    appearances get-global assoc?
    stats get-global assoc?
] unit-test

! Should record an appearance in the appearances assoc
{ 1 t } 
[    
    [ "id" "session" "user" "appearance" "1234567" "3" ]
    record-appearance
    "1234567" appearances get-global at*
] nom-test

! Should record an appearance in the stats assoc
{ 1 t } 
[    
    [ "id" "session" "user" "appearance" "1234567" "3" ]
    record-appearance
    "appearances" stats get-global at*
] nom-test

! Should record a search in the stats assoc
{ 1 t } 
[    
    [ "id" "session" "user" "search" "1234567" ]
    record-search
    "searches" stats get-global at*
] nom-test

! Should record a click in the stats assoc
{ 1 t } 
[    
    [ "id" "session" "user" "click" "1234567" "1" ]
    record-click
    "clicks" stats get-global at*
] nom-test

! nom-cleanup deletes the assocs
{ f f f f }
[
    nom-cleanup
    appearances global at*
    stats global at*
]  nom-test

