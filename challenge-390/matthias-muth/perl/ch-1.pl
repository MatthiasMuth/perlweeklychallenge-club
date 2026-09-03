#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 390 Task 1: IPv4 Address
#
#       Perl solution by Matthias Muth.
#

use v5.36;

my @octet_patterns = (
    qr( \d )x,
    qr( [1-9]\d )x,
    qr( 1\d\d | 2[0-4]\d | 25[0-5] )x,
);

sub split_octets( $str, $n, $prefix = undef ) {
    return 
        $n == 0
        ? ( $str eq "" ? $prefix : () )
        : map {
            $str =~ /^($_)(.*)/
            ? split_octets( $2, $n - 1,
                defined $prefix ? "$prefix.$1" : "$1" )
            : ()
        } @octet_patterns;
}

sub ipv4_address( $str ) {
    return split_octets( $str, 4 );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "0000", ["0.0.0.0"] ],
    [ "Example 2",
        "101023",
        ["1.0.10.23", "1.0.102.3", "10.1.0.23", "10.10.2.3", "101.0.2.3"] ],
    [ "Example 3", "255255255255", ["255.255.255.255"] ],
    [ "Example 4", "999999999", [] ],
    [ "Example 5", "010010", ["0.10.0.10", "0.100.1.0"] ],
    [ "Own Test 1:", "00000", [] ],
    [ "Own Test 2:", "000", [] ],
    [ "Own Test 3:", "", [] ],
);

run( "ipv4_address", \@tests );

__END__
is [ ipv4_address( $_->[1] ) ], $_->[2], $_->[0]
    for @tests;

done_testing;
