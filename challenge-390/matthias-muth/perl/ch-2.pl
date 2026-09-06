#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 390 Task 2: Order Characters
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub order_characters( $str, $k ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", ["dbca", 1], "adbc" ],
    [ "Example 2", ["geeks", 2], "eegks" ],
    [ "Example 3", ["cbaed", 3], "abcde" ],
    [ "Example 4", ["fedcba", 4], "abcdef" ],
    [ "Example 5", ["perl", 1], "erlp" ],
    [ "Example 6", ["oloolooo", 1], "looloooo" ],
    [ "Example 7", ["oloooolo", 1], "looloooo" ],
);

run( "order_characters", \@tests );

__END__
is order_characters( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
