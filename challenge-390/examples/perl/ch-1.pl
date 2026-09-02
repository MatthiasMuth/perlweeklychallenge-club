#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 390 Task 1: IPv4 Address
#
#       Perl solution template.
#       Uses test data extracted from the challenge task examples
#       to test the solution during development.
#       (Template by Matthias Muth)
#

use v5.20;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

sub ipv4_address( $str ) {
    my @results;
    return \@results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "0000", ["0.0.0.0"] ],
    [ "Example 2",
        "101023",
        ["1.0.10.23", "1.0.102.3", "10.1.0.23", "10.10.2.3", "101.0.2.3"] ],
    [ "Example 3", "255255255255", ["255.255.255.255"] ],
    [ "Example 4", "999999999", [] ],
    [ "Example 5", "010010", ["0.10.0.10", "0.100.1.0"] ],
);

is [ ipv4_address( $_->[1] ) ], $_->[2], $_->[0]
    for @tests;

done_testing;