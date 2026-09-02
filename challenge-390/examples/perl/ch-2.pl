#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 390 Task 2: Order Characters
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

sub order_characters( $str, $k ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["dbca", 1], "adbc" ],
    [ "Example 2", ["geeks", 2], "eegks" ],
    [ "Example 3", ["cbaed", 3], "abcde" ],
    [ "Example 4", ["fedcba", 4], "abcdef" ],
    [ "Example 5", ["perl", 1], "erlp" ],
);

is order_characters( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;