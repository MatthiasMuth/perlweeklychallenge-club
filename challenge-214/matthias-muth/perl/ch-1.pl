#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 214 Task 1: Rank Score
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

my @medals = qw( G S B );

sub rank_score {
    my @scores = @_;
    my @sorted_scores = sort { $b <=> $a } @scores;
    my %ranks;
    $ranks{$sorted_scores[$_]} //= $medals[$_] // $_ + 1
        for 0..$#sorted_scores;
    return map $ranks{$_}, @scores;
}

run_tests;
