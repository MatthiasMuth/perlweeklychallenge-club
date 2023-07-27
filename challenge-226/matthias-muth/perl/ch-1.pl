#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 226 Task 1: Shuffle String
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub shuffle_string {
    my ( $string, $indices ) = @_;

    my @results;
    @results[@$indices] = split //, $string;
    return join "", @results;
}

run_tests;
