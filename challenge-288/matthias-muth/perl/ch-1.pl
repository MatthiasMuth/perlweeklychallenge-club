#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 288 Task 1: Closest Palindrome
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub closest_palindrome( $str ) {
    # Searching in two directions: down and up, until we find a number
    # that is a palindrome.
    for ( my $distance = 1; ; ++$distance ) {
        for my $try ( $str - $distance, $str + $distance ) {
            return $try
                if reverse( $try ) eq $try;
        }
    }
    # We should never get here,
    # we should have found a single digit 'palindrome' at least!
    warn "INTERNAL ERROR: There's something wrong with this algorithm!\n";
    return undef;
}

use Test2::V0 qw( -no_srand );
is closest_palindrome( 123 ), 121,
    'Example 1: closest_palindrome( 123 ) == 121';
is closest_palindrome( 2 ), 1,
    'Example 2: closest_palindrome( 2 ) == 1';
is closest_palindrome( 1400 ), 1441,
    'Example 3: closest_palindrome( 1400 ) == 1441';
is closest_palindrome( 1001 ), 999,
    'Example 4: closest_palindrome( 1001 ) == 999';
is closest_palindrome( 1 ), 0,
    'Extra 1: closest_palindrome( 1 ) == 0';
is closest_palindrome( 0 ), 1,
    'Extra 1: closest_palindrome( 0 ) == 1';
is closest_palindrome( -5 ), 0,
    'Extra 2: closest_palindrome( -5 ) == 0';
done_testing;
