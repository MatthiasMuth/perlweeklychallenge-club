#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 394 Task 1: Alternate Case
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

sub alternate_case( $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "aAbB", 0 ],
    [ "Example 2", "AAbb", 1 ],
    [ "Example 3", "AAAbbb", 3 ],
    [ "Example 4", "aABb", 1 ],
    [ "Example 5", "bBBAaa", 2 ],
);

is alternate_case( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
