#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 371 Task 1: Missing Letter
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub missing_letter( @seq ) {
    my @nums = map ord, @seq;
    my $qm_index = ( grep $seq[$_] eq "?", keys @seq )[0];
    my @hardcoded_indices = (
        [ 1, 2, 3 ],
        [ 0, 3, 2 ],
        [ 3, 0, 1 ],
    );
    my ( $base, $add, $subtract ) =
        map { $nums[$_] }
            exists $hardcoded_indices[$qm_index]
            ? $hardcoded_indices[$qm_index]->@*
            : map { $qm_index + $_ } ( -1, -2, -3 );
    return chr( $base + $add - $subtract );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", [ "a", "c", "?", "g", "i" ], "e" ],
    [ "Example 2", [ "a", "d", "?", "j", "m" ], "g" ],
    [ "Example 3", [ "a", "e", "?", "m", "q" ], "i" ],
    [ "Example 4", [ "a", "c", "f", "?", "k" ], "h" ],
    [ "Example 5", [ "b", "e", "g", "?", "l" ], "j" ],
    [ "Own Test 1", [ qw( ? b c d ) ], "a" ],
    [ "Own Test 2", [ qw( a ? c d ) ], "b" ],
    [ "Own Test 3", [ qw( a b ? d ) ], "c" ],
    [ "Own Test 4", [ qw( a b c ? ) ], "d" ],
);

run( "missing_letter", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is missing_letter( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;
done_testing;
