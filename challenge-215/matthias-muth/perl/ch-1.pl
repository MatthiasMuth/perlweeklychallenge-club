#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 215 Task 1: Odd one Out
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util qw( sum reduce );

sub odd_one_out {
    return sum
        map ! defined ( reduce { defined $a && $a le $b ? $b : undef } /./g ),
            @_;
}

run_tests;
