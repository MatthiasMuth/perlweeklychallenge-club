#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 401 Task 2: Reconstruct Digits
#
#       Perl solution by Matthias Muth.
#

use v5.36;

my @words = qw( zero one two three four five six seven eight nine );
my %freq;

=for comment
            o n e t w h r u r f i v s x g
    one     1 1 1
    two     1     1 1 
    three       2 1   1 1
    four    1           1 1 1
    five                      
    six                       1 1 1
    seven
    eight
    nine

sub reconstruct_digits( $str ) {
    my @results;
    return @results;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "zroezerotwowtwotwo", "00222" ],
    [ "Example 2", "esveeneinght", "78" ],
    [ "Example 3", "oneenineeninefive", "1599" ],
    [ "Example 4", "zeroonetwothreerightfivesixsevenninefour", "0123456789" ],
    [ "Example 5", "ninenineninenine", "9999" ],
);

run( "reconstruct_digits", \@tests );

__END__
is reconstruct_digits( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
