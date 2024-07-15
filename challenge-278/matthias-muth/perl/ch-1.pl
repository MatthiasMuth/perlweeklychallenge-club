#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 278 Task 1: Sort String
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub sort_string( $str ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );
is sort_string( "and2 Raku3 cousins5 Perl1 are4" ), "Perl and Raku are cousins",
    'Example 1: sort_string( "and2 Raku3 cousins5 Perl1 are4" ) == "Perl and Raku are cousins"';
is sort_string( "guest6 Python1 most4 the3 popular5 is2 language7" ), "Python is the most popular guest language",
    'Example 2: sort_string( "guest6 Python1 most4 the3 popular5 is2 language7" ) == "Python is the most popular guest language"';
is sort_string( "Challenge3 The1 Weekly2" ), "The Weekly Challenge",
    'Example 3: sort_string( "Challenge3 The1 Weekly2" ) == "The Weekly Challenge"';
done_testing;
