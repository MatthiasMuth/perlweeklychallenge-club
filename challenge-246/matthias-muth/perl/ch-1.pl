#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 246 Task 1: 6 out of 49
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

sub six_out_of_49(  ) {
    my %numbers;
    for ( 1..6 ) {
	my $number = int( rand( 49 ) ) + 1;
	redo if $numbers{$number};
	$numbers{$number} = $number;
    }
    return sort values %numbers;
}

my %freq;
for ( 0 .. 1_000_000 ) {
    $freq{$_}++
	for six_out_of_49;
}
vsay pp \%freq;

use Test2::V0;
use List::Util qw( sum );
is sum( values %freq ) % 6, 0, "A multiple of 6 numbers was drawn"; 
is $freq{0}, undef, "Number 0 was not drawn";
ok $freq{1} > 0, "Number 1 was drawn ($freq{1} times)";
ok $freq{49} > 0, "Number 49 was drawn ($freq{49} times)";
is $freq{50}, undef, "Number 50 was not drawn";
done_testing;
