#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 291 Task 2: Poker Hand Rankings
#
#       Perl solution by Matthias Muth.
#

use v5.36;

package NOverK;
use parent 'Exporter';
our @EXPORT = qw( factorial n_over_k );

use List::Util qw( reduce );

sub factorial( $n ) { return reduce { $a * $b } 1..$n; }

sub n_over_k( $n, $k ) {
    return
        ( reduce { $a *= $b } ( $n - $k + 1 ) .. $n )
        / ( reduce { $a *= $b } 1..$k );
}

1;
