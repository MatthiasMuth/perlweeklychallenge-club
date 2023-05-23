#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 205 Task 1: Third Highest
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util 1.45 qw( uniq );

sub third_highest {
    my @a = uniq reverse sort @_;
    return @a >= 3 ? $a[2] : @a ? $a[0] : ();
}

run_tests;

__DATA__

Test 1:
Input: @array = ()
Output: ()

Test 2:
Input: @array = ( 6 )
Output: 6
