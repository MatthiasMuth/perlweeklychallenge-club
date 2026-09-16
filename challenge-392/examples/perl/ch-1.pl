#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 392 Task 1: Convert Palindrome
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

sub convert_palindrome( $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "aacecaaa", "aaacecaaa" ],
    [ "Example 2", "abcd", "dcbabcd" ],
    [ "Example 3", "bananas", "sananabananas" ],
    [ "Example 4", "racecar", "racecar" ],
    [ "Example 5", "aaaaa", "aaaaa" ],
);

is convert_palindrome( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
