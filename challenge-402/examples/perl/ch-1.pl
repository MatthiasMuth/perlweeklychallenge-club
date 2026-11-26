#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 402 Task 1: Letters Only Hex
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

sub letters_only_hex( $expr ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "16", "IO" ],
    [ "Example 2", "10", "A" ],
    [ "Example 3", "2748", "ABC" ],
    [ "Example 4", "4098", "" ],
    [ "Example 5", "68719476735", "FFFFFFFFF" ],
);

is letters_only_hex( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
