#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 391 Task 2: Arrange Box
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

sub arrange_box( $boxes ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", [[1, 3], [3, 5], [6, 8], [2, 4]], 4 ],
    [ "Example 2", [[4, 5], [4, 6], [6, 7], [2, 3], [4, 3]], 3 ],
    [ "Example 3", [[5, 5], [5, 5], [5, 5]], 1 ],
    [ "Example 4", [[2, 100], [3, 200], [4, 300], [5, 50], [5, 400]], 4 ],
    [ "Example 5", [[10, 20], [15, 10], [20, 30], [12, 18], [16, 25]], 3 ],
);

is arrange_box( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
