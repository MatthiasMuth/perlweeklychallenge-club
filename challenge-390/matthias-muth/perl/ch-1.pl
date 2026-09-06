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

sub decode_string( $str ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "2[3[a]]", "aaaaaa" ],
    [ "Example 2", "10[a]", "aaaaaaaaaa" ],
    [ "Example 3", "a2[b]c3[d]e", "abbcddde" ],
    [ "Example 4", "2[a2[b]c]", "abbcabbc" ],
    [ "Example 5", "1[a]2[b3[c]]", "abcccbccc" ],
);

run( "decode_string", \@tests );

__END__
is decode_string( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
