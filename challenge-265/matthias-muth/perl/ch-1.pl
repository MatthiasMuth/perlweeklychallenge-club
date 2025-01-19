#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 265 Task 1: 33% Appearance
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub 33_appearance( @ints ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );
is 33_appearance( 1, 2, 3, 3, 3, 3, 4, 2 ), 3,
    'Example 1: 33_appearance( 1, 2, 3, 3, 3, 3, 4, 2 ) == 3';
is 33_appearance( 1, 1 ), 1,
    'Example 2: 33_appearance( 1, 1 ) == 1';
is 33_appearance( 1, 2, 3 ), 1,
    'Example 3: 33_appearance( 1, 2, 3 ) == 1';
done_testing;
