#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 210 Task 1: Kill and Win
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util qw( sum max );

sub kill_and_win {
    my @list = @_;

    my %numbers;
    @numbers{@list} = @list;
    my @numbers = sort keys %numbers;

    return
        max(
            map {
                my $n = $_;
                sum( grep { $n - 1 <= $_ && $_ <= $n + 1 } @list );
            } @numbers
        );
}

run_tests;
