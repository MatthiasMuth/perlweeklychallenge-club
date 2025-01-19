#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 304 Task 1: Arrange Binary
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub arrange_binary( $digits, $n ) {
    my $string = join "", $digits->@*;
    while ( $n > 0 ) {
	$string =~ s/000/010/ or last;
	--$n;
    }
    return $n == 0;
}

use Test2::V0 qw( -no_srand );
use Data::Dump qw( pp );

ok arrange_binary( [1, 0, 0, 0, 1], 1 ),
    'Example 1: arrange_binary( [1, 0, 0, 0, 1], 1 ) is true';
ok ! arrange_binary( [1, 0, 0, 0, 1], 2 ),
    'Example 2: arrange_binary( [1, 0, 0, 0, 1], 2 ) is false';

done_testing;
