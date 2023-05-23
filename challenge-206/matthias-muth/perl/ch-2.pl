#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 206 Task 2: Array Pairings
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

sub permute( $a_ref ) {
    return undef  unless defined $a_ref && ref $a_ref eq 'ARRAY';
    return ()     if @$a_ref == 0;
    return $a_ref if @$a_ref == 1;

    my @permutations;
    for my $i ( 0..$#$a_ref ) {
	my @others = @$a_ref;
	my $extracted = splice( @others, $i, 1, () );
	push @permutations, [ $extracted, @$_ ]
	    for permute( [ @others ] );
    }
    return @permutations;
}

use List::Util qw( min max sum );

sub sum_of_min_of_pairs( @a ) {
    return undef
	unless @a % 2 == 0;
    return sum(
	map $_ % 2 == 0 ? min( $a[$_], $a[ $_ + 1 ] ) : 0, 0..( $#a - 1 )
    );
}

sub array_pairings( @a ) {
    return undef
	unless @a % 2 == 0;
    return 
	max( map sum_of_min_of_pairs( @$_ ), permute( [ @a ] ) );
}

run_tests;

__DATA__

Test 1:
Input: @array = ()
Output: undef

Test 2:
Input: @array = ( 11 )
Output: undef

Test 3:
Input: @array = ( 11, 12 )
Output: 11

Test 4:
Input: @array = ( 1,2,3,4,5,6 )
Output: 9
