#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 213 Task 1: Fun Sort
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub fun_sort {
    sort { $a % 2 <=> $b % 2 || $a <=> $b } @_;
}

run_tests;
