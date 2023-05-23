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

sub uniq {
    my %seen;
    return grep { ! $seen{$_}++ } @_;
}

sub third_highest {
    my @a = uniq reverse sort @_;
    return @a >= 3 ? $a[2] : $a[0];
}

run_tests;

__DATA__

Test 1:
Input: @array = ()
Output: undef

Test 2:
Input: @array = ( 6 )
Output: 6
