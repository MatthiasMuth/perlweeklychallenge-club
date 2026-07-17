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
    [ "Example 1", "01??0", ["01000", "01010", "01100", "01110"] ],
    [ "Example 2", "101", ["101"] ],
    [ "Example 3",
        "???",
        ["000", "001", "010", "011", "100", "101", "110", "111"] ],
    [ "Example 4", "1?10", ["1010", "1110"] ],
    [ "Example 5", "1?1?0", ["10100", "10110", "11100", "11110"] ],
);

run( "replace_question_mark", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is [ replace_question_mark( $_->[1] ) ], $_->[2], $_->[0]
    for @tests;
done_testing;
