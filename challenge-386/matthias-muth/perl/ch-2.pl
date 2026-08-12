#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 386 Task 2: Rational Numbers
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

use Math::Prime::Util qw( lcm );

sub rational_numbers( $rat1, $rat2 ) {
    # Split up the numbers into fixed part and repetend.
    my ( $i1, $f1, $r1, $i2, $f2, $r2 ) =
        map $_ // "0",
            map /(\d+)\.(\d*) (?: \( (\d+) \) )?/x,
                $rat1, $rat2;
    dsay "$rat1 => ", pp $i1, $f1, $r1;
    dsay "$rat2 => ", pp $i2, $f2, $r2;

    # Make the fixed parts have equal lengths.
    # Lengthen the shorter one by moving the repetend's leftmost digit
    # to the fixed part and appending the same digit back to the
    # right of the repetend. The number represented remains the same.
    # Example: 12.3(45678) equals 12.34(56784)
    while ( length( $f1 ) < length( $f2 ) ) {
        $f1 .= substr( $r1, 0, 1 );
        $r1 .= substr( $r1, 0, 1, "" );
    }
    while ( length( $f2 ) < length( $f1 ) ) {
        $f2 .= substr( $r2, 0, 1 );
        $r2 .= substr( $r2, 0, 1, "" );
    }

    # Now that we have aligned the repetends.
    # we can combine the integer and the fixed part to one number
    # for adjustment and comparison.
    $f1 = "$i1$f1";
    $f2 = "$i2$f2";
    dsay "equalized: ", pp $f1, $r1, $f2, $r2;

    # Special case: repetend of only '9's.
    # Increment the (combined) fixed part by 1,
    # and set the repetend to 0.
    $r1 =~ /^9+$/ and ( ++$f1, $r1 = "0" );
    $r2 =~ /^9+$/ and ( ++$f2, $r2 = "0" );
    dsay "rounded:   ", pp $f1, $r1, $f2, $r2;

    my $lcm = lcm( length( $r1 ), length( $r2 ) );
    dsay "lcm: $lcm";

    return ( $f1 . $r1 x ( $lcm / length( $r1 ) ) )
        == ( $f2 . $r2 x ( $lcm / length( $r2 ) ) );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", ["0.(12)", "0.(121)"], F ],
    [ "Example 2", ["0.1(23)", "0.12(32)"], T ],
    [ "Example 3", ["0.1(234)", "0.12(342)"], T ],
    [ "Example 4", ["12.99(99)", "13."], T ],
    [ "Example 5", ["0.(123)", "0.1(231)"], T ],
    [ "Own Test 1", ["12.34", "12.33(9)"], T ],
    [ "Own Test 2", ["12.34", "12.33(9)"], T ],
    [ "Own Test 3", ["12.34(0)", "12.33(9)"], T ],
    [ "Own Test 4", ["12.340(0)", "12.33(9)"], T ],
    [ "Own Test 5", ["10.", "9.(9)"], T ],
    [ "Own Test 6", ["10.00", "9.999(9)"], T ],
    [ "Own Test 7", ["12.(9)", "12.(9)"], T ],
    [ "Own Test 8", ["2.(19)", "2.1(919191)"], T ],
);

run( "rational_numbers", \@tests );
