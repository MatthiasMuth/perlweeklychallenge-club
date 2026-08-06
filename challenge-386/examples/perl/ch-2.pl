#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 386 Task 2: Rational Numbers
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

sub rational_numbers( $rat1, $rat2 ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["0.(12)", "0.(121)"], 0 ],
    [ "Example 2", ["0.1(23)", "0.12(32)"], 0 ],
    [ "Example 3", ["0.1(234)", "0.12(342)"], 1 ],
    [ "Example 4", ["12.99(99)", "13."], 1 ],
    [ "Example 5", ["0.(123)", "0.1(231)"], 1 ],
);

is rational_numbers( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;