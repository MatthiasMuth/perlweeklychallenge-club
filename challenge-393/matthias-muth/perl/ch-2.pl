#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 393 Task 2: Prime Step
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::Util qw( sum min );
use Math::Prime::Util qw( next_prime primes );

sub prime_step( $str ) {
    my $target = sum( map { ord } split "", $str );
    my $next_prime = next_prime( $target );
    return min (
        map { abs( $_ - $target ) }
            primes(
                $next_prime - 2 * ( $next_prime - $target ),
                $next_prime
            )->@*
    );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "hello", 9 ],
    [ "Example 2", "football", 2 ],
    [ "Example 3", "a", 0 ],
    [ "Example 4", "challenge", 2 ],
    [ "Example 5", "perl", 2 ],
);

run( "prime_step", \@tests );

__END__
is prime_step( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
