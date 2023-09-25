#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 236 Task 1: Exact Change
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

sub sort_num( @values ) {
    return sort { $a <=> $b } @values;
}

sub exact_change( @bills ) {
    @bills = sort_num @bills;
    my %cash = ();
    for ( @bills ) {
	vsay "we are given \$$_";
	my $change_to_return = $_ - 5;

	if ( $change_to_return == 0 ) {
	    vsay "    no need to return any change";
	    ++$cash{$_};
	    next;
	}

	# Start returning change with the highest bills available.
	for ( reverse sort_num keys %cash ) {
	    while ( $cash{$_} && $_ <= $change_to_return ) {
		vsay "    returning a \$$_ bill";
		--$cash{$_};
		$change_to_return -= $_;
	    }
	}

	# Check whether we returned all the necessary change.
	if ( $change_to_return > 0 ) {
	    vsay "    we don't have the right change";
	    return 0; 
	}

	# Accept  the customer's bill.
	++$cash{$_};
	vsay "    accepting the customer's \$$_ bill";
	vsay "    cash now: ", join( " ",
	    map { ( "\$$_" ) x $cash{$_} } sort_num keys %cash );
    }
    return 1;
}

sub exact_change_short( @bills ) {
    @bills = sort_num @bills;
    my %cash = ();
    for ( @bills ) {
	++$cash{$_};
	my $change_to_return = $_ - 5;
	next
	    unless $change_to_return;
	for ( reverse sort_num keys %cash ) {
	    while ( $cash{$_} && $_ <= $change_to_return ) {
		--$cash{$_};
		$change_to_return -= $_;
	    }
	}
	return 0
	    if $change_to_return;
    }
    return 1;
}

run_tests;
