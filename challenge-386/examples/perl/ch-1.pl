#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 386 Task 1: Reverse Base
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

sub reverse_base( $num, $base ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["101010", 2], 42 ],
    [ "Example 2", ["EEADEE", 16], 15642094 ],
    [ "Example 3", ["755", 8], 493 ],
    [ "Example 4", ["1BRJB", 36], 2228519 ],
    [ "Example 5", ["7MyqL", 64], 123456789 ],
);

is reverse_base( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
