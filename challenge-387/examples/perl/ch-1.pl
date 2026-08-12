#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 387 Task 1: Rearrange Binary String
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

sub rearrange_binary_string( $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "111000", 0 ],
    [ "Example 2", "00011", 4 ],
    [ "Example 3", "01011", 3 ],
    [ "Example 4", "010101", 3 ],
    [ "Example 5", "00001", 4 ],
);

is rearrange_binary_string( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;