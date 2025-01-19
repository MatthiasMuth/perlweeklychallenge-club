#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 265 Task 2: Completing Word
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub completing_word( $str, $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );
is completing_word( "aBc 11c", ["accbbb", "abc", "abbc"] ), "accbbb",
    'Example 1: completing_word( "aBc 11c", ["accbbb", "abc", "abbc"] ) == "accbbb"';
is completing_word( "Da2 abc", ["abcm", "baacd", "abaadc"] ), "baacd",
    'Example 2: completing_word( "Da2 abc", ["abcm", "baacd", "abaadc"] ) == "baacd"';
is completing_word( "JB 007", ["jj", "bb", "bjb"] ), "bjb",
    'Example 3: completing_word( "JB 007", ["jj", "bb", "bjb"] ) == "bjb"';
done_testing;
