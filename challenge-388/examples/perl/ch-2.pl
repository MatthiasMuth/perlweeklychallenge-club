#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 388 Task 2: Secret Santa
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

sub secret_santa( $n ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", 1, 0 ],
    [ "Example 2", 2, 1 ],
    [ "Example 3", 3, 2 ],
    [ "Example 4", 4, 9 ],
    [ "Example 5", 5, 44 ],
);

is secret_santa( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;