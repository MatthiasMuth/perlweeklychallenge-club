#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 253 Task 2: Weakest Row
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use strict;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

use List::Util qw( sum );

sub weakest_row( $matrix ) {
    my @n_ones = map sum( @$_ ), $matrix->@*;
    return sort { $n_ones[$a] <=> $n_ones[$b] || $a <=> $b } 0..$matrix->$#*;
}

run_tests;
