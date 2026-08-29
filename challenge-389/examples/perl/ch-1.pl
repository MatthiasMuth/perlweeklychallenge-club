#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 389 Task 1: Reorder Notes
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

sub reorder_notes( $melody ) {
    my @results;
    return \@results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1",
        [["Mozart", ["C" .. "G", "A", "B"], [7, 1, 6, 2, 5, 3, 4] ]],
        [["D", "F", "A", "B", "G", "E", "C"]] ],
    [ "Example 2",
        [["Chopin", ["C", "C#", "D", "D#", "E", "F"], [6, 5, 4, 3, 2, 1]]],
        [["F", "E", "D#", "D", "C#", "C"]] ],
    [ "Example 3", [["Vivaldi", ["A" .. "E"], [1 .. 5]]], [["A" .. "E"]] ],
    [ "Example 4",
        [["Debussy", ["C", "D", "F", "G", "A"], [1, 3, 5, 2, 4]]],
        [["C", "G", "D", "A", "F"]] ],
    [ "Example 5", [["Stravinsky", ["C#"], [1]]], [["C#"]] ],
);

is [ reorder_notes( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;

done_testing;
