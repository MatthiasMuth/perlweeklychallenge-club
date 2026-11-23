#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 401 Task 1: Fractional Addition Substraction
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use Math::BigRat;

sub fractional_addition_substraction_bigrat( $expr ) {
    my $fraction = Math::BigRat->bzero;
    $fraction->badd( $& )
        while $expr =~ m<[+-]?\d+/\d+>g;
    my $result = $fraction->bstr;
    return $result =~ m</> ? $result : "$result/1";
}

use Math::Prime::Util qw( lcm gcd );

sub fractional_addition_substraction( $expr ) {
    my $r = [ 0, 1 ];
    while ( $expr =~ m<([+-]?\d+)/(\d+)>g ) {
        # Add the fraction.
        $r = [ $r->[0] * $2 + $1 * $r->[1],
               $r->[1] * $2 ];
        # Reduce the fraction.
        my $gcd = gcd( $r->@* );
        $_ /= $gcd
            for $r->@*;
    }
    return join "/", $r->@*;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "1/2+3/2", "2/1" ],
    [ "Example 2", "-5/2-3/2", "-4/1" ],
    [ "Example 3", "5/3-5/3", "0/1" ],
    [ "Example 4", "10/10-1/10+2/5", "13/10" ],
    [ "Example 5", "1/6+1/6+1/6", "1/2" ],
);

run( "fractional_addition_substraction", \@tests );

__END__
is fractional_addition_substraction( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
