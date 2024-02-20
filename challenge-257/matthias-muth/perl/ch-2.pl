#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 257 Task 2: Reduced Row Echelon
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::MoreUtils qw( first_index any );

sub reduced_row_echelon( $M ) {
    my $highest_leading_1_index = undef;
    for my $row ( 0..$M->$#* ) {

	# Find the first non-zero element.
        my $i = first_index { $_ != 0 } $M->[$row]->@*;
	if ( $i == -1 ) {
	    # There is no non-zero element, which means that this is a row of
	    # all zeros. All other rows have to be all-zero as well.
	    for $row ( $row + 1 .. $M->$#* ) {
		return 0
		    if any { $_ != 0 } $M->[$row]->@*;
	    }
	    return 1;
	}

	# We have a non-zero element. It has to be the 'leading 1'.
	return 0
	    unless $M->[$row][$i] == 1;

	# All other elements in the same column must be zero.
	# In other words, there must be exactly one non-zero value
	# in this column (which is our 'leading 1').
	return 0
	    unless ( scalar grep { $M->[$_][$i] != 0 } 0..$M->$#* ) == 1;

	# This 'leading 1' must occur 'farther to the right' than any
	# 'leading 1's before.
	return 0
	    unless ! defined $highest_leading_1_index
		|| $i > $highest_leading_1_index;
	$highest_leading_1_index = $i;
    }
    return 1;
}

use Test2::V0 qw( -no_srand );
is reduced_row_echelon( [[1, 1, 0], [0, 1, 0], [0, 0, 0]] ), 0,
    'Example 1: reduced_row_echelon( [[1, 1, 0], [0, 1, 0], [0, 0, 0]] ) == 0';
is reduced_row_echelon( [
  [0, 1, -2, 0, 1],
  [0, 0, 0, 1, 3],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
] ), 1,
    'Example 2: reduced_row_echelon( [
  [0, 1, -2, 0, 1],
  [0, 0, 0, 1, 3],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
] ) == 1';
is reduced_row_echelon( [[1, 0, 0, 4], [0, 1, 0, 7], [0, 0, 1, -1]] ), 1,
    'Example 3: reduced_row_echelon( [[1, 0, 0, 4], [0, 1, 0, 7], [0, 0, 1, -1]] ) == 1';
is reduced_row_echelon( [
  [0, 1, -2, 0, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 1, 3],
  [0, 0, 0, 0, 0],
] ), 0,
    'Example 4: reduced_row_echelon( [
  [0, 1, -2, 0, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 1, 3],
  [0, 0, 0, 0, 0],
] ) == 0';
is reduced_row_echelon( [[0, 1, 0], [1, 0, 0], [0, 0, 0]] ), 0,
    'Example 5: reduced_row_echelon( [[0, 1, 0], [1, 0, 0], [0, 0, 0]] ) == 0';
is reduced_row_echelon( [[4, 0, 0, 0], [0, 1, 0, 7], [0, 0, 1, -1]] ), 0,
    'Example 6: reduced_row_echelon( [[4, 0, 0, 0], [0, 1, 0, 7], [0, 0, 1, -1]] ) == 0';
done_testing;
