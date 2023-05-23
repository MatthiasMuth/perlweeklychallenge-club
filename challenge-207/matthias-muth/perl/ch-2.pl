#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 207 Task 2: H-Index
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub h_index {
    my @sorted = sort { $b <=> $a } @_;
    return scalar grep $sorted[$_] >= 1 + $_, 0..$#sorted;
}

run_tests;
