#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 245 Task 2: Largest of Three
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use strict;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

use List::Util qw( sum max );

sub largest_of_three( @nums ) {
    vsay "largest_of_three( @nums )";

    # Get the 'mod3' (remainder of integer division by 3) of the concatenation
    # of all numbers.
    # The mod3 of a number is the same as the mod3 of its digit sum.
    # This also means that the mod3 of the concatenation of numbers is the same
    # as the sum of the mod3 of the numbers,
    # and even the mod3 of the sum of the numbers!
    my $mod3 = sum( @nums ) % 3;
    vsay "  ", "mod3:$mod3";

    # We are done if the sum is divisible by 3, because then the concatenation
    # will be, too.
    # Sort by "higher combination" (see Challenge 217 Task 2: Max Number!).
    return join "", sort { "$b$a" <=> "$a$b" } @nums
	if $mod3 == 0;

    # Here, our numbers are not divisble by 3, so we will try to exclude some
    # numbers from the list to arrive at mod3=0.
    # We can't say in advance which of any combinations of numbers to exclude
    # are the 'best' (doing the least damage to the overall result when
    # removed).
    # For example, we might think that removing a single number makes us lose
    # less than removing two numbers, but as we are not limited to single digit
    # numbers, removing a single '98' (mod3=2) is worse than removing a
    # combination of '1' and '4' (giving '41' or 14', both also mod3=2).
    # In any case we will only try certain combinations, not all possible ones.
    my @possible_results = ();

    # Sort the numbers, numerically ascending.
    # Numbers that do the least damage when removed go first.
    @nums = sort { $a <=> $b } @nums;

    # In all possible removals, we must leave at least one number.

    if ( $mod3 == 1 ) {
	# We are looking for either a single mod3=1 number to remove, ...
	if ( @nums > 1 ) {
	    for my $i ( 0..$#nums ) {
		if ( $nums[$i] % 3 == 1 && @nums > 1 ) {
		    push @possible_results,
			join "", sort { "$b$a" <=> "$a$b" }
			    @nums[
				$i > 0 ? ( 0 .. $i - 1 ) : (),
				$i + 1 .. $#nums,
			    ];
		    vsay "  ", "removing $nums[$i]",
			" resulting in $possible_results[-1]";
		    last;
		}
	    }
	}
	# ... or for two mod3=2 numbers (together having mod3=1, too).
	if ( @nums > 2 ) {
	    for my $i ( 0..$#nums ) {
		if ( $nums[$i] % 3 == 2 ) {
		    for my $j ( $i + 1 .. $#nums ) {
			if ( $nums[$j] % 3 == 2 ) {
			    push @possible_results,
				join "", sort { "$b$a" <=> "$a$b" }
				    @nums[
					$i > 0 ? ( 0 .. $i - 1 ) : (),
					$i + 1 .. $j - 1,
					$j + 1 .. $#nums,
				    ];
			    vsay "  ", "removing $nums[$i] and $nums[$j]",
				" resulting in $possible_results[-1]";
			    last;
			}
		    }
		}
	    }
	}
    }

    elsif ( $mod3 == 2 ) {
	# We are looking for either a single mod3=2 number to remove, ...
	if ( @nums > 1 ) {
	    for my $i ( 0..$#nums ) {
		if ( $nums[$i] % 3 == 2 ) {
		    push @possible_results,
			join "", sort { "$b$a" <=> "$a$b" }
			    @nums[
				$i > 0 ? ( 0 .. $i - 1 ) : (),
				$i + 1 .. $#nums,
			    ];
		    vsay "  ", "removing $nums[$i]",
			" resulting in $possible_results[-1]";
		    last;
		}
	    }
	}
	# ... or for two mod3=1 numbers (together having mod3=2, too).
	if ( @nums > 2 ) {
	    for my $i ( 0..$#nums ) {
		if ( $nums[$i] % 3 == 1 ) {
		    for my $j ( $i + 1 .. $#nums ) {
			if ( $nums[$j] % 3 == 1 ) {
			    push @possible_results,
				join "", sort { "$b$a" <=> "$a$b" }
				    @nums[
					$i > 0 ? ( 0 .. $i - 1 ) : (),
					$i + 1 .. $j - 1,
					$j + 1 .. $#nums,
				    ];
			    vsay "  ", "removing $nums[$i] and $nums[$j]",
				" resulting in $possible_results[-1]";
			    last;
			}
		    }
		}
	    }
	}
    }
    
    vsay "possible results: @possible_results";
    return @possible_results ? max( @possible_results ) : -1;
}

run_tests;

__DATA__

Test 1:
Input: @nums = ( 67, 64, 61, 68 )
Output: 676461

Test 2:
Input: @nums = ( 67, 64, 61, 68, 11 )
Output: 68676411

Test 3:
Input: @nums = ( 67, 64, 61, 65 )
Output: 676461

Test 4:
Input: @nums = ( 67, 64, 61, 65, 11 )
Output: 67656411

Test 5:
Input: @nums = ( 67, 64, 61, 6800 )
Output: 680067

Test 6:
Input: @nums = ( 67, 64, 61, 6500 )
Output: 676500

