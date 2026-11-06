#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 401 Task 2: Reconstruct Digits
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

sub reconstruct_digits( $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "zroezerotwowtwotwo", "00222" ],
    [ "Example 2", "esveeneinght", "78" ],
    [ "Example 3", "oneenineeninefive", "1599" ],
    [ "Example 4", "zeroonetwothreeeightfivesixsevenninefour", "0123456789" ],
    [ "Example 5", "ninenineninenine", "9999" ],
);

is reconstruct_digits( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
