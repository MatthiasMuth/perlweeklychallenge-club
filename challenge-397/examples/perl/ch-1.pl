#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 397 Task 1: Absent Smallest Positive
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

sub absent_smallest_positive( @arr ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", [1, 2, 4, 5, 6], 7 ],
    [ "Example 2", [-5, -2, -1, 3], 1 ],
    [ "Example 3", [1, 2, 3], 4 ],
    [ "Example 4", [2, 3, 7, 8], 6 ],
    [ "Example 5", [1, 1, 1, 10], 4 ],
);

is absent_smallest_positive( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
