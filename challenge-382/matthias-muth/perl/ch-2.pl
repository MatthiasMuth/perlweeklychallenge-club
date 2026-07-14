#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 382 Task 2: Replace Question Mark
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub replace_question_mark( $str ) {
    my @results;
    return \@results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1",
        "01??0",
        [
          [0, 1, 0, 0, 0],
          [0, 1, 0, 1, 0],
          [0, 1, 1, 0, 0],
          [0, 1, 1, 1, 0],
        ]
    ],
    [ "Example 2", 101, [[1, 0, 1]] ],
    [ "Example 3",
        "???",
        [
          [0, 0, 0],
          [0, 0, 1],
          [0, 1, 0],
          [0, 1, 1],
          [1, 0, 0],
          [1, 0, 1],
          [1, 1, 0],
          [1, 1, 1],
        ]
    ],
    [ "Example 4", "1?10", [[1, 0, 1, 0], [1, 1, 1, 0]] ],
    [ "Example 5",
        "1?1?0",
        [
          [1, 0, 1, 0, 0],
          [1, 0, 1, 1, 0],
          [1, 1, 1, 0, 0],
          [1, 1, 1, 1, 0],
        ]
    ],
);

run( "replace_question_mark", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is [ replace_question_mark( $_->[1] ) ], $_->[2], $_->[0]
    for @tests;
done_testing;
