#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 370 Task 1: Popular Word
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use List::UtilsBy qw( max_by );

sub popular_word( $paragraph, $banned ) {
    # Create a lookup for banned words.
    my %is_banned = map { $_ => 1 } $banned->@*;

    # Replace everything non-alpha and non-whitespace by whitespace.
    $paragraph =~ s/[^[:alpha:]\s]+/ /g;

    # Split up in words, filtering out banned words.
    my @words = grep ! $is_banned{$_}, split " ", lc $paragraph;

    # Find the word with the highest number of occurrences,
    # counting as we walk through all the words.
    my %n_occurences;
    return max_by { ++$n_occurences{$_} } @words;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1",
        [
          "Bob hit a ball, the hit BALL flew far after it was hit.",
          ["hit"],
        ],
        "ball" ],
    [ "Example 2",
        [
          "Apple? apple! Apple, pear, orange, pear, apple, orange.",
          ["apple", "pear"],
        ],
        "orange" ],
    [ "Example 3", ["A. a, a! A. B. b. b.", ["b"]], "a" ],
    [ "Example 4", ["Ball.ball,ball:apple!apple.banana", ["ball"]], "apple" ],
    [ "Example 5",
        [
          "The dog chased the cat, but the dog was faster than the cat.",
          ["the", "dog"],
        ],
        "cat" ],
);

run( "popular_word", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is popular_word( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;
done_testing;
