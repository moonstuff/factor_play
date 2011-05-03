! Copyright (C) 2011 moonstuff
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences unicode.categories unicode.case ;
IN: palindrome

: palindrome? ( string -- ? ) 
    [ Letter? ] filter >lower
    dup reverse = ;
