#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 398 Task 2: String Difference
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Verbose;
use Dsay;
use List::MoreUtils qw( slide );

sub string_difference( @words ) {
    my %buckets;
    for my $word ( @words ) {
        my $signature =
            join " ", slide { ord( $b ) - ord( $a ) } split "", $word;
        push $buckets{$signature}->@*, $word;
    }
    delete @buckets{ grep { $buckets{$_}->@* > 1 } keys %buckets };
    return %buckets ? ( values %buckets )[0][0] : ();
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", ["ab", "bc", "cd", "zy"], "zy" ],
    [ "Example 2", ["cba", "fed", "azy"], "azy" ],
    [ "Example 3", ["pop", "ada", "beb", "cfc"], "pop" ],
    [ "Example 4", ["aaaa", "zzzz", "mmmm", "aaba"], "aaba" ],
    [ "Example 5", ["aceg", "bdfh", "cegi", "azbz"], "azbz" ],
    [ "Own Test 1: no outlier", ["aceg", "bdfh", "cegi"], undef ],
);

run( "string_difference", \@tests );

__END__
is string_difference( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
