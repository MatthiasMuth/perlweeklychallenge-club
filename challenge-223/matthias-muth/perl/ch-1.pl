#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 223 Task 1: Count Primes
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

sub erathostenes( $n ) {

    use List::Util qw( first );

    my @non_primes;
    my $sqrt = sqrt( $n );
    my $i = 2;
    while ( $i <= $sqrt ) {
	vsay "trying $i:";
	for ( my $j = 2 * $i; $j <= $n; $j += $i ) {
	    vsay "    mark $j as non-prime";
	    $non_primes[$j] = 1;
	}
	$i = first { ! $non_primes[$_] } $i + 1 .. $n;
	vsay "    next \$i to try: $i"; 
    }
    vsay "$i is larger than sqrt( $n ) ($sqrt)";
    vsay pp( grep { ! $non_primes[$_] } 2..$n );
    return grep { ! $non_primes[$_] } 2..$n;
}

sub count_primes( $n ) {
    return scalar erathostenes( $n );
}

erathostenes( 20 );

run_tests;
