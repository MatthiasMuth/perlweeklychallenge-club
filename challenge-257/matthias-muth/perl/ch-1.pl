#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 257 Task 1: Smaller than Current
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub smaller_than_current( @ints ) {
    my %freq;
    ++$freq{$_}
	for @ints;

    my @sorted = sort { $a <=> $b } sort keys %freq;

    my %smaller;
    $smaller{ $sorted[$_] } = $_
	for 0..$#sorted;

    return map $smaller{$_}, @ints;
}

use Test2::V0 qw( -no_srand );
is [ smaller_than_current( 5, 2, 1, 6 ) ], [ 2, 1, 0, 3 ],
    'Example 1: smaller_than_current( 5, 2, 1, 6 ) == (2, 1, 0, 3)';
is [ smaller_than_current( 1, 2, 0, 3 ) ], [ 1, 2, 0, 3 ],
    'Example 2: smaller_than_current( 1, 2, 0, 3 ) == (1, 2, 0, 3)';
is [ smaller_than_current( 0, 1 ) ], [ 0, 1 ],
    'Example 3: smaller_than_current( 0, 1 ) == (0, 1)';
is [ smaller_than_current( 9, 4, 9, 2 ) ], [ 2, 1, 2, 0 ],
    'Example 4: smaller_than_current( 9, 4, 9, 2 ) == (2, 1, 2, 0)';
done_testing;
