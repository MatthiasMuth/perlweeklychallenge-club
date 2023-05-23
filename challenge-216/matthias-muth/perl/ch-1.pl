#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 216 Task 1: Registration Number
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub registration_number {
    my ( $words, $reg ) = @_;
    my @letters = $reg =~ /[a-z]/ig;
    my @matches;
    for my $word ( @$words ) {
        push @matches, $word
            unless grep $word !~ /$_/i, @letters;
    }
    return @matches;
}

run_tests;
