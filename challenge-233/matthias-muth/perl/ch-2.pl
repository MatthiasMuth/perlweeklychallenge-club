#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 233 Task 2: Frequency Sort
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

sub frequency_sort( @ints ) {

    # We need the frequencies for sorting. So let's compute them...
    my %frequencies;
    ++$frequencies{$_}
        for @ints;

    # Let 'sort' do the work, with the comparison code block representing
    # how we want things to be sorted.
    return
	sort { $frequencies{$a} <=> $frequencies{$b} || $b <=> $a } 
	    @ints;
}

run_tests;
