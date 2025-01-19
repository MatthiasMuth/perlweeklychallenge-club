#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 304 Task 2: Maximum Average
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::MoreUtils qw( slideatatime );
use List::Util qw( sum max );

sub maximum_average( $ints, $n ) {
    my @sums;
    my $iterator = slideatatime( 1, $n, @$ints );
    while ( my @window = $iterator->() ) {
	last if scalar @window < $n;
	push @sums, sum( @window );
    }
    return max( @sums ) / $n;
}

use Test2::V0 qw( -no_srand );
use Data::Dump qw( pp );

is maximum_average( [1, 12, -5, -6, 50, 3], 4 ), 12.75,
    'Example 1: maximum_average( [1, 12, -5, -6, 50, 3], 4 ) == 12.75';
is maximum_average( [5], 1 ), 5,
    'Example 2: maximum_average( [5], 1 ) == 5';

done_testing;
