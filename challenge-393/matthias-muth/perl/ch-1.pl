#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 393 Task 1: Pythagoras Multiplied
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

# The first possible triplet is [ 3, 4, 5 ], so the loops for c and a
# can start with 5 and 3, respectively.
# For making sure that a is the short side (a < b), a² must not be larger
# than c²/2.
# We know that a and b can never be both integers *and* equal to each other
# if c is an integer, because if they were equal, it would mean that c² = 2b²,
# and thus b = c / sqrt(2), which is an irrational number.
# Therefore, ( a, b ) and ( b, a ) are always distinct solutions, and we can
# always count both.

sub pythagoras_multiplied( $n ) {
    my $count = 0;
    for my $c_squared ( map { $_ * $_ } 5..$n ) {
        for my $a_squared ( map { $_ * $_ } 3..$n ) {
            last if $a_squared >= $c_squared / 2;
            my $b = sqrt( $c_squared - $a_squared );
            $count += 2
                if $b == int( $b );
        }
    }
    return $count;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", 20, 12 ],
    [ "Example 2", 7, 2 ],
    [ "Example 3", 1, 0 ],
    [ "Example 4", 15, 8 ],
    [ "Example 5", 30, 22 ],
);

run( "pythagoras_multiplied", \@tests, [ 100 ] );

__END__
is pythagoras_multiplied( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
