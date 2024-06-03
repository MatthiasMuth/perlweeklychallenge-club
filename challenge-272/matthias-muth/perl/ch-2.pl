#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 272 Task 2: String Score
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::Util qw( sum );
use List::MoreUtils qw( slide );

sub string_score( $str ) {
    return sum( slide { abs( ord( $a ) - ord( $b ) ) } split "", $str );
}

use Test2::V0 qw( -no_srand );
is string_score( "hello" ), 13,
    'Example 1: string_score( "hello" ) == 13';
is string_score( "perl" ), 30,
    'Example 2: string_score( "perl" ) == 30';
is string_score( "raku" ), 37,
    'Example 3: string_score( "raku" ) == 37';
done_testing;
