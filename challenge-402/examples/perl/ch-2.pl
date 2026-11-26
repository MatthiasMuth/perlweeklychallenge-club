#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 402 Task 2: Circular String Rotations
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

sub circular_string_rotations( $str, $directions ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["hello", [[1, 3], [0, 3]]], "hello" ],
    [ "Example 2", ["abcd", [[1, 6]]], "cdab" ],
    [ "Example 3", ["coding", [[0, 4], [1, 2]]], "dingco" ],
    [ "Example 4", ["xyz", [[0, 2], [0, 2], [1, 1]]], "xyz" ],
    [ "Example 5", ["z", [[0, 5], [1, 9]]], "z" ],
);

is circular_string_rotations( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
