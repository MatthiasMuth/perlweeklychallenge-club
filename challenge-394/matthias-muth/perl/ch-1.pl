#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 394 Task 1: Alternate Case
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub alternate_case( $str ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "aAbB", 0 ],
    [ "Example 2", "AAbb", 1 ],
    [ "Example 3", "AAAbbb", 3 ],
    [ "Example 4", "aABb", 1 ],
    [ "Example 5", "bBBAaa", 2 ],
);

run( "alternate_case", \@tests );

__END__
is alternate_case( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
