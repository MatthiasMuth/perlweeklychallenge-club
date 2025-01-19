#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 251 Task 2: Lucky Numbers
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use warnings;
use experimental 'signatures';

use lib '.';
use TestExtractor;

use List::Util qw( min max );

sub lucky_numbers( $matrix ) {
    my @row_mins = map min( $_->@* ), $matrix->@*;
    vsay "row_mins: ", pp @row_mins;

    my @col_maxs;
    for my $c ( 0..$matrix->[0]->$#* ) {
	$col_maxs[$c] = max map $_->[$c], $matrix->@*;
    }
    vsay "col_maxs: ", pp @col_maxs;

    my $lucky = max( @row_mins );
    return $lucky == min( @col_maxs ) ? $lucky : -1;
}

run_tests;
