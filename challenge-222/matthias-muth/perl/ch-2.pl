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

    my $result = $ints[0]
	if @ints == 1;
    if ( defined $result ) {
	vsay $indent, "returning $result";
	substr $indent, 0, 4, "";
	return $result;
    }

    for my $i ( 0..$#ints ) {
	for my $j ( $i + 1 .. $#ints ) {
	    print $indent, "pick $ints[$i] and $ints[$j], we remove both"
		if $verbose;
	    my @new_ints = 
		@ints[ 0 .. $i - 1, $i + 1 .. $j - 1, $j + 1 .. $#ints ];
	    if ( my $diff = $ints[$j] - $ints[$i] ) {
		print " and add new member $diff"
		    if $verbose;
	        push @new_ints, $diff;
	    }
	    vsay " => ( @new_ints )";
	    $result = last_member( @new_ints );
	    if ( defined $result ) {
		vsay $indent, "returning $result";
		substr $indent, 0, 4, "";
		return $result;
	    }
	}
    }
    $result = 0;
    vsay $indent, "returning $result";
    substr $indent, 0, 4, "";
    return $result;
}

run_tests;
