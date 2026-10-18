#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 398 Task 2: String Difference
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

sub string_difference( @words ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["ab", "bc", "cd", "zy"], "zy" ],
    [ "Example 2", ["cba", "fed", "azy"], "azy" ],
    [ "Example 3", ["pop", "ada", "beb", "cfc"], "pop" ],
    [ "Example 4", ["aaaa", "zzzz", "mmmm", "aaba"], "aaba" ],
    [ "Example 5", ["aceg", "bdfh", "cegi", "azbz"], "azbz" ],
);

is string_difference( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
