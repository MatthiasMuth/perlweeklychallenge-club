#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 243 Task 2: Floor Sum
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

use List::Util qw( sum );

sub floor_sum_half_loop( @nums ) {
    my $count;
    for my $i ( 0..$#nums ) {
	$count += sum( map int( $nums[$_] / $nums[$i] ), 0..$#nums );
    }
    return $count;
}

sub floor_sum_loop( @nums ) {
    my $count;
    for my $i ( 0..$#nums ) {
	for my $j ( 0..$#nums ) {
	    $count += int( $nums[$j] / $nums[$i] );
	}
    }
    return $count;
}

sub floor_sum_half_matrix( @nums ) {
    @nums = sort { $a <=> $b } @nums;
    my $count;
    for my $i ( 0 .. $#nums - 1 ) {
	$count += sum(
	    map { $nums[$_] == $nums[$i] ? 2 : int( $nums[$_] / $nums[$i] ) }
		$i + 1 .. $#nums
	);
    }
    # Add 1 for each diagonal field.
    return $count + scalar @nums;
}

sub floor_sum( @nums ) {
    return floor_sum_half_matrix( @nums );
}

run_tests;

use Benchmark qw( :all );
cmpthese -2, {
    "floor_sum_half_loop" =>
	sub {
	    floor_sum_half_loop( 2,5,9 );
	    floor_sum_half_loop( ( 7 ) x 7 );
	},
    "floor_sum_loop" =>
	sub {
	    floor_sum_loop( 2,5,9 );
	    floor_sum_loop( ( 7 ) x 7 );
	},
    "floor_sum_half_matrix" =>
	sub {
	    floor_sum_half_matrix( 2,5,9 );
	    floor_sum_half_matrix( ( 7 ) x 7 );
	},
};
