#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 300 Task 2: Nested Array
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub nested_array( @ints ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );
use Data::Dump qw( pp );

is nested_array( 5, 4, 0, 3, 1, 6, 2 ), 4,
    'Example 1: nested_array( 5, 4, 0, 3, 1, 6, 2 ) == 4';
is nested_array( 0, 1, 2 ), 1,
    'Example 2: nested_array( 0, 1, 2 ) == 1';

done_testing;
