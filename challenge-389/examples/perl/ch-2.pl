#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 389 Task 2: ZigZag Subarray
#
#       Perl solution template.
#       Uses test data extracted from the challenge task examples
#       to test the solution during development.
#       (Template by Matthias Muth)
#

use v5.20;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

sub zigzag_subarray( @nums ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", [9, 4, 2, 10, 7, 8, 8, 1, 9], 5 ],
    [ "Example 2", [1, 7, 4, 9, 2, 5], 6 ],
    [ "Example 3", [1 .. 5], 2 ],
    [ "Example 4", [4, 4, 4], 1 ],
    [ "Example 5", [10, 20, 15, 12, 18], 3 ],
);

is zigzag_subarray( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;