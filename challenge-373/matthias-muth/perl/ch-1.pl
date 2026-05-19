#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 373 Task 1: Equal List
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub equal_list( $arr1, $arr2 ) {
    return join( "", $arr1->@* ) eq join( "", $arr2->@* );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", [["a", "bc"], ["ab", "c"]], T ],
    [ "Example 2", [["a", "b", "c"], ["a", "bc"]], T ],
    [ "Example 3", [["a", "bc"], ["a", "c", "b"]], F ],
    [ "Example 4", [["ab", "c", ""], ["", "a", "bc"]], T ],
    [ "Example 5", [["p", "e", "r", "l"], ["perl"]], T ],
);

run( "equal_list", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is equal_list( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;
done_testing;
