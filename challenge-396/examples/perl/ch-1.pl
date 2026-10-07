#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 396 Task 1: Finishing Order
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

sub finishing_order( $order, $friends ) {
    my @results;
    return \@results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", [[3, 1, 4, 2, 5], [1, 2, 4]], [1, 4, 2] ],
    [ "Example 2", [[5, 4, 3, 2, 1], [1, 3, 5]], [5, 3, 1] ],
    [ "Example 3", [[2, 4, 1, 3], [1 .. 4]], [2, 4, 1, 3] ],
    [ "Example 4", [[4, 1, 3, 2], [3]], [3] ],
    [ "Example 5", [[1, 3, 2, 6, 5, 4], [1, 2, 3]], [1, 3, 2] ],
);

is [ finishing_order( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;

done_testing;
