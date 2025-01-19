#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 300 Task 1: Beautiful Arrangement
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub beautiful_arrangement( $n ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );
use Data::Dump qw( pp );

is beautiful_arrangement( 2 ), 2,
    'Example 1: beautiful_arrangement( 2 ) == 2';
is beautiful_arrangement( 1 ), 1,
    'Example 2: beautiful_arrangement( 1 ) == 1';
is beautiful_arrangement( 10 ), 700,
    'Example 3: beautiful_arrangement( 10 ) == 700';

done_testing;
