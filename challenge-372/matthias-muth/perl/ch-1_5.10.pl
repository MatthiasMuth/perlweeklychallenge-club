#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 372 Task 1: Rearrange Spaces
#
#       Perl solution by Matthias Muth.
#

use v5.10;
use strict;
use warnings;

sub rearrange_spaces {
    my ( $str ) = @_;
    my @words = split " ", $str;
    my $n_gaps = scalar @words - 1;
    my $n_spaces = $str =~ tr/ //;
    my $gap_length = $n_gaps > 0 ? int( $n_spaces / $n_gaps ) : 0;
    my $n_trailing = $n_spaces - $n_gaps * $gap_length;
    return join( " " x $gap_length, @words ) . " " x $n_trailing;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "  challenge  ", "challenge    " ],
    [ "Example 2", "coding  is  fun", "coding  is  fun" ],
    [ "Example 3", "a b c  d", "a b c d " ],
    [ "Example 4", "  team      pwc  ", "team          pwc" ],
    [ "Example 5",
        "   the  weekly  challenge  ",
        "the    weekly    challenge " ],
);

is rearrange_spaces( $_->[1] ), $_->[2], $_->[0]
    for @tests;
done_testing;
