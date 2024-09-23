#!/usr/bin/perl -s

use v5.24;
use Test2::V0;
use List::Util qw(reduce max);
use experimental 'signatures';



### Implementation
#
# For details see:
# https://github.sommrey.de/the-bears-den/2024/09/22/ch-287.html#task-1


sub strong_password ($str) {
    max +(length($str) < 6 ? 6 - length($str) : 0),
         (3 - grep eval "\$str =~ tr/$_//", qw(a-z A-Z 0-9)),
         (reduce {$a + int length($b) / 3} 0, $str =~ /((.)\2{2,})/g);
}

1;
