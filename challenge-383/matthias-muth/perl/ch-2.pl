#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 383 Task 2: Nearest RGB
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub nearest_rgb( $color ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "#F4B2D1", "#FF99CC" ],
    [ "Example 2", "#15E6E5", "#00FFCC" ],
    [ "Example 3", "#191A65", "#003366" ],
    [ "Example 4", "#2D5A1B", "#336633" ],
    [ "Example 5", "#00FF66", "#00FF66" ],
);

run( "nearest_rgb", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is nearest_rgb( $_->[1] ), $_->[2], $_->[0]
    for @tests;
done_testing;
