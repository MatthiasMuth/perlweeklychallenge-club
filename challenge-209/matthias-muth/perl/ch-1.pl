#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 209 Task 1: Special Bit Characters
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub special_bit_characters {
    return join( "", @_ ) =~ /^ ( 10 | 01 )* 0 $/x || 0;
}

run_tests;
