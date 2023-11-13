#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 243 Task 1: Reverse Pairs
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

sub reverse_pairs( @nums ) {
    my $count = 0;
    for my $j ( 1..$#nums ) {
	$count += scalar grep { $nums[$_] > 2 * $nums[$j] } 0 .. $j - 1; 
    }
    return $count;
}

run_tests;
