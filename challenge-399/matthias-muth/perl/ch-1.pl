#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 399 Task 1: Longest Repeating Character
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use feature 'declared_refs';
no warnings 'experimental::declared_refs';
use Dsay;

use List::Util qw( uniq );

sub longest_repeating_character( $str, $k ) {
    # Separate the string into sequence descriptions.
    # The sequence description for a letter contains
    # * the number of other characters left of the letter's first occurence,
    #   (0 if the first occurrence is at the start of the string),
    # then, repeatedly:
    # * the number of letters in on occurrence of the letter,
    # * the number of other characters to the right of the occurence
    #   up to the next occurence or the end of the string.
    # Consequently, we always have an odd number of counts.
    # Example:     "AAAABBCCAABBCCDDD"
    #     "A":    ( "" <AAAA> BBCC <AA> BBCCDDD )
    #          => ( 0, 4,     4,   2,   7       )
    #     "B":    ( AAAA <BB> CCAA <BB> CCDDD )
    #          => ( 4,   2,   4,   2,   5     )
    #     "C":    ( AAAABB <CC> AABB <CC> DDD )
    #          => ( 6,     2,   4,   2,   3     )
    #     "D":    ( AAAABBCCAABBCC <DDD> "" )
    #          => ( 14,            3,    0  )
    my @letters = uniq split "", $str; 
    my %sequences;
    @sequences{@letters} =
        map [ map length, 
                do { $str =~ /^([^$_]*)/g; $1 },
                $str =~ /([$_]+)([^$_]*)/g ],
            @letters;
    say pp_hash %sequences;
}

longest_repeating_character( "AAAABBCCAABBCCDDD", undef );
exit 0;

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", ["AAAAA", 2], 5 ],
    [ "Example 2", ["ABCDE", 4], 5 ],
    [ "Example 3", ["AAABBBBAA", 1], 5 ],
    [ "Example 4", ["ABACADA", 2], 5 ],
    [ "Example 5", ["BAAABAAAA", 1], 8 ],
);

run( "longest_repeating_character", \@tests );

__END__
is longest_repeating_character( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
