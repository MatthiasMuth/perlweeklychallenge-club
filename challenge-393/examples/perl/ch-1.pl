#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 393 Task 1: Pythagoras Multiplied
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

sub pythagoras_multiplied( $n ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", 20, 12 ],
    [ "Example 2", 7, 2 ],
    [ "Example 3", 1, 0 ],
    [ "Example 4", 15, 8 ],
    [ "Example 5", 30, 22 ],
);

is pythagoras_multiplied( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
