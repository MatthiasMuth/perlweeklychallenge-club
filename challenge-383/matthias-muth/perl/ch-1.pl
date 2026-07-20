#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 383 Task 1: Similar List
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub similar_list( $list1, $list2, $list3 ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1",
        [
          ["great", "acting"],
          ["fine", "drama"],
          [["great", "fine"], ["acting", "drama"]],
        ],
        T ],
    [ "Example 2",
        [
          ["apple", "pie"],
          ["banana", "pie"],
          [["apple", "peach"], ["peach", "banana"]],
        ],
        F ],
    [ "Example 3",
        [
          ["perl4", "python"],
          ["raku", "python"],
          [["perl4", "perl5", "raku"]],
        ],
        T ],
    [ "Example 4",
        [
          ["enjoy", "challenge"],
          ["love", "weekly", "challenge"],
          [["enjoy", "love"]],
        ],
        F ],
    [ "Example 5",
        [
          ["fast", "car"],
          ["quick", "vehicle"],
          [["quick", "fast"], ["vehicle", "car"]],
        ],
        T ],
);

run( "similar_list", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is similar_list( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;
done_testing;
