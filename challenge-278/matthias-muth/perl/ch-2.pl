#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 278 Task 2: Reverse Word
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub reverse_word( $str, $char ) {
    return $str =~ s{^.*?$char}{ join "", sort split "", $& }er;
}

use Test2::V0 qw( -no_srand );
is reverse_word( "challenge", "e" ), "acehllnge",
    'Example 1: reverse_word( "challenge", "e" ) == "acehllnge"';
is reverse_word( "programming", "a" ), "agoprrmming",
    'Example 2: reverse_word( "programming", "a" ) == "agoprrmming"';
is reverse_word( "champion", "b" ), "champion",
    'Example 3: reverse_word( "champion", "b" ) == "champion"';
done_testing;
