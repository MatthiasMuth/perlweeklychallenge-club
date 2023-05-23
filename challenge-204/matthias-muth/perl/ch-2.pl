#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 204 Task 2: Reshape Matrix
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';
use feature qw( signatures );
no warnings qw( experimental::signatures );

use lib '.';
use TestExtractor;

sub reshape_matrix( $matrix, $r, $c ) {
    my @all_elements = map @$_, @$matrix;
    return 0
        unless @all_elements == $r * $c;
    my $reshaped = [];
    push @$reshaped, [ splice @all_elements, 0, $c, () ]
        while @all_elements;
    vsay pp $reshaped;
    return @$reshaped == 1 ? @$reshaped : $reshaped;
}

run_tests;
