#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 394 Task 1: Alternate Case
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

use List::Util qw( sum min );

sub alternate_case( $str ) {
    # The approach is following the idea that if we consider only the
    # upper case letters, each one of them has to be moved to its correct
    # place in the final alternate case string. Every step is done by
    # a swap. Thus, the distance of the initial position of a character to
    # its final position is the number of swaps needed for that character.
    # There are two types of alternate case strings:
    # * AbAbAb, starting with an upper case letter,
    # * aBaBaB, starting with a lower case letter.
    # We have to compute the number of swaps needed to move all upper case
    # letters into the first form, and c2Wthe same for the second form.
    # Then we take the minimum of the two sums.
    my @uc_indices =
        map { substr( $str, $_, 1 ) =~ /[A-Z]/ ? $_ : () }
            0 .. length( $str ) - 1;
    dsay "str: $str, uc_indexes: (@uc_indices)";
    return min(
        sum( map {
                my $target_index = 2 * $_;
                abs( $target_index - $uc_indices[$_] );
            } keys @uc_indices ),
        sum( map {
                my $target_index = 2 * $_ + 1;
                abs( $target_index - $uc_indices[$_] );
            } keys @uc_indices ),
    );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1:", "aAbB", 0 ],
    [ "Example 2:", "AAbb", 1 ],
    [ "Example 3:", "AAAbbb", 3 ],
    [ "Example 4:", "aABb", 1 ],
    [ "Example 5:", "bBBAaa", 2 ],
);

run( "alternate_case", \@tests );

__END__
is alternate_case( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
