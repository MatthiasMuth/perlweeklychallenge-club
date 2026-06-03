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
    [ "Example 1",
        "you're given the job of checking the pages on a\nweb server for doubled words (such as 'this this'), a common problem\nwith documents subject to heavy editing.",
        "web server for doubled words [such as '[this] [this]'], a common problem"
    ],
    [ "Example 2",
        "Find doubled words despite capitalization differences, such as with 'The\nthe...', as well as allow differing amounts of whitespace (spaces,\ntabs, newlines, and the like) to lie between the words.",
        "Find doubled words despite capitalization differences, such as with '[The]\n[the]...', as well as allow differing amounts of whitespace [spaces,"
    ],
    [ "Example 3",
        "to make a word bold: '...it is <B>very</B> very important...'.",
        "to make a word bold: '...it is <B>[very]</B> [very] important...'." ],
    [ "Example 4",
        "Perl officially stands for Practical Extraction and Report Language, except when it doesn't.",
        "" ],
    [ "Example 5",
        "There's more than one one way to do it.\nEasy things should be easy and hard things should be possible.",
        "There's more than [one] [one] way to do it." ],
);

run( "doubled_words", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is doubled_words( $_->[1] ), $_->[2], $_->[0]
    for @tests;
done_testing;
