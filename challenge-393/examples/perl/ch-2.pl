#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 393 Task 2: Prime Step
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

sub prime_step( $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "hello", 9 ],
    [ "Example 2", "football", 2 ],
    [ "Example 3", "a", 0 ],
    [ "Example 4", "challenge", 2 ],
    [ "Example 5", "perl", 2 ],
);

is prime_step( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
