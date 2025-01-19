#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 255 Task 2: Most Frequent Word
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use FindBin;
use lib $FindBin::Bin;
use Verbose;

sub most_frequent_word( $p, $w ) {
    my %freq;
    while ( $p =~ /\w+/g ) {
	++$freq{$&}
	    unless $& eq $w;
    }
    vsay pp \%freq;
    return ( sort { $freq{$b} <=> $freq{$a} } keys %freq )[0];
}

use Test2::V0 qw( -no_srand );

is [ most_frequent_word( "Joe hit a ball, the hit ball flew far after it was hit.", "hit" ) ], [ "ball" ],
    'Example 1: most_frequent_word( (
  "Joe hit a ball, the hit ball flew far after it was hit.",
  "hit",
) ) == "ball"';
is [ most_frequent_word( "Perl and Raku belong to the same family. Perl is the most popular language in the weekly challenge.", "the" ) ], [ "Perl" ],
    'Example 2: most_frequent_word( (
  "Perl and Raku belong to the same family. Perl is the most popular language in the weekly challenge.",
  "the",
) ) == "Perl"';

done_testing;

