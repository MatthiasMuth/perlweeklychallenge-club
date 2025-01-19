#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 269 Task 2: Distribute Elements
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub distribute_elements( @ints ) {
    my @arr1 = shift @ints;
    my @arr2 = shift @ints;
    $arr1[-1] > $arr2[-1]
	? do { push @arr1, $_ }
	: do { push @arr2, $_ }
	for @ints;
    return ( @arr1, @arr2 );
}

use Test2::V0 qw( -no_srand );
is [ distribute_elements( 2, 1, 3, 4, 5 ) ], [ 2, 3, 4, 5, 1 ],
    'Example 1: distribute_elements( 2, 1, 3, 4, 5 ) == (2 .. 5, 1)';
is [ distribute_elements( 3, 2, 4 ) ], [ 3, 4, 2 ],
    'Example 2: distribute_elements( 3, 2, 4 ) == (3, 4, 2)';
is [ distribute_elements( 5, 4, 3, 8 ) ], [ 5, 3, 4, 8 ],
    'Example 3: distribute_elements( 5, 4, 3, 8 ) == (5, 3, 4, 8)';
done_testing;
