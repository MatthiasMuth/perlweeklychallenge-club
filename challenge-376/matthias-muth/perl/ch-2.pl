#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 376 Task 2: Doubled Words
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub doubled_words( $str ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "you", [] ],
    [ "Example 2",
        "Find doubled words despite capitalization differences, such as with ",
        [] ],
    [ "Example 3", "to make a word bold: ", [] ],
    [ "Example 4",
        "Perl officially stands for Practical Extraction and Report Language, except when it doesn",
        [""] ],
    [ "Example 5", "There", [] ],
);

run( "doubled_words", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is [ doubled_words( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;
done_testing;
