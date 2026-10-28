#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 400 Task 1: Longest Repeating Character
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

sub longest_repeating_character( $int ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", 20, 2 ],
    [ "Example 2", 110, 4 ],
    [ "Example 3", 500, 11 ],
    [ "Example 4", 2026, 105 ],
    [ "Example 5", 10000, 31 ],
);

is longest_repeating_character( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
