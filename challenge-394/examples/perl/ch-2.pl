#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 394 Task 2: Alternating Vowels Consonants
#
#       Perl solution template.
#       Uses test data extracted from the challenge task examples
#       to test the solution during development.
#       (Template by Matthias Muth)
#

use v5.20;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

sub alternating_vowels_consonants( @str ) {
    my @results;
    return \@results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["relocate", "delocate", "allocate"], ["loca"] ],
    [ "Example 2", ["apple", "banana", "cherry"], [""] ],
    [ "Example 3", ["navigate", "cavity", "gravity"], ["avi"] ],
    [ "Example 4", ["pedalgia", "pedalboard", "pedantic"], ["peda"] ],
    [ "Example 5", ["schoolmaster", "schoolhouse", "schooling"], ["ho", "ol"] ],
);

is [ alternating_vowels_consonants( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;

done_testing;
