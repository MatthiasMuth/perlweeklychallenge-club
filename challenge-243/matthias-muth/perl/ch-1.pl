#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 243 Task 1: Reverse Pairs
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

sub reverse_pairs_obvious( @nums ) {
    my $count = 0;
    for my $i ( 0 .. $#nums - 1 ) {
	for my $j ( $i + 1 .. $#nums ) {
	    ++$count
	        if $nums[$i] > 2 * $nums[$j];
	}
    }
    return $count;
}

sub reverse_pairs_reversed_for( @nums ) {
    my $count = 0;
    for my $j ( 1 .. $#nums ) {
	for my $i ( 0 .. $j - 1 ) {
	    ++$count
	        if $nums[$i] > 2 * $nums[$j];
	}
    }
    return $count;
}

sub reverse_pairs_reversed_for_if( @nums ) {
    my $count = 0;
    for my $j ( 1 .. $#nums ) {
	for my $i ( 0 .. $j - 1 ) {
	    ++$count
	        if $nums[$i] > 2 * $nums[$j];
	}
    }
    return $count;
}

sub reverse_pairs_grep( @nums ) {
    my $count = 0;
    for my $i ( 0 .. $#nums - 1 ) {
        $count += scalar grep { $nums[$i] > 2 * $nums[$_] } $i + 1 .. $#nums; 
    }
    return $count;
}

sub reverse_pairs_reversed_grep( @nums ) {
    my $count = 0;
    for my $j ( 1 .. $#nums ) {
	$count += scalar grep { $nums[$_] > 2 * $nums[$j] } 0 .. $j - 1;
    }
    return $count;
}

sub reverse_pairs_optimized( @nums ) {
    my $last = $#nums;
    my $last_minus_1 = $last - 1;
    my $count = 0;
    for my $i ( 0 .. $last_minus_1 ) {
	for my $j ( $i + 1 .. $last ) {
	    ++$count
	        if $nums[$i] > 2 * $nums[$j];
	}
    }
    return $count;
}

sub reverse_pairs_reversed_optimized( @nums ) {
    my $last = $#nums;
    my $count = 0;
    for my $j ( 1 .. $last ) {
	for my $i ( 0 .. $j - 1 ) {
	    ++$count
	        if $nums[$i] > 2 * $nums[$j];
	}
    }
    return $count;
}

my @subs = qw(
    reverse_pairs_obvious
    reverse_pairs_reversed_for
    reverse_pairs_grep
    reverse_pairs_reversed_grep
    reverse_pairs_optimized
    reverse_pairs_reversed_optimized
    reverse_pairs_reversed_for_if
);
my @x=qw(
);

run_tests_for_subs( @subs );
done_testing;

use Benchmark qw( :all );
my %runs =
    map {
	my $sub_name = $_;
	( $sub_name => sub {
	    no strict 'refs';
	    $sub_name->( qw( 1 3 2 3 1 ) );
	    $sub_name->( qw( 2 4 3 5 1 ) );
	} )
    }
    @subs;

vsay np %runs;

cmpthese -2, \%runs;

exit 0;
