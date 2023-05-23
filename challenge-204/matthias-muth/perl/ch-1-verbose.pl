#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 204 Task 1: Monotonic Array
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature qw( say );

use lib '.';
use TestExtractor;

use Data::Dump qw( pp );
use List::Util qw( reduce );

sub monotonic_array {
    say "monotonic( @_ )";
    return 1
        if reduce {
            my $result = ( defined $a && $a <= $b ) ? $b : undef;
            say "comparing ", pp( $a ), " <= ", pp( $b ), ": ", pp( $result );
            $result;
        } @_
        or reduce {
            my $result = ( defined $a && $a >= $b ) ? $b : undef;
            say "comparing ", pp( $a ), " >= ", pp( $b ), ": ", pp( $result );
            $result;
        } @_;
    return 0;
}

run_tests;
