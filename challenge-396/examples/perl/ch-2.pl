#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 396 Task 2: Trionic Array
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

sub trionic_array( @arr ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", [1, 3, 5, 4, 2, 6, 8], T ],
    [ "Example 2", [1, 4, 4, 2, 1, 3, 5], F ],
    [ "Example 3", [2, 10, 3, 1, 9], T ],
    [ "Example 4", [1 .. 4, 3, 2, 1], F ],
    [ "Example 5", [1, 3, 2, 4, 1, 5, 2], F ],
);

is trionic_array( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
