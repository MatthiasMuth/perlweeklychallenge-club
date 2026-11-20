#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 400 Task 1: Largest Interval
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub largest_interval( $int ) {
    my ( $biggest_jump, $current_gap ) = ( 0, 0 );
    for ( 1..$int) {
        if ( /(.).*\g1/ ) {
            ++$current_gap;
        }
        else {
            $biggest_jump = $current_gap + 1
                if $current_gap + 1 > $biggest_jump;
            $current_gap = 0;
        }
    }
    return $biggest_jump;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", 20, 2 ],
    [ "Example 2", 110, 4 ],
    [ "Example 3", 500, 11 ],
    [ "Example 4", 2026, 105 ],
    [ "Example 5", 10000, 105 ],
);

run( "largest_interval", \@tests );

__END__
is largest_interval( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
