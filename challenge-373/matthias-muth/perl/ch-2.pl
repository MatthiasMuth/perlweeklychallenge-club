#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 373 Task 2: List Division
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub list_division_slice( $list, $n ) {
    return -1
        unless $n > 0 && $list->@* >= $n;
    my ( $base_size, $rest ) = ( int( $list->@* / $n ), $list->@* % $n );
    my $next = 0;
    return map {
        my $size = ( $base_size + ( $_ <= $rest ) );
        ( my $this, $next ) = ( $next, $next + $size );
        [ $list->@[ $this .. $next - 1 ] ];
    } 1..$n;
}

sub list_division_splice( $list, $n ) {
    return -1 unless $n > 0 && $list->@* >= $n;
    return map {
        [ splice $list->@*,
            0, int( $list->@* / $n ) + ( $list->@* % $n-- > 0 ), () ]
    } 1..$n;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ 'Example 1', [ [1 .. 5], 2 ], [ [ 1, 2, 3 ], [ 4, 5 ] ] ],
    [ 'Example 2', [ [1 .. 6], 3 ], [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ] ],
    [ 'Example 3', [ [1, 2, 3], 2 ], [ [ 1, 2 ], [ 3 ] ] ],
    [ 'Example 4', [ [1 .. 10], 5 ],
        [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ], [ 7, 8 ], [ 9, 10 ] ] ],
    [ 'Example 5', [ [1, 2, 3], 4 ], [ -1 ] ],
    [ 'Example 6', [ [72, 57, 89, 55, 36, 84, 10, 95, 99, 35], 7 ],
        [ [ 72, 57 ], [ 89, 55 ], [ 36, 84 ], [ 10 ], [ 95 ], [ 99 ], [ 35 ] ]
    ],
    [ 'Own Test 1', [ [ 1..4 ], 4 ], [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] ],
    [ 'Own Test 2', [ [ ], 4 ], [ -1 ] ],
    [ 'Own Test 3', [ [ 1..4 ], 0 ], [ -1 ] ],
);
my @benchmark_params = ( [72, 57, 89, 55, 36, 84, 10, 95, 99, 35], 7 );

run( "list_division", \@tests, \@benchmark_params );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is [ list_division( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;
done_testing;
