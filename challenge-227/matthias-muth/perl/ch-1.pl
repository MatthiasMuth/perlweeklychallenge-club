#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 227 Task 1: Friday 13th
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use Time::Piece;

sub friday_13th {
    my ( $year ) = @_;

    # Time::Piece->day_of_the_week: 0 = Sunday.
    return scalar grep $_->day_of_week == 5,
        map Time::Piece->strptime( "$year-$_-13", "%Y-%m-%d" ),
            1..12;
}

run_tests;
