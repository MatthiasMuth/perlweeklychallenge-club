#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 241 Task 1: Arithmetic Triplets
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

sub arithmetic_triplets( $nums, $diff ) {
    my %num_lookup = map { ( $_ => 1 ) } $nums->@*;
    return scalar grep {
        exists $num_lookup{ $_ + $diff }
	    && exists $num_lookup{ $_ + 2 * $diff },
    } $nums->@*;
}

run_tests;
