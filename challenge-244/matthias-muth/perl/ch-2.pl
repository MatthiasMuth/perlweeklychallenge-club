#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 244 Task 2: Group Hero
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use strict;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

use List::Util qw( min max sum );

sub power( @nums ) {
    return max( @nums ) ** 2 * min( @nums );
}

sub combinations( @nums ) {
    return ()
	if @nums == 0;
    return [ @nums ]
	if @nums == 1;

    my @rest_combinations = combinations( @nums[ 1..$#nums ] );
    return (
	[ $nums[0] ],
	@rest_combinations,
	map( [ $nums[0], $_->@* ], @rest_combinations ),
    );
}

sub group_hero( @nums ) {
    return sum( map power( $_->@* ), combinations( @nums ) );
}

run_tests;
