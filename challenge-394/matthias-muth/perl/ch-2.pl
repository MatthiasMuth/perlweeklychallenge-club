#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 394 Task 2: Alternating Vowels Consonants
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub alternating_vowels_consonants( @str ) {
    my @results;
    return \@results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", ["relocate", "delocate", "allocate"], ["locate"] ],
    [ "Example 2", ["apple", "banana", "cherry"], [] ],
    [ "Example 3", ["navigate", "cavity", "gravity"], ["avi"] ],
    [ "Example 4", ["pedalgia", "pedalboard", "pedantic"], ["peda"] ],
    [ "Example 5", ["schoolmaster", "schoolhouse", "schooling"], ["ho", "ol"] ],
);

run( "alternating_vowels_consonants", \@tests );

__END__
is [ alternating_vowels_consonants( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;

done_testing;
