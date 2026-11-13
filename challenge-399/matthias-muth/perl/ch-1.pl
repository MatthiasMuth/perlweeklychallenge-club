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
use Dsay;

use List::Util qw( uniq max );

sub longest_repeating_character_regex( $str, $k ) {
    my $longest = 0;
    my $tries = 0;
    for my $letter ( uniq split "", $str ) {
        dsay "letter $letter '$str'";
        # Starting at $start_pos, turn (at most) $k characters other
        # than $letter into $letter,
        for my $start_pos ( 0.. length( $str ) - $k ) {
            # Work on copies of the original data.
            my ( $str, $k ) = ( $str, $k );
            pos( $str ) = $start_pos;
            while ( $k-- && $str =~ /[^$letter]/g ) {
                # Found a non-$letter character. Replace it.
                dsay "  replacing $& at $-[0]";
                substr $str, $-[0], 1, $letter;
                pos( $str ) = $+[0];
            }
            pos( $str ) = 0;
            dsay "  trying '$str'";
            ++$tries;
            $longest = max( $longest, map { length } $str =~ /$letter+/g );
            dsay "  longest $longest";
        }
    }
    vsay plural( $tries, "try", "ies", "y" );
    return $longest;
}

sub longest_repeating_character_substr( $str, $k ) {
    my $longest = 0;
    my $tries = 0;
    for my $letter ( uniq split "", $str ) {
        %debug and dsay "letter $letter '$str'";
        # Starting at $start_pos, turn (at most) $k characters other than
        # $letter into $letter,
        for my $start_pos ( 0.. length( $str ) - $k ) {
            # Work on a copy of the original string.
            my ( $copy, $count ) = ( $str, 0 );
            for my $pos ( $start_pos .. length( $copy ) - 1 ) {
                next if substr( $copy, $pos, 1 ) eq $letter;
                # Found a non-$letter character. Replace it.
                %debug and dsay
                    "  replacing ", substr( $copy, $pos, 1 ), " at $pos";
                substr $copy, $pos, 1, $letter;
                last if ++$count == $k;
            }
            %debug and dsay "  trying '$copy'";
            ++$tries;
            $longest = max( $longest, map { length } $copy =~ /$letter+/g );
            %debug and dsay "  longest $longest";
        }
    }
    vsay plural( $tries, "try", "ies", "y" );
    return $longest;
}

sub longest_repeating_character( $str, $k ) {
    # Shortcut if the input string contains only one distinct letter,
    # because then, there are no replacements to be made at all.
    return length( $str )
        if $str =~ /^(.)\g1*$/;

    my $longest = 0;
    my $tries = 0;
    # Check separately for each letter that exists in the string
    # whether it can produce the longest substring.
    for my $letter ( uniq split "", $str ) {
        %debug and dsay "letter $letter '$str'";
        # Loop over all string positions.
        # Starting at each string position that contains a character
        # *other* than $letter, turn (at most) $k characters other than
        # $letter into $letter (using a copy of the original string, and
        # skipping existing $letter characters).
        for my $start_pos ( 0.. length( $str ) - 1 ) {
            next unless substr( $str, $start_pos, 1 ) ne $letter;
            my ( $copy, $count ) = ( $str, 0 );
            for my $pos ( $start_pos .. length( $copy ) - 1 ) {
                if ( substr( $copy, $pos, 1 ) ne $letter ) {
                    # Found a non-$letter character. Replace it.
                    %debug and dsay
                        "  replacing ", substr( $copy, $pos, 1 ), " at $pos";
                    substr $copy, $pos, 1, $letter;
                    last if ++$count == $k;
                }
            }
            %debug and dsay "  trying '$copy'";
            ++$tries;
            # As this substitution may extend or even combine existing
            # sequences of $letter, check the lengths of all such sequences
            # existing now to find the maximum length.
            $longest = max( $longest, map { length } $copy =~ /$letter+/g );
            %debug and dsay "  longest $longest";
        }
    }
    vsay plural( $tries, "try", "ies", "y" );
    return $longest;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Own Test 1", [ "AABBCCAAAABBCCDDD", 3 ], 7 ],
    [ "Own Test 2", [ "AABBCCAAAABBCCDDD", 4 ], 10 ],
    [ "Own Test 3", [ "AAAAB", 3 ], 5 ],
    [ "Example 1", ["AAAAA", 2], 5 ],
    [ "Example 2", ["ABCDE", 4], 5 ],
    [ "Example 3", ["AAABBBBAA", 1], 5 ],
    [ "Example 4", ["ABACADA", 2], 5 ],
    [ "Example 5", ["BAAABAAAA", 1], 8 ],
);

run( "longest_repeating_character", \@tests, $tests[1][1] );

__END__
is longest_repeating_character( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
