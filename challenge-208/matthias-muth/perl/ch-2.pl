#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 208 Task 2: Duplicate and Missing
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util qw( reduce );

sub duplicate_and_missing {
    my ( $dup, $missing );
    reduce {
        $dup     = $b     if $a == $b;
        $missing = $b - 1 if $a < $b - 1;
        $b;
    } @_;
    return
        defined $dup
        ? ( $dup, $missing // ( $_[-1] + 1 ) )
        : -1;
}

run_tests;

__DATA__
Test 1:
Input: @nums = ( 11,12,12,13,15,16,17 )
Output: ( 12,14 )
