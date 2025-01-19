#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 253 Task 1: Split Strings
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

sub split_strings( $words, $separator ) {
    return grep $_ ne "", map split( /\Q$separator\E/, $_ ), @$words;
}

run_tests;
