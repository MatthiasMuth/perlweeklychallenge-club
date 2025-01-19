#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 254 Task 2: Reverse Vowels
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use warnings;
use experimental 'signatures';

use lib '.';
use TestExtractor;

sub reverse_vowels( $s ) {
    my @reversed_vowels = $s =~ /[aeiou]/ig;
    return $s =~ s{[aeiou]}{
	my $c = pop @reversed_vowels;
	$& eq uc $& ? uc $c : lc $c;
    }iegr;
}

run_tests;
