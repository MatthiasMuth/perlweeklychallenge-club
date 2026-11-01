#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 401 Task 1: Fractional Addition Substraction
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

sub fractional_addition_substraction( $expr ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "1/2+3/2", "2/1" ],
    [ "Example 2", "-5/2-3/2", "-4/1" ],
    [ "Example 3", "5/3-5/3", "0/1" ],
    [ "Example 4", "10/10-1/10+2/5", "13/10" ],
    [ "Example 5", "1/6+1/6+1/6", "1/2" ],
);

is fractional_addition_substraction( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
