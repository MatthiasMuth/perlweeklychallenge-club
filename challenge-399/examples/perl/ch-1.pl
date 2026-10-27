#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 399 Task 1: Longest Repeating Character
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

sub longest_repeating_character( $str, $k ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["AAAAA", 2], 5 ],
    [ "Example 2", ["ABCDE", 4], 5 ],
    [ "Example 3", ["AAABBBBAA", 1], 5 ],
    [ "Example 4", ["ABACADA", 2], 5 ],
    [ "Example 5", ["BAAABAAAA", 1], 5 ],
);

is longest_repeating_character( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
