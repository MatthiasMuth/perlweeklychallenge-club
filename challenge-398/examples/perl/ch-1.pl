#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 398 Task 1: Divisible Average
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

sub divisible_average( @arr ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", [18, 5, 7, 11], 18 ],
    [ "Example 2", [6, 12, 18, 24, 30, 40], 18 ],
    [ "Example 3", [3, 9, 15, 21, 27], 0 ],
    [ "Example 4", [6, 12, 14, 20], 9 ],
    [ "Example 5", [6, 6, 6, 12, 12], 8 ],
);

is divisible_average( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
