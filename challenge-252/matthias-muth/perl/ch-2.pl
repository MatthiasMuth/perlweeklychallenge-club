#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 252 Task 2: Unique Sum Zero
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

sub unique_sum_zero( $n ) {
    my @results = (
	-( $n >> 1 ) .. -1,
	$n & 1 ? 0 : (),
	+1 .. ( $n >> 1 ),
    );
    say "n:$n results:(@results)";
    return @results;
}

sub unique_sum_zero_2( $n ) {
    my @results;
    while ( $n > 1 ) {
	push @results, -$n, +$n;
	$n -= 2;
    }
    push @results, 0
	if $n;
    say "results:(@results)";
    return @results;
}

use Test2::V0 -no_srand => 1;
use List::Util qw( sum uniq );

for my $test ( 5, 4, 3, 1 ) {
    my @results = unique_sum_zero( $test );
    ok uniq( @results ) == @results && sum( @results ) == 0,
	"unique_sum_zero( $test )";
}

done_testing;
