! Copyright (C) 2011 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test palindrome ;
IN: palindrome.tests

[ t ] [ "racecar" palindrome? ] unit-test
[ f ] [ "foocar" palindrome? ] unit-test
[ t ] [ "A man, a plan, a canal: Panama." palindrome? ] unit-test

