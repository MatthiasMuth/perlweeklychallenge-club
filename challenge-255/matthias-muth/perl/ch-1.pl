#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 255 Task 1: Odd Character
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::Util qw( first );

sub odd_character( $s, $t ) {
    my @s = sort split "", $s;
    my @t = sort split "", $t;
    return $t[ ( first { $s[$_] ne $t[$_] } 0..$#s ) // $#t ];
}

use Test2::V0 qw( -no_srand );
is odd_character( "Perl", "Preel" ), "e",
    'Example 1: odd_character( ("Perl", "Preel") ) == "e"';
is odd_character( "Weekly", "Weeakly" ), "a",
    'Example 2: odd_character( ("Weekly", "Weeakly") ) == "a"';
is odd_character( "Box", "Boxy" ), "y",
    'Example 3: odd_character( ("Box", "Boxy") ) == "y"';
done_testing;
