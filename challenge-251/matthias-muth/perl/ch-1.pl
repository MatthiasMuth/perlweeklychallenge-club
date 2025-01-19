#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 251 Task 1: Concatenation Value
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use warnings;
use experimental 'signatures';

use lib '.';
use TestExtractor;

use List::Util qw( sum );

sub concatenation_value_0( @ints ) {
    return sum(
	map $_ == $#ints - $_ ? $ints[$_] : ( $ints[$_] . $ints[ $#ints - $_ ] ),
	    0 .. int( $#ints / 2 )
    );
}

sub concatenation_value( @ints ) {
    my ( $left, $right, $sum ) = ( 0, $#ints, 0 );
    $sum += ( $ints[ $left++ ] . $ints[ $right-- ] )
	while $left < $right;
    return $sum + ( $left == $right ? $ints[$left] : 0 );
}

run_tests "concatenation_value_0", "concatenation_value";

__DATA__
Test 1: Single value
Input: @ints = ( 5 )
Output: 5

