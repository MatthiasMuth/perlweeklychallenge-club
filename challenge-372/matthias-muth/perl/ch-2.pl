#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 372 Task 2: Largest Substring
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use warnings;
use experimental 'signatures';
no warnings 'experimental::signatures';

use List::Util qw( max );
sub largest_substring( $str ) {
    my %seq_start;
    return max(
        map $_ - ( $seq_start{ substr( $str, $_, 1 ) } //= $_ + 1 ),
            0 .. length( $str ) - 1
    ) // -1;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "aaaaa", 3 ],
    [ "Example 2", "abcdeba", 5 ],
    [ "Example 3", "abbc", 0 ],
    [ "Example 4", "abcaacbc", 4 ],
    [ "Example 5", "laptop", 2 ],
);

run( "largest_substring", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is largest_substring( $_->[1] ), $_->[2], $_->[0]
    for @tests;
done_testing;
