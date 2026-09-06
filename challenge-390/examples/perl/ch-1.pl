#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 390 Task 1: Decode String
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

sub decode_string( $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "2[3[a]]", "aaaaaa" ],
    [ "Example 2", "10[a]", "aaaaaaaaaa" ],
    [ "Example 3", "a2[b]c3[d]e", "abbcddde" ],
    [ "Example 4", "2[a2[b]c]", "abbcabbc" ],
    [ "Example 5", "1[a]2[b3[c]]", "abcccbccc" ],
);

is decode_string( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
