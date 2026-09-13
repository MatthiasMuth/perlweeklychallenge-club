#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 390 Task 1: Decode String
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

sub decode_string( $str ) {
    while ( $str =~ s< (\d+) \[ ([[:alpha:]]*) \] >{ $2 x $1 }xeg ) {
        # Everything is in the loop condition.
    }
    return $str;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1:", "2[3[a]]", "aaaaaa" ],
    [ "Example 2:", "10[a]", "aaaaaaaaaa" ],
    [ "Example 3:", "a2[b]c3[d]e", "abbcddde" ],
    [ "Example 4:", "2[a2[b]c]", "abbcabbc" ],
    [ "Example 5:", "1[a]2[b3[c]]", "abcccbccc" ],
    [ "Own Test 1:", "abc", "abc" ],
);

run( "decode_string", \@tests );

__END__
is decode_string( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
