#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 382 Task 1: Hamiltonian Cycle
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub hamiltonian_cycle( $n ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1",
        32,
        [
          1,
          8,
          28,
          21,
          4,
          32,
          17,
          19,
          30,
          6,
          3,
          13,
          12,
          24,
          25,
          11,
          5,
          31,
          18,
          7,
          29,
          20,
          16,
          9,
          27,
          22,
          14,
          2,
          23,
          26,
          10,
          15,
        ]
    ],
    [ "Example 2", 15, [-1] ],
    [ "Example 3",
        34,
        [
          1,
          8,
          17,
          32,
          4,
          21,
          28,
          11,
          25,
          24,
          12,
          13,
          3,
          6,
          30,
          19,
          14,
          22,
          27,
          9,
          16,
          20,
          29,
          7,
          18,
          31,
          5,
          4,
          34,
          15,
          10,
          26,
          23,
          2,
        ]
    ],
);

run( "hamiltonian_cycle", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is [ hamiltonian_cycle( $_->[1] ) ], $_->[2], $_->[0]
    for @tests;
done_testing;
