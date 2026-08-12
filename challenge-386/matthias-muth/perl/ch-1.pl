#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 386 Task 1: Reverse Base
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

use Math::Prime::Util qw( fromdigits );

sub reverse_base( $num, $base ) {
    return undef unless 0 < $base <= 64;
    # Let fromdigits with a string parameter handle everything for bases <= 36.
    return fromdigits( $num, $base )
        if $base <= 36;

    # Bases up to 64 go here.
    my @digits = ( 0..9, "A".."Z", "a".."z", "+", "/" );
    my %digit_values = map { ( $digits[$_] => $_ ) } keys @digits;
    dsay pp_hash %digit_values;
    my @num_digits = map $digit_values{$_}, split "", $num;
    dsay "num_digits: @num_digits";
    return fromdigits( \@num_digits, $base );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", ["101010", 2], 42 ],
    [ "Example 2", ["EEADEE", 16], 15642094 ],
    [ "Example 3", ["755", 8], 493 ],
    [ "Example 4", ["1BRJB", 36], 2228519 ],
    [ "Example 5", ["7MyqL", 64], 123456789 ],
);

run( "reverse_base", \@tests );
