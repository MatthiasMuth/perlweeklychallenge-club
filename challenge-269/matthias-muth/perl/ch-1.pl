#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 269 Task 1: Bitwise OR
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub bitwise_or( @ints ) {
    return grep( ( $_ & 0x01 ) == 0, @ints ) >= 2;
}

use Test2::V0 qw( -no_srand );
ok bitwise_or( 1, 2, 3, 4, 5 ),
    'Example 1: bitwise_or( 1, 2, 3, 4, 5 ) is true';
ok bitwise_or( 2, 3, 8, 16 ),
    'Example 2: bitwise_or( 2, 3, 8, 16 ) is true';
ok ! bitwise_or( 1, 2, 5, 7, 9 ),
    'Example 3: bitwise_or( 1, 2, 5, 7, 9 ) is false';
done_testing;
