#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 392 Task 2: Words Length Product
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

sub words_length_product( @words ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["a", "ab", "abc", "d", "de", "def"], 9 ],
    [ "Example 2", ["a", "aa", "aaa", "aaaa"], 0 ],
    [ "Example 3", ["meet", "app", "code", "sky", "bold"], 14 ],
    [ "Example 4", ["a", "ab", "abc", "abcd", "efghi"], 20 ],
    [ "Example 5", ["xyz", "w", "abcdefg", "hij"], 21 ],
);

is words_length_product( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
