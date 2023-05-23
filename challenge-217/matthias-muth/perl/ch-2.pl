#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 217 Task 2: Max Number
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub max_number_permute {
    my ( @list ) = @_;

    return $list[0]
        if @list == 1;

    my $max = 0;
    for ( 0..$#list ) {
	my @sub_list = @list;
	splice @sub_list, $_, 1, ();
        my $try = $list[$_] . max_number( @sub_list );
	$max = $try
	     if $try > $max;
    }
    return $max;
}

sub max_number {
    return join "", sort { ( $b . $a ) <=> ( $a . $b ) } @_;
}

run_tests;

__DATA__

Test 1:
Input: @list = ( 53 52 5 4 )
Output: 553524

Test 2:
Input: @list = ( 53 52 5 1 )
Output: 553521

Test 3:
Input: @list = ( 53 52 5 6 )
Output: 655352

Test 4:
Input: @list = ( 5453 54 )
Output: 545453

Test 5:
Input: @list = ( 5454 54 )
Output: 545454

Test 3:
Input: @list = ( 5455 54 )
Output: 545554
