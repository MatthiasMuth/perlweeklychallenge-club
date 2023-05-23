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

use List::Util qw( reduce );

sub monotonic_array {
    return 1
        if reduce { ( defined $a && $a <= $b ) ? $b : undef } @_
        or reduce { ( defined $a && $a >= $b ) ? $b : undef } @_;
    return 0;
}

run_tests;
