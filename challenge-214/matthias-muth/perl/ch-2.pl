#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 214 Task 2: Collect Points
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub collect_points {
    my @numbers = @_;

    # Edge cases:
    # An empty list returns zero,
    # and a list of one element returns one.
    return scalar @numbers
        if @numbers <= 1;

    # Find streaks, remove them for trial, and find the maximum
    # number of points for the remaining list by recursion.
    my $max = 0;
    my $streak_start = 0;
    for ( 0..$#numbers ) {
        if ( $_ == $#numbers || $numbers[ $_ +  1 ] != $numbers[ $_ ] ) {
            my $streak_end = $_;
            my $points = ( $streak_end - $streak_start + 1 ) ** 2
                + collect_points(
                    @numbers[ 0..$streak_start - 1,
                              $streak_end + 1 .. $#numbers ] );
            $max = $points
                if $points > $max;
            $streak_start = $streak_end + 1;
        }
    }
    return $max;
}

run_tests;
