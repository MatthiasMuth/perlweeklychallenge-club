#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 215 Task 1: Number Placement
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub number_placement {
    my ( $numbers, $count ) = @_;
    my $string = join "", @$numbers;
    $string =~ s/(?<!1)0(?!1)/1/ or return 0
        for 1..$count;
    return 1;
}

run_tests;
