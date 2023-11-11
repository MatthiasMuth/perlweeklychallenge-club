#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 242 Task 2: Flip Matrix
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

sub flip_matrix( $matrix ) {
    @$_ = map $_ ^ 1, reverse @$_
	for @$matrix;
    return @$matrix;
}

run_tests;
