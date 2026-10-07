#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 395 Task 2: Word Squares
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

sub word_squares( @words ) {
    my @results;
    return \@results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["MA", "AM", "MY", "ME"], ["MA", "AM"] ],
    [ "Example 2", ["SUN", "USE", "NET", "SEE", "TEN"], ["SUN", "USE", "NET"] ],
    [ "Example 3",
        ["BOAT", "TEAL", "AREA", "TSAR", "OGRE"],
        ["BOAT", "OGRE", "AREA", "TEAL"] ],
    [ "Example 4",
        ["CARD", "AREA", "REAR", "DART"],
        ["CARD", "AREA", "REAR", "DART"] ],
    [ "Example 5",
        ["HEART", "TREND", "EMBER", "RESIN", "ABUSE"],
        ["HEART", "EMBER", "ABUSE", "RESIN", "TREND"] ],
);

is [ word_squares( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;

done_testing;
