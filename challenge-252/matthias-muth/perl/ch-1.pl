#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 252 Task 1: Special Numbers
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

use List::Util qw( sum );

sub special_numbers( @ints ) {
    my $n = @ints;
    return sum map $n % $_ ? () : $ints[$_-1] ** 2, 1..$n;
}

run_tests;
