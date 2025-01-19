#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 250 Task 1: Smallest Index
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

use List::Util qw( first );

sub smallest_index( @ints ) {
    return +( first { $ints[$_] == $_ % 10 } 0..$#ints ) // -1;
}

run_tests;
