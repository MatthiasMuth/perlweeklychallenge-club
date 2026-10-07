#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 395 Task 1: Complex Number
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

sub complex_number( $num1, $num2 ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["1+1i", "1+1i"], "0+2i" ],
    [ "Example 2", ["1+(-1)i", "1+(-1)i"], "0+(-2)i" ],
    [ "Example 3", ["0+3i", "0+4i"], "-12+0i" ],
    [ "Example 4", ["3+4i", "3+(-4)i"], "25+0i" ],
    [ "Example 5", ["50+(-20)i", "-10+30i"], "100+1700i" ],
);

is complex_number( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
