#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 388 Task 1: Dyck Words
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

sub dyck_words( $n ) {
    my @results;
    return \@results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", 1, ["UD"] ],
    [ "Example 2", 2, ["UDUD", "UUDD"] ],
    [ "Example 3", 3, ["UDUDUD", "UDUUDD", "UUDDUD", "UUDUDD", "UUUDDD"] ],
    [ "Example 4", 0, [""] ],
    [ "Example 5",
        4,
        [
          "UDUDUDUD",
          "UDUDUUDD",
          "UDUUDDUD",
          "UDUUDUDD",
          "UDUUUDDD",
          "UUDDUDUD",
          "UUDDUUDD",
          "UUDUDDUD",
          "UUDUDUDD",
          "UUDUUDDD",
          "UUUDDDUD",
          "UUUDDUDD",
          "UUUDUDDD",
          "UUUUDDDD",
        ]
    ],
);

is [ dyck_words( $_->[1] ) ], $_->[2], $_->[0]
    for @tests;

done_testing;