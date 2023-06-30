#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 223 Task 2: Box Coins
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub box_coins {
    my ( @box ) = @_;

    return $box[0]
	if @box == 1;

    my $max = 0;
    for ( 0..$#box ) {
        my $value = ( $box[$_]
		* ( $_ > 0     ? $box[ $_ - 1 ] : 1 )
		* ( $_ < $#box ? $box[ $_ + 1 ] : 1 )
	    ) + box_coins( @box[ 0 .. $_ - 1, $_ + 1 .. $#box ] );
	$max = $value
	    if $value > $max;
    }
    return $max;
}

run_tests;

__DATA__

Test 1: ( 2, 5 )
Input: @box = ( 2, 5 )
Output: 15
