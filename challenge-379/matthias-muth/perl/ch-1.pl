#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 379 Task 1: Reverse String
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub reverse_string_destructive( $str ) {
    my $reversed = "";
    $reversed .= substr( $str, -1, 1, "" )
        while length $str > 0;
    return $reversed;
}

sub reverse_string_non_d( $str ) {
    my $reversed = "";
    $reversed .= substr( $str, length( $str ) - $_, 1 )
        for 1 .. length( $str );
    return $reversed;
}

sub reverse_string_non_d_minus( $str ) {
    my $reversed = "";
    $reversed .= substr( $str, -$_, 1 )
        for 1 .. length( $str );
    return $reversed;
}

sub reverse_string_prepend( $str ) {
    my $reversed = "";
    $reversed = $_ . $reversed
        for split "", $str;
    return $reversed;
}

sub reverse_string_substr( $str ) {
    my $reversed = "";
    substr( $reversed, 0, 0, $_ )
        for split "", $str;
    return $reversed;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "", "" ],
    [ "Example 2", "reverse the given string", "gnirts nevig eht esrever" ],
    [ "Example 3", "Perl is Awesome", "emosewA si lreP" ],
    [ "Example 4", "v1.0.0-Beta!", "!ateB-0.0.1v" ],
    [ "Example 5", "racecar", "racecar" ],
);

my @benchmark_data = ( $tests[1][2] );

run( "reverse_string", \@tests, \@benchmark_data );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is reverse_string( $_->[1] ), $_->[2], $_->[0]
    for @tests;
done_testing;
