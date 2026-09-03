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
    return
        $k >= 2
        ?  join "", sort split "", $str
        : ( sort map substr( $str, $_ ) . substr( $str, 0, $_ ),
            0 .. length( $str ) - 1 )[0] // "";
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1:", ["dbca", 1], "adbc" ],
    [ "Example 2:", ["geeks", 2], "eegks" ],
    [ "Example 3:", ["cbaed", 3], "abcde" ],
    [ "Example 4:", ["fedcba", 4], "abcdef" ],
    [ "Example 5:", ["perl", 1], "erlp" ],
    [ "Own Test 1:", ["looooloo", 1], "looloooo" ],
    [ "Own Test 2:", ["looloooo", 1], "looloooo" ],
    [ "Own Test 3:", ["", 1], "" ],
    [ "Own Test 4:", ["", 4], "" ],
);

run( "order_characters", \@tests );

__END__
is order_characters( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
