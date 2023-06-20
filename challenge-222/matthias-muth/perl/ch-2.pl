#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 222 Task 2: Last Member
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature qw( say state );

use lib '.';
use TestExtractor;

sub last_member {
    my @ints = @_;

    state $indent = "";
    vsay $indent, "last_member( @ints ):";
    $indent .= "    ";

    while ( @ints >= 2 ) {
	my @sorted_ints = sort { $b <=> $a } @ints;
	my %positions;
	push @{ $positions{ $ints[$_] } }, $_
	    for 0..$#ints;
	vsay $indent, "sorted_ints: ( @sorted_ints )";
	vsay $indent, "positions: ", pp \%positions;

	my ( $i, $j ) =
	    sort { $a <=> $b }
		map shift @{$positions{$_}},
		    @sorted_ints[ 0, 1 ];
	print $indent, "pick $ints[$i] and $ints[$j],",
	    " we remove both"
	    if $verbose;

	if ( my $diff = abs( $ints[$j] - $ints[$i] ) ) {
	    print " and add new member $diff"
		if $verbose;
	    $ints[$j] = $diff;
	    splice @ints, $i, 1, ();
	}
	else {
	    # Remove both $i and $ji (starting with the latter one).
	    splice @ints, $j, 1, ();
	    splice @ints, $i, 1, ();
	}
	vsay " => ( @ints )";
    }

    # If there is one member, we return it up the chain.
    # If there is no member, we return 0 up the chain.
    my $result = $ints[0] // 0;
    vsay $indent, "returning $result";
    substr $indent, 0, 4, "";
    return $result;
}

run_tests;
